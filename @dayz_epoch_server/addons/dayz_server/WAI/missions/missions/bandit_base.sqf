//Bandit Base
//Credits to Korbi Dallas for the information on setDir for the placement of nests
 
private ["_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];
vehclass = military_unarmed call BIS_fnc_selectRandom;
 
_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;

//Extra Large Gun Box
 _box = createVehicle ["RUVehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
[_box] call Extra_Large_Gun_Box;
 
diag_log format["WAI: Mission Band BAse Started At %1",_position];


//Buildings 
_baserunover = createVehicle ["land_fortified_nest_big",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover setDir 90;
_baserunover setVectorUp surfaceNormal position _baserunover;
_baserunover1 = createVehicle ["land_fortified_nest_big",[(_position select 0) + 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover1 setDir 270;
_baserunover1 setVectorUp surfaceNormal position _baserunover1;
_baserunover2 = createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) - 40,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 setDir 0;
_baserunover2 setVectorUp surfaceNormal position _baserunover2;
_baserunover3 = createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) + 40,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover3 setDir 180;
_baserunover3 setVectorUp surfaceNormal position _baserunover3;
_baserunover4 = createVehicle ["Land_Fort_Watchtower",[(_position select 0) - 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover4 setDir 0;
_baserunover4 setVectorUp surfaceNormal position _baserunover4;
_baserunover5 = createVehicle ["Land_Fort_Watchtower",[(_position select 0) + 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
_baserunover5 setDir 180;
_baserunover5 setVectorUp surfaceNormal position _baserunover5;
_baserunover6 = createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover6 setDir 270;
_baserunover6 setVectorUp surfaceNormal position _baserunover6;
_baserunover7 = createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover7 setDir 90;
_baserunover7 setVectorUp surfaceNormal position _baserunover7;

//Group Spawning
_rndnum = round (random 3) + 4;
[[_position select 0, _position select 1, 0],_rndnum,1,"Random",4,"","FR_OHara_DZ","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","FR_OHara_DZ","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","FR_OHara_DZ","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","FR_OHara_DZ","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","FR_OHara_DZ","Random",true] call spawn_group;
 
//Humvee Patrol
[[(_position select 0) + 40, _position select 1, 0],[(_position select 0) + 40, _position select 1, 0],50,2,"HMMWV_Armored",1] spawn vehicle_patrol;
 
//Turrets
[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG",0.8,"FR_OHara_DZ",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG",0.8,"FR_OHara_DZ",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"M2StaticMG",0.8,"FR_OHara_DZ",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG",0.8,"FR_OHara_DZ",1,2,"","Random",true] call spawn_static;

//Heli Paradrop
[[(_position select 0), (_position select 1), 0],[7743.41, 7040.93, 0],400,"UH1H_DZ",10,1,"Random",4,"","USMC_Soldier_Pilot","Random",True] spawn heli_para;
 
[_position,"Bandit Base"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"A jungle task force have set up a temporary encampment! Go and ambush it to make it yours!!", "PLAIN",10] call RE;
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
	diag_log format["WAI: Mission BaseBandit Ended At %1",_position];
	[nil,nil,rTitleText,"Survivors captured the base, HOOAH!!", "PLAIN",10] call RE;
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
 
	diag_log format["WAI: Mission Base Bandit At %1",_position];
	[nil,nil,rTitleText,"The survivors were unable to capture the base time is up!", "PLAIN",10] call RE;
};
 
missionrunning = false;
