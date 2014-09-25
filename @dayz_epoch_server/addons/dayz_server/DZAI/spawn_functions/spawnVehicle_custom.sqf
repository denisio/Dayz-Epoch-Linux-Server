private ["_marker","_vehicleType","_weapongrade","_unitGroup","_driver","_vehicle","_gunnerSpots","_markerPos","_markerSize","_isAirVehicle","_unitType","_vehSpawnPos","_isArmed","_maxUnits","_maxCargoUnits","_maxGunnerUnits","_keepLooking"];

if (!isServer) exitWith {};

_marker = _this select 0;
_vehicleType = _this select 1;
_maxUnits = _this select 2;
_weapongrade = _this select 3;
//_respawnSelect = _this select 4; //Value not used in this script. Holds respawn settings.

//Calculate needed values
_markerPos = (getMarkerPos _marker);
if ((markerAlpha _marker) > 0) then {_marker setMarkerAlpha 0};
_markerSize = ((getMarkerSize _marker) select 0);
_maxCargoUnits = _maxUnits select 0;
_maxGunnerUnits = _maxUnits select 1;

_isAirVehicle = (_vehicleType isKindOf "Air");
_vehSpawnPos = [];
_roadSearching = 1; //SHK_pos will search for roads, and return random position if none found.
_waterPosAllowed = 0; //do not allow water position for land vehicles.
_spawnMode = "NONE";

if (_isAirVehicle) then {
	_roadSearching = 0;	//No need to search for road positions for air vehicles
	_waterPosAllowed = 1; //Allow water position for air vehicles
	_spawnMode = "FLY"; //set flying mode for air vehicles
	_vehSpawnPos set [2,180]; //spawn air vehicles in air
	_markerPos set [2,150]; //set marker height in air
	if (_maxCargoUnits != 0) then {_maxCargoUnits = 0}; //disable cargo units for air vehicles
};

_keepLooking = true;
_waitTime = 10;
while {_keepLooking} do {
	_vehSpawnPos = [_markerPos,random _markerSize,random(360),_waterPosAllowed,[_roadSearching,200]] call SHK_pos;
	if (({isPlayer _x} count (_vehSpawnPos nearEntities [["CAManBase","Land","Air"],300])) == 0) then {
		_keepLooking = false; //safe area found, continue to spawn the vehicle and crew
	} else {
		if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Waiting %1 seconds for area at %2 to have no players nearby to spawn custom AI vehicle %3.",_waitTime,_marker,_vehicleType]};
		uiSleep _waitTime; //wait a while before checking spawn area again. Scaling wait time from 10-30 seconds.
		_waitTime = ((_waitTime + 5) min 60);
	};
};

_unitGroup = [] call DZAI_createGroup;
_driver = _unitGroup createUnit [(DZAI_BanditTypes call BIS_fnc_selectRandom2), [0,0,0], [], 1, "NONE"];
[_driver] joinSilent _unitGroup;

_vehicle = createVehicle [_vehicleType, _vehSpawnPos, [], 0, _spawnMode];
_vehicle setPos _vehSpawnPos;

//Run needed commands to set up group vehicle
_vehicle setFuel 1;
_vehicle setVehicleAmmo 1;
_vehicle engineOn true;
_nul = _vehicle call DZAI_protectObject;
if !(_vehicle isKindOf "Plane") then {_vehicle setDir (random 360)};

//Set variables
_vehicle setVariable ["unitGroup",_unitGroup];

//Determine vehicle armed state
_turretCount = count (configFile >> "CfgVehicles" >> _vehicleType >> "turrets");
_isArmed = ((({!(_x in ["CarHorn","BikeHorn","TruckHorn","TruckHorn2","SportCarHorn","MiniCarHorn"])} count (weapons _vehicle)) > 0) or {(_turretCount > 0)});

//Determine vehicle type and add needed eventhandlers
if (_isAirVehicle) then {
	_vehicle setVariable ["durability",[0,0,0]];	//[structural, engine, tail rotor]
	_vehicle addEventHandler ["Killed",{_this call DZAI_heliDestroyed;}];					//Begin despawn process when heli is destroyed.
	_vehicle addEventHandler ["GetOut",{_this call DZAI_airLanding;}];	//Converts AI crew to ground AI units.
	_vehicle addEventHandler ["HandleDamage",{_this call DZAI_hHandleDamage}];
} else {
	_vehicle addEventHandler ["Killed",{_this call DZAI_vehDestroyed;}];
	_vehicle addEventHandler ["HandleDamage",{_this call DZAI_vHandleDamage}];
};
_vehicle allowCrewInImmobile (!_isAirVehicle);
_vehicle setVehicleLock "LOCKED";
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;

//Setup group and crew
0 = [_driver,_weapongrade] call DZAI_setSkills;
0 = [_driver,_weapongrade] call DZAI_setupLoadout;
_driver setVariable ["unithealth",[(DZAI_baseBlood + (random DZAI_bonusBlood)),0,false]];
_driver setVariable ["unconscious",false];
_driver setVariable ["bodyName",(name _driver)];
if (!(_driver hasWeapon "NVGoggles")) then {
	_nvg = _driver call DZAI_addTempNVG;
};
_driver addEventHandler [DZAI_healthType, DZAI_healthStatements];
_driver assignAsDriver _vehicle;
_driver moveInDriver _vehicle;
_driver setVariable ["isDriver",true];
_unitGroup selectLeader _driver;

