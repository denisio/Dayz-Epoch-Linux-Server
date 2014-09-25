//Weapon Cache ported from EMS 1st Testpreview

private ["_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];
_vehclass = ["SUV_Camo","UAZ_Unarmed_UN_EP1"] call BIS_fnc_selectRandom;

_vehname	= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");
_position = [getMarkerPos "center",0,5800,10,0,200,0] call BIS_fnc_findSafePos;
diag_log format["WAI: Mission Weapon Cache Started At %1",_position];

_box = createVehicle ["BAF_VehicleBox",[(_position select 0) - 40,(_position select 1) - 40,0], [], 0, "CAN_COLLIDE"];
[_box] call Medium_Gun_Box;

//SUV_Camo/UAZ_Unarmed_UN_EP1
_veh = createVehicle [_vehclass,_position, [], 0, "CAN_COLLIDE"];
_vehdir = round(random 360);
_veh setDir _vehdir;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: Mission Weapon Cache spawned a %1",_vehname];

_objPosition = getPosATL _veh;
//[_veh,[_vehdir,_objPosition],_vehclass,true,"0"] call custom_publish;

//Troops
_rndnum = round (random 3) + 4;
[[_position select 0, _position select 1, 0],_rndnum,1,"Random",6,"","Bandit2_DZ","Random",true] call spawn_group;
     
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","Bandit2_DZ","Random",true] call spawn_group;

[[[(_position select 0), (_position select 1) + 30, 0],[(_position select 0) + 30, (_position select 1), 0]],"M2StaticMG",0.8,"Bandit2_DZ",2,2,"","Random",true] call spawn_static;


[_position,"Weapon cache"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"Bandits have obtained a weapon crate! Check your map for the location!", "PLAIN",10] call RE;

_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	sleep 5;
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 150)) then {_playerPresent = true};}forEach playableUnits;
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
	diag_log format["WAI: Mission Weapon Cache Ended At %1",_position];
	[nil,nil,rTitleText,"Survivors have secured the weapon cache!", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
	deleteVehicle _box;
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
	
	diag_log format["WAI: Mission Weapon Cache timed out At %1",_position];
	[nil,nil,rTitleText,"Survivors did not secure the weapon cache in time!", "PLAIN",10] call RE;
};

missionrunning = false;
