/*
	spawnBandits_custom
	
	Usage: 
	
	Description: DZAI custom spawn function (DZAI_spawn).
	
	Last updated: 6:00 PM 10/24/2013
*/

private ["_patrolDist","_trigger","_grpArray","_triggerPos","_equipType","_weapongrade","_totalAI","_startTime","_tMarker","_unitGroup","_spawnPos","_totalAI"];
if (!isServer) exitWith {};

_startTime = diag_tickTime;

_totalAI = _this select 0;									
//_this select 1;
_patrolDist = _this select 2;								
_trigger = _this select 3;									
_weapongrade = _this select 4;
//_spawnMarker = _this select 5;

_grpArray = _trigger getVariable ["GroupArray",[]];	
if (count _grpArray > 0) exitWith {if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Active groups found at %1. Exiting spawn script (spawnBandits)",(triggerText _trigger)];};};						

_trigger setTriggerArea [750,750,0,false];
_triggerPos = ASLtoATL getPosASL _trigger;

if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Processed static trigger spawn data in %1 seconds (spawnBandits).",(diag_tickTime - _startTime)];};

_startTime = diag_tickTime;

if !(_trigger getVariable ["respawn",true]) then {
	_maxUnits = _trigger getVariable ["maxUnits",[0,0]];
	_totalAINew = (_maxUnits select 0);
	if (_totalAINew > 0) then {_totalAI = _totalAINew};	//Retrieve AI amount if it was updated from initial value (for non-respawning custom spawns only)
};
_spawnPos = [(ASLtoATL getPosASL _trigger),random (_patrolDist),random(360),0] call SHK_pos;
_unitGroup = [_totalAI,grpNull,_spawnPos,_trigger,_weapongrade] call DZAI_setup_AI;

//Set group variables
_unitGroup setVariable ["unitType","static"];
_unitGroup allowFleeing 0;

if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Group %1 has group size %2.",_unitGroup,_totalAI];};

if (_patrolDist > 1) then {
	0 = [_unitGroup,_triggerPos,_patrolDist] spawn DZAI_BIN_taskPatrol;
} else {
	[_unitGroup, 0] setWaypointType "HOLD";
	_unitGroup setFormDir (random 360);
};

if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Spawned a group of %1 units in %2 seconds at %3 (spawnBandits).",_totalAI,(diag_tickTime - _startTime),(triggerText _trigger)];};

_equipType = if (_weapongrade in DZAI_weaponGrades) then {(_weapongrade max 0)} else {3};
_grpArray set [count _grpArray,_unitGroup];

_triggerStatements = (triggerStatements _trigger);
if (!(_trigger getVariable ["initialized",false])) then {
	0 = [_trigger,_grpArray,_patrolDist,_equipType,[],[_totalAI,0]] call DZAI_setTrigVars;
	_trigger setVariable ["triggerStatements",+_triggerStatements];
} else {
	_trigger setVariable ["isCleaning",false];
	_trigger setVariable ["maxUnits",[_totalAI,0]];
	if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Trigger group array updated to: %1.",_grpArray]};
};
_triggerStatements set [1,""];
_trigger setTriggerStatements _triggerStatements;
_trigger call DZAI_updStaticSpawnCount;

if ((!isNil "DZAI_debugMarkersEnabled") && {DZAI_debugMarkersEnabled}) then {
	_nul = [_trigger] spawn DZAI_updateSpawnMarker;
};

_unitGroup
