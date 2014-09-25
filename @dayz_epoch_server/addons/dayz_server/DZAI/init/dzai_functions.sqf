/*
	DZAI Functions
	
	Last Updated: 5:08 AM 12/24/2013
*/

diag_log "[DZAI] Compiling DZAI functions.";

//Utility functions
if (isNil "SHK_pos_getPos") then {call compile preprocessFile format ["%1\SHK_pos\shk_pos_init.sqf",DZAI_directory];};
if (isNil "fnc_selectRandomWeighted") then {fnc_selectRandomWeighted = compile preprocessFileLineNumbers format ["%1\compile\fn_selectRandomWeighted.sqf",DZAI_directory]};
BIS_fnc_selectRandom2 = compile preprocessFileLineNumbers format ["%1\compile\fn_selectRandom.sqf",DZAI_directory];
DZAI_checkClassname = compile preprocessFileLineNumbers format ["%1\compile\fn_checkclassname.sqf",DZAI_directory];

//Spawning-related functions
DZAI_setup_AI = compile preprocessFileLineNumbers format ["%1\compile\fn_spawnGroup.sqf",DZAI_directory];
DZAI_findSpawnPos = compile preprocessFileLineNumbers format ["%1\compile\fn_findspawnpos.sqf",DZAI_directory];
DZAI_setTrigVars = compile preprocessFileLineNumbers format ["%1\compile\fn_init_trigger.sqf",DZAI_directory];
fnc_spawnBandits_custom	= compile preprocessFileLineNumbers format ["%1\spawn_functions\spawnBandits_custom.sqf",DZAI_directory];
DZAI_spawnVehicle_custom = compile preprocessFileLineNumbers format ["%1\spawn_functions\spawnVehicle_custom.sqf",DZAI_directory];
DZAI_spawn_units = compile preprocessFileLineNumbers format ["%1\compile\fn_customSpawnUnits.sqf",DZAI_directory];
fnc_respawnBandits = compile preprocessFileLineNumbers format ["%1\spawn_functions\respawnBandits.sqf",DZAI_directory];
fnc_respawnHandler = compile preprocessFileLineNumbers format ["%1\spawn_functions\respawnHandler1.sqf",DZAI_directory];
fnc_respawnHandler2 = compile preprocessFileLineNumbers format ["%1\spawn_functions\respawnHandler2.sqf",DZAI_directory];
fnc_despawnBandits = compile preprocessFileLineNumbers format ["%1\spawn_functions\despawnBandits.sqf",DZAI_directory];

//AI unit-related functions
DZAI_AI_handledamage = compile preprocessFileLineNumbers format ["%1\compile\fn_damageHandlerAI2.sqf",DZAI_directory];
DZAI_unconscious = compile preprocessFileLineNumbers format ["%1\compile\ai_unconscious.sqf",DZAI_directory];
DZAI_BIN_taskPatrol = compile preprocessFileLineNumbers format ["%1\compile\BIN_taskPatrol.sqf",DZAI_directory];
DZAI_addLoot = compile preprocessFileLineNumbers format ["%1\compile\ai_generate_loot.sqf",DZAI_directory];
DZAI_setupLoadout = compile preprocessFileLineNumbers format ["%1\compile\ai_setup_loadout.sqf",DZAI_directory];
DZAI_autoRearm_group = compile preprocessFileLineNumbers format ["%1\compile\group_manager.sqf",DZAI_directory];
DZAI_heliAwareness = compile preprocessFileLineNumbers format ["%1\compile\heli_awareness.sqf",DZAI_directory];

//Kill-related functions
DZAI_AI_killed_all = compile preprocessFileLineNumbers format ["%1\compile\ai_killed_all.sqf",DZAI_directory];
DZAI_AI_killed_static = compile preprocessFileLineNumbers format ["%1\compile\ai_killed_static.sqf",DZAI_directory];
DZAI_unitDeath = compile preprocessFileLineNumbers format ["%1\compile\ai_death.sqf",DZAI_directory];
DZAI_countKills = compile preprocessFileLineNumbers format ["%1\compile\fn_countkills.sqf",DZAI_directory];

