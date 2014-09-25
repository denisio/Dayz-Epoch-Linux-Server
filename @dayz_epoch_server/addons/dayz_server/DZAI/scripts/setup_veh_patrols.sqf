
waitUntil {uiSleep 0.1; !isNil "DZAI_locations_ready"};

if (DZAI_maxHeliPatrols > 0) then {
	_nul = [] spawn {
		for "_i" from 0 to ((count DZAI_heliList) - 1) do {
			_heliType = (DZAI_heliList select _i) select 0;
			_amount = (DZAI_heliList select _i) select 1;
			
			if ([_heliType,"vehicle"] call DZAI_checkClassname) then {
				for "_j" from 1 to _amount do {
					DZAI_heliListFinal set [count DZAI_heliListFinal,_heliType];
				};
			} else {
				if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Attempted to spawn invalid vehicle type %1.",_heliType];};
			};
		};
		
		if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Assembled helicopter list: %1",DZAI_heliListFinal];};
		
		_maxHelis = (DZAI_maxHeliPatrols min (count DZAI_heliListFinal));
		for "_i" from 1 to _maxHelis do {
			_index = floor (random (count DZAI_heliListFinal));
			_heliType = DZAI_heliListFinal select _index;
			_nul = _heliType spawn DZAI_spawnVehiclePatrol;
			DZAI_heliListFinal set [_index,objNull];
			DZAI_heliListFinal = DZAI_heliListFinal - [objNull];
			if (_i < _maxHelis) then {uiSleep 20};
		};
	};
	uiSleep 5;
};

if (DZAI_maxLandPatrols > 0) then {
	_nul = [] spawn {
		for "_i" from 0 to ((count DZAI_vehList) - 1) do {
			_vehType = (DZAI_vehList select _i) select 0;
			_amount = (DZAI_vehList select _i) select 1;
			
			if ([_vehType,"vehicle"] call DZAI_checkClassname) then {
				for "_j" from 1 to _amount do {
					DZAI_vehListFinal set [count DZAI_vehListFinal,_vehType];
				};
			} else {
				if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Attempted to spawn invalid vehicle type %1.",_vehType];};
			};
		};
		
		if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Assembled vehicle list: %1",DZAI_vehListFinal];};
		
		_maxVehicles = (DZAI_maxLandPatrols min (count DZAI_vehListFinal));
		for "_i" from 1 to _maxVehicles do {
			_index = floor (random (count DZAI_vehListFinal));
			_vehType = DZAI_vehListFinal select _index;
			_nul = _vehType spawn DZAI_spawnVehiclePatrol;
			DZAI_vehListFinal set [_index,objNull];
			DZAI_vehListFinal = DZAI_vehListFinal - [objNull];
			if (_i < _maxVehicles) then {uiSleep 20};
		};
	};
};
