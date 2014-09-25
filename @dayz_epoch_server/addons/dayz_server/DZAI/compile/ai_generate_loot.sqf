private ["_unit","_pistol","_pistols","_weapongrade","_magazine","_currentWeapon","_toolselect","_chance","_tool","_toolsArray","_loot"];
_unit = _this select 0;
_weapongrade = _this select 1;

if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: AI killed by player at %1. Generating loot with weapongrade %2.",mapGridPosition _unit,_weapongrade];};

_loot = [];

if (_unit getVariable ["CanGivePistol",true]) then {
	_pistols = missionNamespace getVariable ["DZAI_Pistols"+str(_weapongrade),DZAI_Pistols0+DZAI_Pistols1+DZAI_Pistols2+DZAI_Pistols3];
	_pistol = _pistols call BIS_fnc_selectRandom2;
	_magazine = getArray (configFile >> "CfgWeapons" >> _pistol >> "magazines") select 0;
	_unit addMagazine _magazine;	
	_unit addWeapon _pistol;
	if (DZAI_debugLevel > 1) then {
		_loot set [count _loot,_pistol];
		_loot set [count _loot,_magazine];
	};
};

//Add consumables, medical items, and miscellaneous items
////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Clear backpack cargo in case there are items
clearMagazineCargoGlobal _unit;

//Add one guaranteed Bandage to inventory
_unit addMagazine "ItemBandage";

//Add edible items to inventory
for "_i" from 1 to DZAI_invedibles do {
	if ((random 1) < DZAI_chanceEdibles) then{
		_invedible = DZAI_Edibles call BIS_fnc_selectRandom2;
		_unit addMagazine _invedible;
		if (DZAI_debugLevel > 1) then {_loot set [count _loot,_invedible];};
	};
};

//Add edible items to backpack
for "_i" from 1 to DZAI_bpedibles do {
	if ((random 1) < DZAI_chanceEdibles) then {
		_bpedible = DZAI_Edibles call BIS_fnc_selectRandom2;
		(unitBackpack _unit) addMagazineCargoGlobal [_bpedible, 1];
		if (DZAI_debugLevel > 1) then {_loot set [count _loot,_bpedible];};
	};
};

//Chance to add miscellaneous item (Small) to backpack
for "_i" from 1 to DZAI_numMiscItemS do {
	if ((random 1) < DZAI_chanceMiscItemS) then {
		_miscItemS = DZAI_MiscItemS call BIS_fnc_selectRandom2;
		(unitBackpack _unit) addMagazineCargoGlobal [_miscItemS,1];
		if (DZAI_debugLevel > 1) then {_loot set [count _loot,_miscItemS];};
	};
};

if (_weapongrade > 0) then {
	//Chance to add miscellaneous item (Large) to backpack - only if backpack capacity greater than 6
	if ((getNumber (configFile >> "CfgVehicles" >> (str (unitBackpack _unit)) >> "transportMaxMagazines")) > 6) then {
		for "_i" from 1 to DZAI_numMiscItemL do {
			if ((random 1) < DZAI_chanceMiscItemL) then {
				_miscItemL = DZAI_MiscItemL call BIS_fnc_selectRandom2;
				(unitBackpack _unit) addMagazineCargoGlobal [_miscItemL,1];
				if (DZAI_debugLevel > 1) then {_loot set [count _loot,_miscItemL];};
			};
		};
	};
	
	//Add medical items to backpack
	for "_i" from 1 to DZAI_bpmedicals do {
		if ((random 1) < DZAI_chanceMedicals) then {
			_bpmedical = DZAI_Medicals2 call BIS_fnc_selectRandom2;
			(unitBackpack _unit) addMagazineCargoGlobal [_bpmedical, 1];
			if (DZAI_debugLevel > 1) then {_loot set [count _loot,_bpmedical];};
		};
	};

	//Add medical items to inventory
	for "_i" from 1 to DZAI_invmedicals do {
		if ((random 1) < DZAI_chanceMedicals) then {
			_invmedical = DZAI_Medicals1 call BIS_fnc_selectRandom2;
			_unit addMagazine _invmedical;
			if (DZAI_debugLevel > 1) then {_loot set [count _loot,_invmedical];};
		};
	};
	
	if (DZAI_modName == "epoch") then {
		_barsAdded = 0;
		{
			if (_barsAdded >= DZAI_metalBarNum) exitWith {};
			if (((random 1) < (_x select 1)) && {[(_x select 0),"magazine"] call DZAI_checkClassname}) then {
				_unit addMagazine (_x select 0);
				_barsAdded = _barsAdded + 1;
				if (DZAI_debugLevel > 1) then {_loot set [count _loot,(_x select 0)];};
			}
		} count DZAI_metalBars;
	};
};

//Add tool items
////////////////////////////////////////////////////////////////////////////////////////////////////////////

_toolsArray = if (_weapongrade < 2) then {DZAI_tools0} else {DZAI_tools1};
{
	if (((random 1) < (_x select 1)) && {[(_x select 0),"weapon"] call DZAI_checkClassname}) then {
		_unit addWeapon (_x select 0);
		if (DZAI_debugLevel > 1) then {_loot set [count _loot,(_x select 0)];};
	}
} count _toolsArray;

if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Generated loot for AI death: %1",_loot];};