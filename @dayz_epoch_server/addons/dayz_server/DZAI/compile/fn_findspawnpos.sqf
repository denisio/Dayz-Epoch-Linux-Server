//Finds a position that does not have a player within a certain distance.
private ["_spawnPos","_attempts","_continue","_spawnpool","_maxAttempts"];

_attempts = 0;
_continue = true;
_spawnPos = [];
_spawnpool = +_this;
_maxAttempts = ((count _spawnpool) min 5); //5: Maximum number of attempts
while {_continue && {(_attempts < _maxAttempts)}} do {
	_index = floor (random (count _spawnpool));
	_spawnPosSelected = _spawnpool select _index;
	if (({isPlayer _x} count (_spawnPosSelected nearEntities [["CAManBase","LandVehicle"],75])) == 0) then {
		_spawnPos = _spawnPosSelected;
		_continue = false;
	} else {
		_spawnpool set [_index,objNull]; 
		_spawnpool = _spawnpool - [objNull];
		_attempts = _attempts + 1;
		if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Player found within 75 meters of chosen spawn position. (attempt %1/%2).",_attempts,_maxAttempts];};
	};
};

_spawnPos
