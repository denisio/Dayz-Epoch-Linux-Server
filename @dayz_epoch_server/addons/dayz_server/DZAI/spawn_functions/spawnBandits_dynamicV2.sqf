/*
	spawnBandits_dynamic

	Usage: Called by an activated dynamic trigger when a player unit enters the trigger area.
	
	Description: Spawns a group of AI units some distance from a dynamically-spawned trigger. These units do not respawn after death.
	
	Last updated: 10:58 PM 6/6/2014
*/

private ["_patrolDist","_trigger","_totalAI","_unitGroup","_targetPlayer","_playerPos","_playerDir","_spawnPos","_startTime","_baseDist","_distVariance","_dirVariance","_behavior","_triggerStatements","_spawnDist"];
if (!isServer) exitWith {};

_startTime = diag_tickTime;

_patrolDist = _this select 0;
_trigger = _this select 1;

_targetPlayer = _trigger getVariable ["targetplayer",objNull];
if (isNull _targetPlayer) exitWith {
	if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Cancelling dynamic spawn for target player. Reason: Player does not exist (logged out?).",name _targetPlayer]};
	_nul = _trigger call DZAI_abortDynSpawn;
	
	false
};

_baseDist = 200;		//On foot distance: 200-275
_distVariance = 75;
_dirVariance = 90;
if (!((vehicle _targetPlayer) isKindOf "Man")) then {
	_baseDist = _baseDist - 50;	//In vehicle distance: 150-225m
	_dirVariance = 67.5;
};

_playerPos = ASLtoATL getPosASL _targetPlayer;
_playerDir = getDir _targetPlayer;
_spawnDist = (_baseDist + random (_distVariance));
_spawnPos = [_playerPos,_spawnDist,[(_playerDir-_dirVariance),(_playerDir+_dirVariance)],0] call SHK_pos;
if (
	(surfaceIsWater _spawnPos) or 
	{({(isPlayer _x) && {_x != _targetPlayer}} count (_spawnPos nearEntities [["CAManBase","LandVehicle"],125])) > 0} or 
	{(_spawnPos in (nearestLocation [_spawnPos,"Strategic"]))}
	) exitWith {
	if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Canceling dynamic spawn for target player %1. Possible reasons: Spawn position has water, player nearby, or is blacklisted.",name _targetPlayer]};
	_nul = _trigger call DZAI_abortDynSpawn;
	
	false
};

//Calculate group weapongrade and spawn units
_weapongrade = DZAI_dynEquipType call DZAI_getWeapongrade;
_totalAI = call {
	if (_weapongrade == 0) exitWith {2 + floor (random 2)}; //2-3 units
	if (_weapongrade == 1) exitWith {2 + floor (random 2)};	//2-3 units
	if (_weapongrade == 2) exitWith {1 + floor (random 2)}; //1-2 units
	if (_weapongrade == 3) exitWith {1 + floor (random 2)};	//1-2 units
	1
};

_unitGroup = [_totalAI,grpNull,_spawnPos,_trigger,_weapongrade] call DZAI_setup_AI;

//Set group variables
_unitGroup setVariable ["unitType","dynamic"];
_unitGroup setBehaviour "AWARE";
//_unitGroup setCombatMode "RED"; //Handled by fn_createGroup.sqf
_unitGroup setSpeedMode "FULL";
_unitGroup allowFleeing 0;

//Begin hunting player or patrolling area
_behavior = if ((random 1) < DZAI_huntingChance) then {
	//Reveal target player and nearby players to AI, and set group direction to face target player
	_unitGroup setFormDir ([(leader _unitGroup),_targetPlayer] call BIS_fnc_dirTo);
	_unitGroup reveal [_targetPlayer,4];
	0 = [_unitGroup,_spawnPos,_patrolDist,_targetPlayer,ASLtoATL getPosASL _trigger] spawn DZAI_dyn_huntPlayer;
	"HUNTING"
} else {
	0 = [_unitGroup,_playerPos,_patrolDist] spawn DZAI_BIN_taskPatrol;
	"PATROLLING"
};
if (DZAI_debugLevel > 0) then {
	diag_log format["DZAI Debug: Spawned 1 new AI groups of %1 units each in %2 seconds at %3 using behavior mode %4. Distance from target: %5 meters.",_totalAI,(diag_tickTime - _startTime),(mapGridPosition _trigger),_behavior,_spawnDist];
};

_triggerStatements = (triggerStatements _trigger);
if (!(_trigger getVariable ["initialized",false])) then {
	0 = [_trigger,[_unitGroup]] call DZAI_setTrigVars; //set dynamic trigger variables and create dynamic area blacklist
	_trigger setVariable ["triggerStatements",+_triggerStatements];
};
_triggerStatements set [1,""];
_trigger setTriggerStatements _triggerStatements;
_trigger call DZAI_updDynSpawnCount;

if ((!isNil "DZAI_debugMarkersEnabled") && {DZAI_debugMarkersEnabled}) then {
	_nul = _trigger spawn {
		_marker = str(_this);
		_marker setMarkerColor "ColorOrange";
		_marker setMarkerAlpha 0.9;				//Dark orange: Activated trigger
	};
};

true