//Vehicle-related functions
DZAI_hHandleDamage = compile preprocessFileLineNumbers format ["%1\compile\heli_handledamage.sqf",DZAI_directory];
DZAI_vHandleDamage = compile preprocessFileLineNumbers format ["%1\compile\veh_handledamage.sqf",DZAI_directory];
DZAI_airLanding = compile preprocessFileLineNumbers format ["%1\compile\heli_airlanding.sqf",DZAI_directory];
DZAI_parachuteOut = compile preprocessFileLineNumbers format ["%1\compile\heli_parachute.sqf",DZAI_directory];
DZAI_heliDestroyed = compile preprocessFileLineNumbers format ["%1\compile\heli_destroyed.sqf",DZAI_directory];
DZAI_vehDestroyed = compile preprocessFileLineNumbers format ["%1\compile\veh_destroyed.sqf",DZAI_directory];
DZAI_AI_killed_air = compile preprocessFileLineNumbers format ["%1\compile\ai_killed_air.sqf",DZAI_directory];
DZAI_AI_killed_land = compile preprocessFileLineNumbers format ["%1\compile\ai_killed_land.sqf",DZAI_directory];
DZAI_vehRegroup = compile preprocessFileLineNumbers format ["%1\compile\veh_regroup.sqf",DZAI_directory];

//Static AI functions
if (DZAI_staticAI) then {
	fnc_spawnBandits = compile preprocessFileLineNumbers format ["%1\spawn_functions\spawnBandits.sqf",DZAI_directory];
	DZAI_spawnBandits_init = compile preprocessFileLineNumbers format ["%1\spawn_functions\spawnBandits_initialize.sqf",DZAI_directory];
	DZAI_static_spawn = compile preprocessFileLineNumbers format ["%1\compile\fn_createStaticSpawn.sqf",DZAI_directory];
};

//Dynamic AI functions
if (DZAI_dynAISpawns) then {
	DZAI_abortDynSpawn = compile preprocessFileLineNumbers format ["%1\compile\fn_abortdynspawn.sqf",DZAI_directory];
	fnc_spawnBandits_dynamic = compile preprocessFileLineNumbers format ["%1\spawn_functions\spawnBandits_dynamicV2.sqf",DZAI_directory];
	fnc_despawnBandits_dynamic = compile preprocessFileLineNumbers format ["%1\spawn_functions\despawnBandits_dynamic.sqf",DZAI_directory];
	DZAI_dyn_huntPlayer = compile preprocessFileLineNumbers format ["%1\compile\fn_seekPlayer.sqf",DZAI_directory];
	DZAI_AI_killed_dynamic = compile preprocessFileLineNumbers format ["%1\compile\ai_killed_dynamic.sqf",DZAI_directory];
};

if (DZAI_findKiller) then {
	DZAI_huntKiller = compile preprocessFileLineNumbers format ["%1\compile\fn_findKiller.sqf",DZAI_directory];
};

if ((!isNil "DZAI_debugMarkersEnabled") && {DZAI_debugMarkersEnabled}) then {
	DZAI_updateSpawnMarker = compile preprocessFileLineNumbers format ["%1\compile\fn_refreshmarker.sqf",DZAI_directory];
};

//Compile zombie aggro functions
if (DZAI_zombieEnemy && {DZAI_weaponNoise}) then { // Optional Zed-to-AI aggro functions
	DZAI_aiFired = compile preprocessFileLineNumbers format ["%1\compile\ai_fired.sqf",DZAI_directory];
	DZAI_alertZombies = compile preprocessFileLineNumbers format ["%1\compile\ai_alertzombies.sqf",DZAI_directory];
};

