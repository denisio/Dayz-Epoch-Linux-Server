private ["_marker","_vehicleType","_weapongrade","_unitGroup","_driver","_vehicle","_gunnerSpots","_markerPos","_markerSize","_isAirVehicle","_unitType","_vehSpawnPos","_isArmed","_maxUnits","_maxCargoUnits","_maxGunnerUnits","_keepLooking"];

if (!isServer) exitWith {};

_vehicleType = _this;

_maxCargoUnits = 0;
_maxGunnerUnits = 0;
_weapongrade = 0;
_isAirVehicle = (_vehicleType isKindOf "Air");
_vehSpawnPos = [];
_spawnMode = "NONE";
_keepLooking = true;

if (_vehicleType isKindOf "Air") then {
	//Note: no cargo units for air vehicles
	_maxGunnerUnits = DZAI_heliGunnerUnits;
	_weapongrade = DZAI_heliUnitLevel call DZAI_getWeapongrade;
} else {
	_maxGunnerUnits = DZAI_vehGunnerUnits;
	_maxCargoUnits = DZAI_vehCargoUnits;
	_weapongrade = DZAI_vehUnitLevel call DZAI_getWeapongrade;
};

if (_isAirVehicle) then {
	_vehSpawnPos = [(getMarkerPos "DZAI_centerMarker"),300 + (random((getMarkerSize "DZAI_centerMarker") select 0)),random(360),1] call SHK_pos;
	_vehSpawnPos set [2,150];
	_spawnMode = "FLY";
} else {
	while {_keepLooking} do {
		_vehSpawnPos = [(getMarkerPos "DZAI_centerMarker"),300 + random((getMarkerSize "DZAI_centerMarker") select 0),random(360),0,[2,750]] call SHK_pos;
		if ((count _vehSpawnPos) > 1) then {
			_playerNear = ({isPlayer _x} count (_vehSpawnPos nearEntities ["CAManBase", 200]) > 0);
			if(!_playerNear) then {
				_keepLooking = false;	//Found road position, stop searching
			};
		} else {
			if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Unable to find road position to spawn AI %1. Retrying in 30 seconds.",_vehicleType]};
			uiSleep 30; //Couldnt find road, search again in 30 seconds.
		};
	};
};

_unitGroup = [] call DZAI_createGroup;
_driver = _unitGroup createUnit [(DZAI_BanditTypes call BIS_fnc_selectRandom2), [0,0,0], [], 1, "NONE"];
[_driver] joinSilent _unitGroup;

_vehicle = createVehicle [_vehicleType, _vehSpawnPos, [], 0, _spawnMode];

//Run high-priority commands to set up group vehicle
_vehicle setFuel 1;
_vehicle setVehicleAmmo 1;
_vehicle engineOn true;
_nul = _vehicle call DZAI_protectObject;
if !(_vehicle isKindOf "Plane") then {
	_vehicle setPos _vehSpawnPos;
	_vehicle setDir (random 360);
};

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

_unitType = if (_isAirVehicle) then {"air"} else {"land"};
_unitGroup setVariable ["unitType",_unitType];
_unitGroup setVariable ["weapongrade",_weapongrade];
_unitGroup setVariable ["assignedVehicle",_vehicle];
_unitGroup setVariable ["isArmed",_isArmed];
(units _unitGroup) allowGetIn true;

//If vehicle is air type and unarmed, check if user config has weapons specified.
if (_isAirVehicle && {!_isArmed}) then {
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

_rearm = [_unitGroup,_weapongrade] spawn DZAI_autoRearm_group;	//start group-level manager

if (_isAirVehicle) then {
	//Set initial waypoint and begin patrol
	[_unitGroup,0] setWaypointType "MOVE";
	[_unitGroup,0] setWaypointTimeout [0.5,0.5,0.5];
	[_unitGroup,0] setWaypointCompletionRadius 200;
	[_unitGroup,0] setWaypointStatements ["true","[(group this)] spawn DZAI_heliDetectPlayers;"];

	_waypoint = _unitGroup addWaypoint [_vehSpawnPos,0];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointTimeout [3,6,9];
	_waypoint setWaypointCompletionRadius 150;
	_waypoint setWaypointStatements ["true","[(group this)] spawn DZAI_heliRandomPatrol;"];

	[_unitGroup] spawn DZAI_heliRandomPatrol;
	//if (DZAI_heliReinforceChance > 0) then {_oncall = [_vehicle,_unitGroup] spawn DZAI_heliOnCall}; //helicopter listen for reinforcement summons
	_vehicle flyInHeight 125;
	
	if ((!isNull _vehicle) && {!isNull _unitGroup}) then {
		DZAI_curHeliPatrols = DZAI_curHeliPatrols + 1;
		if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Created AI helicopter crew group %1 is now active and patrolling.",_unitGroup];};
	};
} else {
	//Set initial waypoint and begin patrol
	[_unitGroup,0] setWaypointType "MOVE";
	[_unitGroup,0] setWaypointTimeout [5,10,15];
	[_unitGroup,0] setWaypointCompletionRadius 150;
	[_unitGroup,0] setWaypointStatements ["true","[(group this)] spawn DZAI_vehPatrol;"];
	[_unitGroup] spawn DZAI_vehPatrol;

	if ((!isNull _vehicle) && {!isNull _unitGroup}) then {
		DZAI_curLandPatrols = DZAI_curLandPatrols + 1;
		if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Created AI land vehicle crew group %1 is now active and patrolling.",_unitGroup];};
	};
};

if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Created AI vehicle patrol at %1 with vehicle type %2 with %3 crew units.",_vehSpawnPos,_vehicleType,(count (units _unitGroup))]};

true
