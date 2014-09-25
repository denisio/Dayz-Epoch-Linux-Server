private ["_unit","_weapongrade","_weapons","_weapon","_magazine","_backpacks","_gadgetsArray","_backpack","_gadget","_inventory"];
_unit = _this select 0;
_weapongrade = _this select 1;

if (_unit getVariable ["loadoutDone",false]) exitWith {diag_log "DZAI Error: Unit already has loadout!";};

if !(_weapongrade in DZAI_weaponGradesAll) then {
	_weapongradeInvalid = _weapongrade;
	_weapongrade = DZAI_weaponGrades call BIS_fnc_selectRandom2;
	diag_log format ["DZAI Error: Invalid weapongrade provided! (%1). Generating random weapongrade...",_weapongradeInvalid,_weapongrade];
};

if ((count (weapons _unit)) > 0) then {
	removeAllWeapons _unit;
	{_unit removeWeapon _x} count ["ItemMap","ItemGPS","ItemCompass","ItemRadio","ItemWatch"];
};

_weapons = missionNamespace getVariable ["DZAI_Rifles"+str(_weapongrade),DZAI_Rifles1+DZAI_Rifles2+DZAI_Rifles3];
if ((_weapongrade == 0) && {(random 1) < 0.25}) then {
	_weapons = missionNamespace getVariable ("DZAI_Pistols" + str(floor(random 2)));
};
_backpacks = missionNamespace getVariable ["DZAI_Backpacks"+str(_weapongrade),DZAI_Backpacks1+DZAI_Backpacks2+DZAI_Backpacks3];

//Select weapon and backpack
_weapon = _weapons call BIS_fnc_selectRandom2;
_backpack = _backpacks call BIS_fnc_selectRandom2;

//Add weapon, ammunition, and backpack
_magazine = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
_unit addMagazine _magazine;
_unit addWeapon _weapon;
_unit selectWeapon _weapon;
_unit addBackpack _backpack;
if ((getNumber (configFile >> "CfgWeapons" >> _weapon >> "type")) == 2) then {_unit setVariable ["CanGivePistol",false]};
if ((getNumber (configFile >> "CfgMagazines" >> _magazine >> "count")) < 8) then {_unit addMagazine _magazine};

_gadgetsArray = if (_weapongrade > 1) then {DZAI_gadgets1} else {DZAI_gadgets0};
for "_i" from 0 to ((count _gadgetsArray) - 1) do {
	if ((random 1) < ((_gadgetsArray select _i) select 1)) then {
		_gadget = ((_gadgetsArray select _i) select 0);
		_unit addWeapon _gadget;
	};
};

//If unit has weapongrade 2 or 3 and was not given NVGs, give the unit temporary NVGs which will be removed at death. Set DZAI_tempNVGs to true in variables config to enable temporary NVGs.
if (DZAI_tempNVGs) then {
	if (!(_unit hasWeapon "NVGoggles") && {(_weapongrade > 0)} && {(daytime < 6 || daytime > 20)}) then {
		_nvg = _unit call DZAI_addTempNVG;
		if (DZAI_debugLevel > 1) then {diag_log "DZAI Extended Debug: Generated temporary NVGs for AI.";};
	};
};

_unit setVariable ["loadoutDone",true];
_unit setVariable ["loadout",[[_weapon],[_magazine]]];
if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Created loadout for unit %1 (weapongrade: %2): [%3,%4,%5].",_unit,_weapongrade,_weapon,_magazine,_backpack];};

true
