#define WEAPON_BANNED_STRING "bin\config.bin/CfgWeapons/FakeWeapon"
#define VEHICLE_BANNED_STRING "bin\config.bin/CfgVehicles/Banned"
#define MAGAZINE_BANNED_STRING "bin\config.bin/CfgMagazines/FakeMagazine"

private["_verified","_errorFound","_allArrays","_startTime"];
waitUntil {sleep 0.5; !isNil "DZAI_weaponsInitialized"};

_startTime = diag_tickTime;

_allArrays = ["DZAI_Rifles0","DZAI_Rifles1","DZAI_Rifles2","DZAI_Rifles3","DZAI_Pistols0","DZAI_Pistols1","DZAI_Pistols2","DZAI_Pistols3",
				"DZAI_Backpacks0","DZAI_Backpacks1","DZAI_Backpacks2","DZAI_Backpacks3","DZAI_Edibles","DZAI_Medicals1","DZAI_Medicals2",
				"DZAI_MiscItemS","DZAI_MiscItemL","DZAI_BanditTypes","DZAI_launcherTypes"];

_verified = [];

_index = 4;
while {(typeName (missionNamespace getVariable ("DZAI_Rifles"+str(_index)))) == "ARRAY"} do {
	_allArrays set [count _allArrays,("DZAI_Rifles"+str(_index))];
	_index = _index + 1;
	if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Found custom weapon array %1.",("DZAI_Rifles"+str(_index))]};
};

{
	_array = missionNamespace getVariable [_x,[]];
	_errorFound = false;
	{
		if !(_x in _verified) then {
			call {
				if (isClass (configFile >> "CfgWeapons" >> _x)) exitWith {
					if ((str(inheritsFrom (configFile >> "CfgWeapons" >> _x))) == WEAPON_BANNED_STRING) then {
						diag_log format ["[DZAI] Removing invalid classname: %1.",_x];
						_array set [_forEachIndex,""];
						if (!_errorFound) then {_errorFound = true};
					} else {
						_verified set [count _verified,_x];
					};
				};
				if (isClass (configFile >> "CfgMagazines" >> _x)) exitWith {
					if ((str(inheritsFrom (configFile >> "CfgMagazines" >> _x))) == MAGAZINE_BANNED_STRING) then {
						diag_log format ["[DZAI] Removing invalid classname: %1.",_x];
						_array set [_forEachIndex,""];
						if (!_errorFound) then {_errorFound = true};
					} else {
						_verified set [count _verified,_x];
					};
				};
				if (isClass (configFile >> "CfgVehicles" >> _x)) exitWith {
					if ((str(inheritsFrom (configFile >> "CfgVehicles" >> _x))) == VEHICLE_BANNED_STRING) then {
						diag_log format ["[DZAI] Removing banned classname: %1.",_x];
						_array set [_forEachIndex,""];
						if (!_errorFound) then {_errorFound = true};
					} else {
						_verified set [count _verified,_x];
					};
				};
				diag_log format ["[DZAI] Removing invalid classname: %1.",_x];	//Default case - if classname doesn't exist at all
				_array set [_forEachIndex,""];
				if (!_errorFound) then {_errorFound = true};
			};
		};
	} forEach _array;
	if (_errorFound) then {
		_array = _array - [""];
		missionNamespace setVariable [_x,_array];
		diag_log format ["[DZAI] Contents of %1 failed verification. Invalid entries removed.",_x];
		//diag_log format ["DEBUG :: Corrected contents of %1: %2.",_x,_array];
		//diag_log format ["DEBUG :: Comparison check of %1: %2.",_x,missionNamespace getVariable [_x,[]]];
	};
} forEach _allArrays;

diag_log format ["[DZAI] Verified %1 unique classnames in %2 seconds.",(count _verified),(diag_tickTime - _startTime)];

DZAI_classnamesVerified = true;