//Air/land vehicle patrol spawn scripts
if ((DZAI_maxHeliPatrols > 0) or {DZAI_maxLandPatrols > 0}) then {
	DZAI_spawnVehiclePatrol = compile preprocessFileLineNumbers format ["%1\spawn_functions\spawnVehiclePatrol.sqf",DZAI_directory];
	//Helicopter patrol scripts
	if (DZAI_maxHeliPatrols > 0) then {
		DZAI_heliDetectPlayers = compile preprocessFileLineNumbers format ["%1\compile\heli_detectplayers.sqf",DZAI_directory];
		DZAI_heliRandomPatrol = compile preprocessFileLineNumbers format ["%1\compile\heli_randompatrol.sqf",DZAI_directory];
		if (DZAI_heliReinforceChance > 0) then {DZAI_heliReinforce = compile preprocessFileLineNumbers format ["%1\compile\heli_reinforce.sqf",DZAI_directory]};
	};
	//Land vehicle patrol scripts
	if (DZAI_maxLandPatrols > 0) then {
		DZAI_vehPatrol = compile preprocessFileLineNumbers format ["%1\compile\veh_randompatrol.sqf",DZAI_directory];
	};
};

//AI skill-boosting function for last surviving AI unit.
if (DZAI_lastManStanding) then {
	DZAI_skillBoost = compile preprocessFileLineNumbers format ["%1\compile\fn_skillboost.sqf",DZAI_directory];
};


//Miscellaneous functions 
//------------------------------------------------------------------------------------------------------------------------

if (DZAI_radioMsgs) then {
	if (DZAI_clientRadio) then {
		DZAI_radioSend = {
			DZAI_SMS = (_this select 1);
			(owner (_this select 0)) publicVariableClient "DZAI_SMS";
			true
		};
	} else {
		DZAI_radioSend = {
			[nil,(_this select 0),"loc",rTITLETEXT,(_this select 1),"PLAIN DOWN",2] call RE;
			true
		};
	};
};

DZAI_updGroupCount = {
	private ["_unitGroup","_isNewGroup"];
	_unitGroup = _this select 0;
	_isNewGroup = _this select 1;
	
	if (isNull _unitGroup) exitWith {false};
	
	if (_isNewGroup) then {
		DZAI_activeGroups = DZAI_activeGroups + [_unitGroup];
	} else {
		DZAI_activeGroups = DZAI_activeGroups - [_unitGroup];
	};
	true
};

//DZAI group side assignment function. Detects when East side has too many groups, then switches to Resistance side.
DZAI_createGroup = {
	private["_groupSide","_unitGroup"];
	_groupSide = (if (({(side _x) == east} count allGroups) < 141) then {
		east
	} else {
		//If there are 140 East groups, set West/Resistance hostility and assign a Resistance group instead.
		if ((resistance getFriend west) > 0) then {
			createCenter resistance;
			resistance setFriend [west,0];
			west setFriend [resistance,0];
			east setFriend [resistance, 1];
			resistance setFriend [east, 1];
			diag_log "DZAI Warning: Group maximum reached for East side! Modifying Resistance side for DZAI use.";
		};
		resistance
	});
	//diag_log format ["Assigned side %1 to AI group",_groupSide];
	
	_unitGroup = createGroup _groupSide;
	[_unitGroup,true] call DZAI_updGroupCount;
	
	_unitGroup
};

//Sets skills for unit based on their weapongrade value.
DZAI_setSkills = {
	private["_unit","_weapongrade","_skillArray"];
	_unit = _this select 0;
	_weapongrade = _this select 1;

	_skillArray = missionNamespace getVariable ["DZAI_skill"+str(_weapongrade),DZAI_skill3];
	{
		_unit setskill [_x select 0,(((_x select 1) + random ((_x select 2)-(_x select 1))) min 1)];
	} forEach _skillArray;
};

