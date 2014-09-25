//Medical Supply Camp

private ["_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];
vehclass = military_unarmed call BIS_fnc_selectRandom;
 
_position = [getMarkerPos "center",0,3200,10,0,20,0] call BIS_fnc_findSafePos;

//Large Gun Box
_box = createVehicle ["BAF_VehicleBox",[(_position select 0) + 15,(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
[_box] call Large_Gun_Box;              
 
diag_log format["WAI: Mission Medic Camp Started At %1",_position];

//Medical Supply Camp
_baserunover = createVehicle ["Land_fortified_nest_big",[(_position select 0) +15, (_position select 1) -20,0],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_Fort_Watchtower",[(_position select 0) +25, (_position select 1) +10,0],[], 0, "CAN_COLLIDE"];

_rndnum = round (random 3) + 4;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
 
[_position,"Medical Supply Camp"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"Bandits have set up a medical re-supply camp! Check your map for the location!", "PLAIN",10] call RE;

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
	diag_log format["WAI: Mission Medic Camp Ended At %1",_position];
	[nil,nil,rTitleText,"Survivors have taken control of the medical supply camp.", "PLAIN",10] call RE;
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
 
	diag_log format["WAI: Mission Medic Camp At %1",_position];
	[nil,nil,rTitleText,"The survivors were unable to capture the medical supply camp time is up!", "PLAIN",10] call RE;
};
 
missionrunning = false;
