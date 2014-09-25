private ["_classname","_checkType","_result","_config","_banString","_check","_configIndex"];

_classname = _this select 0;
_checkType = _this select 1;
_result = false;
_configIndex = -1;

_checkType = (toLower _checkType);
call {
	if (_checkType == "weapon") exitWith {
		if (_classname in (DZAI_checkedClassnames select 0)) then {
			_result = true;
		} else {
			if (_classname in (DZAI_invalidClassnames select 0)) then {
				_result = false;
			} else {
				_config = "CfgWeapons";
				_banString = "bin\config.bin/CfgWeapons/FakeWeapon";
				_configIndex = 0;
			};
		};
	};
	if (_checkType == "magazine") exitWith {
		if (_classname in (DZAI_checkedClassnames select 1)) then {
			_result = true;
		} else {
			if (_classname in (DZAI_invalidClassnames select 1)) then {
				_result = false;
			} else {
				_config = "CfgMagazines";
				_banString = "bin\config.bin/CfgMagazines/FakeMagazine";
				_configIndex = 1;
			};
		};
	};
	if (_checkType == "vehicle") exitWith {
		if (_classname in (DZAI_checkedClassnames select 2)) then {
			_result = true;
		} else {
			if (_classname in (DZAI_invalidClassnames select 2)) then {
				_result = false;
			} else {
				_config = "CfgVehicles";
				_banString = "bin\config.bin/CfgVehicles/Banned";
				_configIndex = 2;
			};
		};
	};
};

if (_configIndex > -1) then {
	_check = (str(inheritsFrom (configFile >> _config >> _classname)));
	if ((_check != "") && {(_check != _banString)}) then {
		(DZAI_checkedClassnames select _configIndex) set [(count (DZAI_checkedClassnames select _configIndex)),_classname]; //Classname considered valid, no need to check it again
		_result = true;
		//diag_log format ["DEBUG :: Verified %1 classname %2 as valid.",_checkType,_classname];
	};
};

_result