//Spawns flies on AI corpse
DZAI_deathFlies = {
	private ["_soundFlies"];
	_soundFlies = createSoundSource ["Sound_Flies",ASLtoATL getPosASL _this,[],0];
	_soundFlies attachTo [_this,[0,0,0]];
	_this setVariable ["sound_flies",_soundFlies];
	waitUntil {sleep 5; (speed (vehicle _this)) == 0};
	_this enableSimulation false;
};

//Convert server uptime in seconds to formatted time (days/hours/minutes/seconds)
DZAI_getUptime = {
	private ["_iS","_oS","_oM","_oH","_oD"];

	_iS = diag_tickTime;
	
	_oS = floor (_iS % 60);
	_oM = floor ((_iS % 3600)/60);
	_oH = floor ((_iS % 86400)/3600);
	_oD = floor ((_iS % 2592000)/86400);
	
	[_oD,_oH,_oM,_oS]
};

//Combines two arrays and returns the combined array. Does not add duplicate values. Second array is appended to first array.
DZAI_append = {
	if (((typeName (_this select 0)) != "ARRAY")&&((typeName (_this select 1)) != "ARRAY")) exitWith {diag_log "DZAI Error: DZAI_append function was not provided with two arrays!";};
	{
		if !(_x in (_this select 0)) then {
			(_this select 0) set [(count (_this select 0)),_x];
		};
	} forEach (_this select 1);
	
	(_this select 0)
};

DZAI_findLootPile = {
	private ["_lootPiles","_lootPos","_unitGroup","_searchRange"];
	_unitGroup = _this select 0;
	_searchRange = _this select 1;
	
	_lootPiles = (ASLtoATL getPosASL (leader _unitGroup)) nearObjects ["ReammoBox",_searchRange];
	if ((count _lootPiles) > 0) then {
		_lootPos = ASLtoATL getPosASL (_lootPiles call BIS_fnc_selectRandom2);
		if ((behaviour (leader _unitGroup)) != "AWARE") then {_unitGroup setBehaviour "AWARE"};
		(units _unitGroup) doMove _lootPos;
		{_x moveTo _lootPos} forEach (units _unitGroup);
		//diag_log format ["DEBUG :: AI group %1 is investigating a loot pile at %2.",_unitGroup,_lootPos];
	};
};

//Prevents object from being destroyed/deleted from DayZ's anti-hacker check
DZAI_protectObject = {
	private ["_objectMonitor","_object"];
	_object = _this;
	
	_objectMonitor = missionNamespace getVariable [DZAI_serverObjectMonitor,[]];
	_objectMonitor set [count _objectMonitor,_object];
	DZAI_monitoredObjects set [count DZAI_monitoredObjects,_object];
	_object setVariable ["ObjectID",""];
	_object setVariable ["ObjectUID",""];
	
	true
};

DZAI_purgeEH = {
	{_this removeAllEventHandlers _x} count ["Killed","HandleDamage","GetIn","GetOut","Fired"];
};

DZAI_getWeapongrade = {
	private ["_indexWeighted"];

	_indexWeighted = call {
		if (_this == 0) exitWith {DZAI_gradeIndices0};
		if (_this == 1) exitWith {DZAI_gradeIndices1};
		if (_this == 2) exitWith {DZAI_gradeIndices2};
		if (_this == 3) exitWith {DZAI_gradeIndices3};
		if (_this == 4) exitWith {DZAI_gradeIndicesDyn};
		DZAI_gradeIndices1
	};
		
	DZAI_weaponGrades select (_indexWeighted call BIS_fnc_selectRandom2)
};

/*
DZAI_updateUnitCount = {
	if (((typeName _this) == "SCALAR") && {(_this >= 0)}) then {
		DZAI_numAIUnits = _this;
		true
	} else {
		diag_log format ["DZAI Error: Tried to update AI count using invalid value type! Value: %1",_this];
		false
	};
};
*/

