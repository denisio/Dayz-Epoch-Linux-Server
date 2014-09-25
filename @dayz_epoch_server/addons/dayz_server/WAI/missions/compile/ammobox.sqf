private ["_mission","_mags","_tool","_box","_class","_numberofguns","_numberoftools","_weapon","_namecfg","_numberofitems","_item"];
_box = _this select 0;

//_box = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];


clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

_numberofguns = (round (random 2)) + wai_mission_numberofguns;
_numberoftools = (round (random 2)) + wai_mission_numberoftools;
_numberofitems = (round (random 2)) + wai_mission_numberofitems;

for "_i" from 1 to _numberofguns do {
	_weapon = ammo_box_guns call BIS_fnc_selectRandom;
	_mags = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
	_box addWeaponCargoGlobal [_weapon,1];
	_box addMagazineCargoGlobal [(_mags select 0),round(random 2) + 1];
};
for "_i" from 1 to _numberoftools do {
	_tool = ammo_box_tools call BIS_fnc_selectRandom;
	_box addWeaponCargoGlobal [_tool,2];
};

for "_i" from 1 to _numberofitems do {
	_item = ammo_box_items call BIS_fnc_selectRandom;
	_box addMagazineCargoGlobal [_item,1];
};