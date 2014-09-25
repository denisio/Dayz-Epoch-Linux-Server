//Small Gun Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// RIFLES
_box addWeaponCargoGlobal ["M16A2", 1];
_box addWeaponCargoGlobal ["AKS_74_kobra", 1];
_box addWeaponCargoGlobal ["LeeEnfield", 1];
_box addWeaponCargoGlobal ["Remington870_lamp", 1];
_box addWeaponCargoGlobal ["SVD", 1];

// PISTOLS
_box addWeaponCargoGlobal ["glock17_EP1", 1];
_box addWeaponCargoGlobal ["Colt1911", 1];

// AMMUNITION
_box addMagazineCargoGlobal ["20Rnd_556x45_Stanag", 5];
_box addMagazineCargoGlobal ["30Rnd_545x39_AK", 5];
_box addMagazineCargoGlobal ["10x_303", 5];
_box addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", 5];
_box addMagazineCargoGlobal ["10Rnd_762x54_SVD", 5];

_box addMagazineCargoGlobal ["17Rnd_9x19_glock17", 10];
_box addMagazineCargoGlobal ["7Rnd_45ACP_1911", 10];

// TOOLS
_box addWeaponCargoGlobal ["ItemToolbox", 2];
_box addWeaponCargoGlobal ["ItemCompass", 2];

// BACKPACKS
_box addBackpackCargoGlobal ["DZ_British_ACU", 2];
