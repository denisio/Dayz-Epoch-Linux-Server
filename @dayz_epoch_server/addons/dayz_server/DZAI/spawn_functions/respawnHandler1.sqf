//Respawn handler stage 1

private ["_respawnSleep","_nextRespawnTime","_mode"];

_respawnSleep = 0;
_nextRespawnTime = 0;
_mode = _this select 0;

call {
	if (_mode == 0) exitWith {
		//Infantry AI respawn
		_trigger = _this select 1;	 //spawn area to respawn
		_unitGroup = _this select 2; //infantry group to respawn
		_fastMode = if ((count _this) > 3) then {_this select 3} else {false}; //shorter wait time if retrying a spawn
		_respawnSleep = _trigger getVariable ["respawnTime",(DZAI_respawnTimeMin + (random DZAI_respawnTimeVariance))];	//Calculate wait time for respawn. Respawn time may be individually defined for custom spawns.
		if (_fastMode) then {_respawnSleep = (_respawnSleep/2) max 60};
		_nextRespawnTime = (diag_tickTime + _respawnSleep);	//Determine time of next respawn
		DZAI_respawnQueue set [(count DZAI_respawnQueue),[diag_tickTime + _respawnSleep,_mode,_trigger,_unitGroup]];
		if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Added group %1 to respawn queue. Queue position %2. Wait Time %3 (respawnHandler)",_unitGroup,(count DZAI_respawnQueue),_respawnSleep];};
	};
	if (_mode == 1) exitWith {
		//Custom vehicle AI respawn
		_spawnParams = _this select 1;	//parameters used to call DZAI_spawn_vehicle
		_respawnSleep = if ((count _spawnParams) > 5) then {_spawnParams select 5} else {600};	//calculate respawn time
		_nextRespawnTime = (diag_tickTime + _respawnSleep);	//Determine time of next respawn
		DZAI_respawnQueue set [(count DZAI_respawnQueue),[diag_tickTime + _respawnSleep,_mode,_spawnParams]];
		if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Added custom AI vehicle %1 patrol to respawn queue. Queue position %2. Wait Time %3 (respawnHandler)",(_spawnParams select 1),(count DZAI_respawnQueue),_respawnSleep];};
	};
	if (_mode == 2) exitWith {
		//Vehicle patrol AI respawn
		_vehicleType = _this select 1;
		_fastMode = if ((count _this) > 2) then {_this select 2} else {false}; //shorter wait time if retrying a spawn
		if (_vehicleType isKindOf "Air") then {
			_respawnSleep = (DZAI_respawnTMinA + random DZAI_respawnTimeVarAir);
		} else {
			_respawnSleep = (DZAI_respawnTMinL + random DZAI_respawnTimeVarLand);
			if (_fastMode) then {_respawnSleep = (_respawnSleep/2) max 180};
		};
		_nextRespawnTime = (diag_tickTime + _respawnSleep);	//Determine time of next respawn
		DZAI_respawnQueue set [(count DZAI_respawnQueue),[diag_tickTime + _respawnSleep,_mode,_vehicleType]];
		if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Added AI vehicle patrol type %1 to respawn queue. Queue position %2. Wait Time %3 (respawnHandler)",_vehicleType,(count DZAI_respawnQueue),_respawnSleep];};
	};
};

if (!isNil "DZAI_respawnActive") exitWith {}; 			//If the first respawn has already occured, no need to modify the initial wait time.

if (!isNil "DZAI_nextRespawnTime") then {
	if (_nextRespawnTime < DZAI_nextRespawnTime) then {	//If the newest respawn is scheduled to happen sooner than the next closest respawn, reduce the initial wait time appropriately.
		DZAI_nextRespawnTime = _nextRespawnTime;		//Time of next spawn
		if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Decreased time to next respawn to %1 seconds.",_respawnSleep];};
	};
} else {
	DZAI_nextRespawnTime = _nextRespawnTime;
	if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Time to first respawn set to %1 seconds.",_respawnSleep];};
};

if (!isNil "DZAI_queueActive") exitWith {};
DZAI_queueActive = true;							//The respawn queue is established, so don't create another one until it's finished.
DZAI_respawnHandlerHandle = [] spawn fnc_respawnHandler2;

true