DZAI_spawn_vehicle = {
	if ((getMarkerColor (_this select 0)) == "") exitWith {diag_log format ["DZAI Error: Unable to find provided marker %1 to spawn AI vehicle.",(_this select 0)]};
	if (!([(_this select 1),"vehicle"] call DZAI_checkClassname)) exitWith {diag_log format ["DZAI Error: Provided vehicle classname %1 is a banned or nonexistent classname.",(_this select 1)]};
	if ((typeName (_this select 2)) != "ARRAY") then {_this set [2,[3,3]]};
	if (!((_this select 3) in DZAI_weaponGradesAll)) then {_this set [3,1]};
	DZAI_customSpawnQueue set [(count DZAI_customSpawnQueue),_this];
};

DZAI_protectGroup = {
	private ["_dummy"]; //_this = group
	
	_dummy = _this createUnit ["Logic",[0,0,0],[],0,"FORM"];
	[_dummy] joinSilent _this;
	_dummy disableAI "MOVE";
	_dummy setVariable ["unconscious",true];
	if ((behaviour _dummy) != "AWARE") then {_this setBehaviour "AWARE"};
	_this setVariable ["dummyUnit",_dummy];
	
	if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: All units in group %1 killed, spawned 1 dummy AI unit for group.",_this];};
	
	_dummy
};

DZAI_addTempNVG = {
	_this addWeapon "NVGoggles";
	//_this addEventHandler ["Killed",{(_this select 0) removeWeapon "NVGoggles"; (_this select 0) removeAllEventHandlers "Killed";}];
	_this setVariable ["removeNVG",true];
	
	true
};

DZAI_respawnAIVehicle = {
	//Usage: [_unitGroup,_vehicle] call DZAI_respawnAIVehicle;
	private ["_vehicle"];
	_vehicle = _this select 1;
	if (_vehicle isKindOf "Air") then {DZAI_curHeliPatrols = DZAI_curHeliPatrols - 1} else {DZAI_curLandPatrols = DZAI_curLandPatrols - 1};
	if (((_this select 0) getVariable ["unitType",""]) in ["aircustom","landcustom"]) then {
		private ["_spawnParams"];
		_spawnParams = (_this select 0) getVariable ["spawnParams",false];
		if (_spawnParams select 4) then {
			[1,_spawnParams] call fnc_respawnHandler;
		};
	} else {
		[2,typeOf _vehicle] call fnc_respawnHandler;
	};
	_vehicle setVariable ["DZAI_deathTime",diag_tickTime]; //mark vehicle for cleanup
	
	true
};

DZAI_updStaticSpawnCount = {
	if (!isNull _this) then {
		if (_this in DZAI_staticTriggerArray) then {
			DZAI_staticTriggerArray = DZAI_staticTriggerArray - [_this];
			false
		} else {
			if ((triggerStatements _this select 1) == "") then {
				DZAI_staticTriggerArray set [count DZAI_staticTriggerArray,_this];
			};
			true
		};
	} else {
		DZAI_staticTriggerArray = DZAI_staticTriggerArray - [objNull];
	};
};

DZAI_updDynSpawnCount = {
	if (!isNull _this) then {
		if (_this in DZAI_dynTriggerArray) then {
			DZAI_dynTriggerArray = DZAI_dynTriggerArray - [_this];
			false
		} else {
			if ((triggerStatements _this select 1) == "") then {
				DZAI_dynTriggerArray set [count DZAI_dynTriggerArray,_this];
				true
			};
		};
	} else {
		DZAI_dynTriggerArray = DZAI_dynTriggerArray - [objNull];
	};
};

DZAI_deleteGroup = {
	private ["_groupManager"];

	[_this,false] call DZAI_updGroupCount;
	
	{
		if (alive _x) then {
			deleteVehicle _x;
		} else {
			[_x] joinSilent grpNull;
		};
	} count (units _this);
	deleteGroup _this;
	
	true
};

diag_log "[DZAI] DZAI functions compiled.";
