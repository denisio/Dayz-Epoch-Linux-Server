//Extra Large Gun Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// RIFLES
_box addWeaponCargoGlobal ["DMR_DZ", 1];
_box addWeaponCargoGlobal ["BAF_LRR_scoped_W", 1];
_box addWeaponCargoGlobal ["M4A3_RCO_GL_EP1", 1];
_box addWeaponCargoGlobal ["M110_NVG_EP1", 1];
_box addWeaponCargoGlobal ["Mk_48_DES_EP1", 1];
_box addWeaponCargoGlobal ["M14_EP1", 1];
_box addWeaponCargoGlobal ["SCAR_L_CQC_CCO_SD", 1];
_box addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD", 1];
_box addWeaponCargoGlobal ["M60A4_EP1_DZE", 1];
_box addWeaponCargoGlobal ["AK_47_M", 1];

// PISTOLS
_box addWeaponCargoGlobal ["M9", 1];
_box addWeaponCargoGlobal ["M9SD", 1];
_box addWeaponCargoGlobal ["UZI_SD_EP1", 1];
_box addWeaponCargoGlobal ["bizon_silenced", 1];

// AMMUNITION
_box addMagazineCargoGlobal ["20Rnd_762x51_DMR", 10];
_box addMagazineCargoGlobal ["5Rnd_86x70_L115A1", 10];
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 15];
_box addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR", 15];
_box addMagazineCargoGlobal ["100Rnd_762x51_M240", 10];
_box addMagazineCargoGlobal ["20Rnd_762x51_DMR", 10];
_box addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR", 10];
_box addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR", 10];
_box addMagazineCargoGlobal ["100Rnd_762x51_M240", 5];
_box addMagazineCargoGlobal ["30Rnd_762x39_AK47", 15];

_box addMagazineCargoGlobal ["15Rnd_9x19_M9", 10];
_box addMagazineCargoGlobal ["15Rnd_9x19_M9SD", 10];
_box addMagazineCargoGlobal ["30Rnd_9x19_UZI_SD", 10];
_box addMagazineCargoGlobal ["64Rnd_9x19_SD_Bizon", 10];

// ITEMS
_box addWeaponCargoGlobal ["Binocular_Vector", 2];
_box addWeaponCargoGlobal ["NVGoggles", 2];
_box addWeaponCargoGlobal ["ItemGPS", 2];

//BACKPACKS
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 2];

// CLOTHING
_box addMagazineCargoGlobal ["Skin_Drake_Light_DZ", 2];