if (_isAirVehicle) then {_vehicle flyInHeight 115};

_cargoSpots = _vehicle emptyPositions "cargo";
for "_i" from 0 to ((_cargoSpots min _maxCargoUnits) - 1) do {
	_cargo = _unitGroup createUnit [(DZAI_BanditTypes call BIS_fnc_selectRandom2), [0,0,0], [], 1, "NONE"];
	[_cargo] joinSilent _unitGroup;
	0 = [_cargo,_weapongrade] call DZAI_setSkills;
	0 = [_cargo,_weapongrade] call DZAI_setupLoadout;
	_cargo setVariable ["unithealth",[(DZAI_baseBlood + (random DZAI_bonusBlood)),0,false]];
	_cargo setVariable ["unconscious",false];
	_cargo setVariable ["bodyName",(name _cargo)];
	if (!(_cargo hasWeapon "NVGoggles")) then {
		_nvg = _cargo call DZAI_addTempNVG;
	};
	_cargo addEventHandler [DZAI_healthType, DZAI_healthStatements];
	_cargo assignAsCargo _vehicle;
	_cargo moveInCargo [_vehicle,_i];
};
if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Spawned %1 cargo units for %2 vehicle %3.",(_cargoSpots min _maxCargoUnits),_unitGroup,_vehicleType]};
	
for "_i" from 0 to ((_turretCount min _maxGunnerUnits) - 1) do {
	_gunner = _unitGroup createUnit [(DZAI_BanditTypes call BIS_fnc_selectRandom2), [0,0,0], [], 1, "NONE"];
	[_gunner] joinSilent _unitGroup;
	0 = [_gunner,_weapongrade] call DZAI_setSkills;
	0 = [_gunner,_weapongrade] call DZAI_setupLoadout;
	_gunner setVariable ["unithealth",[(DZAI_baseBlood + (random DZAI_bonusBlood)),0,false]];
	_gunner setVariable ["unconscious",false];
	_gunner setVariable ["bodyName",(name _gunner)];
	if (!(_gunner hasWeapon "NVGoggles")) then {
		_nvg = _gunner call DZAI_addTempNVG;
	};
	_gunner addEventHandler [DZAI_healthType, DZAI_healthStatements];
	_gunner assignAsGunner _vehicle;
	_gunner moveInTurret [_vehicle,[_i]];
};
if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Spawned %1 gunner units for %2 vehicle %3.",(_turretCount min _maxGunnerUnits),_unitGroup,_vehicleType]};

_unitGroup allowFleeing 0;
_unitGroup setBehaviour "AWARE";
_unitGroup setSpeedMode "NORMAL";
_unitGroup setCombatMode "YELLOW";

_unitType = if (_isAirVehicle) then {"aircustom"} else {"landcustom"};
_unitGroup setVariable ["unitType",_unitType];
_unitGroup setVariable ["weapongrade",_weapongrade];
_unitGroup setVariable ["assignedVehicle",_vehicle];
_unitGroup setVariable ["isArmed",_isArmed];
_unitGroup setVariable ["spawnParams",_this];
[_unitGroup,0] setWaypointPosition [_markerPos,0];		//Move group's initial waypoint position away from [0,0,0] (initial spawn position).
(units _unitGroup) allowGetIn true;

0 = [_unitGroup,_weapongrade] spawn DZAI_autoRearm_group;
0 = [_unitGroup,_markerPos,_markerSize,false] spawn DZAI_BIN_taskPatrol;

if (_isAirVehicle) then {
	_awareness = [_vehicle,_unitGroup] spawn DZAI_heliAwareness;
	if (!_isArmed) then {
		_index = (DZAI_airWeapons select 0) find _vehicleType;
		if (_index > -1) then {
			_vehWeapon = (DZAI_airWeapons select 1) select _index;
			if ([_vehWeapon,"weapon"] call DZAI_checkClassname) then {
				_vehicle addWeapon _vehWeapon;
				_vehMag = getArray (configFile >> "CfgWeapons" >> _vehWeapon >> "magazines") select 0;
				_vehicle addMagazine _vehMag;
				if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Added weapon %1 and ammo %2 to AI %3 (Group: %1).",_vehWeapon,_vehMag,_vehicleType,_unitGroup]};
			};
		};
	};
	if ((!isNull _vehicle) && {!isNull _unitGroup}) then {
		DZAI_curHeliPatrols = DZAI_curHeliPatrols + 1;
		if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Custom AI helicopter crew group %1 is now active and patrolling.",_unitGroup];};
	};
} else {
	if ((!isNull _vehicle) && {!isNull _unitGroup}) then {
		DZAI_curLandPatrols = DZAI_curLandPatrols + 1;
		if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Custom AI land vehicle crew group %1 is now active and patrolling.",_unitGroup];};
	};
};

if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Created custom vehicle spawn at %1 with vehicle type %2 with %3 crew units.",_marker,_vehicleType,(count (units _unitGroup))]};

true
