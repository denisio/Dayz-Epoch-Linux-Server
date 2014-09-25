/*
	respawnBandits
	
	Usage: [_unitGroup,_trigger,_maxUnits] call respawnBandits;
	
	Description: Called internally by fnc_banditAIRespawn. Calls fnc_createAI to respawn a unit near a randomly selected building from a stored reference location.
	
	Last updated: 8:38 AM 10/23/2013
*/

private ["_unitGroup","_trigger","_grpArray","_patrolDist","_equipType","_spawnPositions","_spawnPos","_unit","_pos","_startTime","_maxUnits","_totalAI","_aiGroup","_weapongrade"];
if (!isServer) exitWith {};

_startTime = diag_tickTime;

_unitGroup = _this select 0;
_trigger = _this select 1;
_maxUnits = _this select 2;

_patrolDist = _trigger getVariable ["patrolDist",150];
_equipType = _trigger getVariable ["equipType",1];
_spawnPositions = _trigger getVariable ["locationArray",[]];

_totalAI = ((_maxUnits select 0) + round(random (_maxUnits select 1)));

if (_totalAI == 0) exitWith {
	[0,_trigger,_unitGroup,true] call fnc_respawnHandler;
	false
};

//Select spawn position
_spawnPos = if ((count _spawnPositions) > 0) then {_spawnPositions call DZAI_findSpawnPos} else {[(ASLtoATL getPosASL _trigger),random (_patrolDist),random(360),0] call SHK_pos};
if ((count _spawnPos) == 0) exitWith {
	[0,_trigger,_unitGroup,true] call fnc_respawnHandler;
	false
};

//Respawn the group
_weapongrade = _equipType call DZAI_getWeapongrade;
_aiGroup = [_totalAI,_unitGroup,_spawnPos,_trigger,_weapongrade] call DZAI_setup_AI;
if (isNull _unitGroup) then {diag_log format ["DZAI Error :: Respawned group at %1 was null group. New group reassigned: %2.",triggerText _trigger,_aiGroup]; _unitGroup = _aiGroup};

if (_patrolDist > 1) then {
	if ((count (waypoints _unitGroup)) > 1) then {
		_unitGroup setCurrentWaypoint ((waypoints _unitGroup) call BIS_fnc_selectRandom2);
	} else {
		_nul = [_unitGroup,(ASLtoATL getPosASL _trigger),_patrolDist] spawn DZAI_BIN_taskPatrol;
	};
} else {
	[_unitGroup, 0] setWaypointType "HOLD";
	_unitGroup setFormDir (random 360);
};

if ((!isNil "DZAI_debugMarkersEnabled") && {DZAI_debugMarkersEnabled}) then {
	if ((getMarkerColor (str _trigger)) == "ColorGreen") then {
		_nul = [_trigger] spawn DZAI_updateSpawnMarker;
	};
};
if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: %1 AI units respawned for group %2 (weapongrade %3) at %4 in %5 seconds (respawnBandits).",_totalAI,_unitGroup,_weapongrade,(triggerText _trigger),diag_tickTime - _startTime];};

true
