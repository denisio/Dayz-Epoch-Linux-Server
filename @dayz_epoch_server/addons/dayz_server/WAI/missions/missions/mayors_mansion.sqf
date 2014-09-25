//Mayors Mansion

private ["_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];
vehclass = military_unarmed call BIS_fnc_selectRandom;
 
_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;

//Large Gun Box
_box = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1), .5], [], 0, "CAN_COLLIDE"];
[_box] call Large_Gun_Box;
 
diag_log format["WAI: Mission Mayors Mansion Started At %1",_position];

//Mayors Mansion
_baserunover = createVehicle ["Land_A_Villa_EP1",[(_position select 0), (_position select 1),0],[], 0, "CAN_COLLIDE"];

_rndnum = round (random 3) + 4;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;

//The Mayor Himself
[[_position select 0, _position select 1, 0],1,1,"Random",4,"","Functionary1_EP1_DZ","Random",true] call spawn_group;
 
[[[(_position select 0) - 15, (_position select 1) + 15, 8]],"M2StaticMG",0.8,"TK_INS_Soldier_AT_EP1",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) + 15, (_position select 1) - 15, 8]],"M2StaticMG",0.8,"TK_INS_Soldier_AT_EP1",1,2,"","Random",true] call spawn_static;
 
[_position,"Mayors Mansion"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"The Mayor has gone rogue, go take him and his task force out to claim the black market weapons!", "PLAIN",10] call RE;
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
	diag_log format["WAI: Mission Mayors Mansion Ended At %1",_position];
	[nil,nil,rTitleText,"The rogue mayor has been taken out, who will be the next Mayor of Cherno?", "PLAIN",10] call RE;
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
 
	diag_log format["WAI: Mission Mayors Mansion At %1",_position];
	[nil,nil,rTitleText,"The survivors were unable to capture the Mansion time is up!", "PLAIN",10] call RE;
};
 
missionrunning = false;
