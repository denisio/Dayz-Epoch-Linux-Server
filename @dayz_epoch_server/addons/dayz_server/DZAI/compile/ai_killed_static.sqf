/*
	fnc_staticAIDeath

	Usage: [_victim,_killer,_unitGroup] call DZAI_AI_killed_static;
	
	Description: Script is called when an AI unit is killed, and waits for the specified amount of time before respawning the unit into the same group it was part of previously.
	If the killed unit was the last surviving unit of its group, a dummy AI unit is created to occupy the group until a dead unit in the group is respawned.
*/

private ["_victim","_killer","_unitGroup","_trigger","_dummy","_groupIsEmpty"];

_victim = _this select 0;
_killer = _this select 1;
_unitGroup = _this select 2;
_groupIsEmpty = _this select 3;

_trigger = _unitGroup getVariable ["trigger",DZAI_defaultTrigger];

if (_groupIsEmpty) then {
	if (_trigger getVariable ["respawn",true]) then {
		_respawnCount = _trigger getVariable ["respawnLimit",-1];
		if (_respawnCount != 0) then {
			[0,_trigger,_unitGroup] call fnc_respawnHandler; //If there are still respawns possible... respawn the group
			if (_respawnCount > -1) then {
				_trigger setVariable ["respawnLimit",(_respawnCount - 1)]; //If respawns are limited, decrease respawn counter
				if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Respawns remaining for group %1: %2.",_unitGroup,(_unitGroup getVariable ["respawnLimit",-1])];};
			};
		} else {
			_trigger setVariable ["permadelete",true];	//deny respawn and delete trigger on next despawn.
		};
	} else {
		if ((!isNil "DZAI_debugMarkersEnabled") && {DZAI_debugMarkersEnabled}) then {deleteMarker str(_trigger)};
		_nul = _trigger spawn {
			_trigger = _this;
			_trigger setTriggerStatements ["this","true","false"]; //Disable trigger from activating or deactivating while cleanup is performed
			if (DZAI_debugLevel > 0) then {diag_log format["DZAI Debug: Deleting custom-defined AI spawn %1 at %2 in 30 seconds.",triggerText _trigger, mapGridPosition _trigger];};
			uiSleep 30;
			{
				//_x call DZAI_deleteGroup;
				_x setVariable ["GroupSize",-1];
			} forEach (_trigger getVariable ["GroupArray",[]]);
			deleteMarker (_trigger getVariable ["spawnmarker",""]);
			_trigger call DZAI_updStaticSpawnCount;
			deleteVehicle _trigger;
		};
	};
} else {
	if (!(_trigger getVariable ["respawn",true])) then {
		_maxUnits = _trigger getVariable ["maxUnits",[0,0]]; //Reduce maximum AI for spawn trigger for each AI killed for non-respawning spawns.
		_maxUnits set [0,(_maxUnits select 0) - 1];
		if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: MaxUnits variable for group %1 set to %2.",_unitGroup,_maxUnits];};
	};
};

true
