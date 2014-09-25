private ["_currenttime","_starttime","_playerPresent","_cleanmission","_missiontimeout","_guaranteedLoot","_randomizedLoot","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_fadeFire","_crashModel","_lootTable","_crashName","_spawnRoll","_position","_crash","_config","_hasAdjustment","_newHeight","_adjustedPos","_num","_itemTypes","_index","_weights","_cntWeights","_nearby","_itemType"];

_guaranteedLoot = 25;
_randomizedLoot = 10;
//_spawnChance =  0.75;
_spawnMarker = 'center';
// _spawnRadius = 5000;
_spawnRadius = HeliCrashArea;
_spawnFire = true;
_fadeFire = false;
missionrunning = true;
	
_crashModel = ["UH60Wreck_DZ","UH1Wreck_DZ"] call BIS_fnc_selectRandom;

_lootTable = "HeliCrash";

_crashName	= getText (configFile >> "CfgVehicles" >> _crashModel >> "displayName");

_position = [getMarkerPos _spawnMarker,0,5500,10,0,2000,0] call BIS_fnc_findSafePos;

//diag_log(format["CRASHSPAWNER: Spawning '%1' with loot table '%2' NOW! (%3) at: %4", _crashName, _lootTable, time, str(_position)]);
diag_log format["WAI: Mission Crash_Spawner Started At %1",_position];

_crash = createVehicle [_crashModel,_position, [], 0, "CAN_COLLIDE"];
// Randomize the direction the wreck is facing
_crash setDir round(random 360);


// Using "custom" wrecks (using the destruction model of a vehicle vs. a prepared wreck model) will result
// in the model spawning halfway in the ground.  To combat this, an OPTIONAL configuration can be tied to
// the CfgVehicles class you've created for the custom wreck to define how high above the ground it should
// spawn.  This is optional.
_config = configFile >> "CfgVehicles" >> _crashModel >> "heightAdjustment";
_hasAdjustment =  isNumber(_config);
_newHeight = 0;
if (_hasAdjustment) then {
	_newHeight = getNumber(_config);
};

// Must setPos after a setDir otherwise the wreck won't level itself with the terrain
_adjustedPos = [(_position select 0), (_position select 1), _newHeight];
//diag_log(format["DIAG: Designated Position: %1", str(_adjustedPos)]);
_crash setPos _adjustedPos;

// I don't think this is needed (you can't get "in" a crash), but it was in the original DayZ Crash logic
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_crash];

_crash setVariable ["ObjectID","1",true];

// Disable simulation server side
_crash enableSimulation false;

_num = round(random _randomizedLoot) + _guaranteedLoot;


if (_spawnFire) then {
	//["PVDZE_obj_Fire",[_crash,2,time,false,_fadeFire]] call broadcastRpcCallAll;
	PVDZE_obj_Fire = [_crash,2,time,false,_fadeFire];
	publicVariable "PVDZE_obj_Fire";
	_crash setvariable ["fadeFire",_fadeFire,true];
};

_config = 		configFile >> "CfgBuildingLoot" >> _lootTable;
_itemTypes =	[] + getArray (_config >> "itemType");
_index =        dayz_CBLBase find toLower(_lootTable);
_weights =		dayz_CBLChances select _index;
_cntWeights = count _weights;

for "_x" from 1 to _num do {
	//create loot
	_index = floor(random _cntWeights);
	_index = _weights select _index;
	_itemType = _itemTypes select _index;
	[_itemType select 0, _itemType select 1, _position, 5] call spawn_loot;
	//diag_log(format["CRASHSPAWNER: Loot spawn at '%1' with loot table '%2'", _crashName, _lootTable]); 
};

// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 and other such items.
_nearby = _position nearObjects ["ReammoBox", sizeOf(_crashModel)];
{
	_x setVariable ["permaLoot",true];
} forEach _nearBy;
_rndnum = round (random 3) + 5;
[[_position select 0, _position select 1, 0],                  //position

_rndnum,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Bandit2_DZ",						  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true						// mission true
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Bandit2_DZ",						  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true						// mission true
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
4,						  //Number Of units
1,					      //Skill level 0-1. Has no effect if using custom skills
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Bandit2_DZ",						  //Skin "" for random or classname here.
"Random",				  //Gearset number. "Random" for random gear set.
true						// mission true
] call spawn_group;

if ((random 3) < 1) then {
	[[[(_position select 0), (_position select 1) + 10, 0]], //position(s) (can be multiple).
	"M2StaticMG",             //Classname of turret
	0.5,					  //Skill level 0-1. Has no effect if using custom skills
	"Bandit2_DZ",				          //Skin "" for random or classname here.
	1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
	2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
	"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
	"Random",				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
	true						// mission true
	] call spawn_static;  
};
[_position,"Chopper Crash"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"Bandits have crashed a chopper! Check your map for the location!", "PLAIN",10] call RE;

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	sleep 5;
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 100)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	waitUntil
	{
		sleep 5;
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 30)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Crash_Spawner Ended At %1",_position];
	[nil,nil,rTitleText,"Survivors have secured the crash site!", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
	deleteVehicle _crash;
	{_cleanunits = _x getVariable "missionclean";
	if (!isNil "_cleanunits") then {
		switch (_cleanunits) do {
			case "ground" :  {ai_ground_units = (ai_ground_units -1);};
			case "air" :     {ai_air_units = (ai_air_units -1);};
			case "vehicle" : {ai_vehicle_units = (ai_vehicle_units -1);};
			case "static" :  {ai_emplacement_units = (ai_emplacement_units -1);};
		};
		deleteVehicle _x;
		sleep 0.05;
	};	
	} forEach allUnits;
	
	diag_log format["WAI: Mission Crash_Spawner Timed Out At %1",_position];
	[nil,nil,rTitleText,"Survivors did not secure the crash site in time!", "PLAIN",10] call RE;
};

missionrunning = false;
