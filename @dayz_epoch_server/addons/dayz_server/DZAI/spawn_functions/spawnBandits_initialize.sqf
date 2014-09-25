/*
	spawnBandits_initialize

*/

private ["_minAI","_addAI","_patrolDist","_trigger","_equipType","_numGroups","_triggerPos","_locationArray","_positionArray","_startTime","_triggerStatements","_newTrigger"];

if (!isServer) exitWith {};

_startTime = diag_tickTime;

_minAI = _this select 0;									//Mandatory minimum number of AI units to spawn
_addAI = _this select 1;									//Maximum number of additional AI units to spawn
_patrolDist = _this select 2;								//Patrol radius from trigger center.
_trigger = _this select 3;									//The trigger calling this script.
_positionArray = _this select 4;							//Array of manually-defined spawn points (markers). If empty, nearby buildings are used as spawn points.
_equipType = if ((count _this) > 5) then {_this select 5} else {1};		//(Optional) Select the item probability table to use
_numGroups = if ((count _this) > 6) then {_this select 6} else {1};		//(Optional) Number of groups of x number of units each to spawn

_triggerPos = ASLtoATL getPosASL _trigger;
_locationArray = [];
//If no markers specified in position array, then generate spawn points using building positions (search for buildings within 250m. generate a maximum of 150 positions).
if ((count _positionArray) == 0) then {
	private["_nearbldgs"];
	_nearbldgs = _triggerPos nearObjects ["HouseBase",250];
	{
		scopeName "bldgloop";
		_pos = ASLtoATL getPosASL _x;
		if (!(surfaceIsWater _pos)) then {
			_locationCount = (count _locationArray);
			_locationArray set [_locationCount,_pos];
			if (_locationCount >= 150) then {
				breakOut "bldgloop";
			};
		};
	} count _nearbldgs;
	if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Spawn trigger %1 is generating spawn positions from nearby buildings.",triggerText _trigger];};
} else {
	{
		if (((getMarkerColor _x) != "") && {!(surfaceIsWater _pos)}) then {
			_locationArray set [(count _locationArray),_pos];
			deleteMarker _x;
		};
	} count _positionArray;
	if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Spawn trigger %1 is generating spawn positions from provided markers.",triggerText _trigger];};
};

_newTrigger = createTrigger ["EmptyDetector", _triggerPos];
_newTrigger setTriggerArea [600, 600, 0, false];
_newTrigger setTriggerActivation ["ANY", "PRESENT", true];
_newTrigger setTriggerTimeout [10, 15, 20, true];
_newTrigger setTriggerText (triggerText _trigger);
_triggerStatements = [
	"{isPlayer _x} count thisList > 0;",	//Activation condition
	format ["_nul = [%1,%2,%3,thisTrigger,%4,%5,%6] call fnc_spawnBandits;",_minAI,_addAI,_patrolDist,_positionArray,_equipType,_numGroups], //Activation statement
	"_nul = [thisTrigger] spawn fnc_despawnBandits;" //Deactivation statement
]; 
_newTrigger setVariable ["respawnLimit",(missionNamespace getVariable ["DZAI_respawnLimit"+str(_equipType),5])];
_newTrigger setTriggerStatements _triggerStatements;
0 = [_newTrigger,[],_patrolDist,_equipType,_locationArray,[_minAI,_addAI]] call DZAI_setTrigVars;
//diag_log format ["DEBUG :: Created trigger %1 has statements %2.",triggerText _newTrigger,triggerStatements _newTrigger];
//diag_log format ["DEBUG :: Created trigger %1 has saved statements %2.",triggerText _newTrigger,(_newTrigger getVariable "triggerStatements")];

deleteVehicle _trigger;

if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Processed static trigger spawn data in %1 seconds (spawnBandits).",(diag_tickTime - _startTime)];};

true
