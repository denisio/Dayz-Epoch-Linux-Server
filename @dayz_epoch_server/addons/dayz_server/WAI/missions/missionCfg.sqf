// Time between missions (seconds)
wai_mission_timer = 600;

// How long before a mission times out (seconds)
wai_mission_timeout = 1800;

// missions used when selecting the next random mission
wai_missions = [
"bandit_base",
"armed_vehicle",
"disabled_civchopper",
"crash_spawner",
"disabled_milchopper",
"MV22",
"weapon_cache",
"mayors_mansion",
"convoy",
"C130_crash",
"ems_cache",
"medi_camp",
"Ural"
];

// fuel the mission vehicles spawn with 0-100.
wai_mission_fuel = .5;

// armed vehicles to spawn in missions
armed_vehicle = [
"ArmoredSUV_PMC_DZE",
"HMMWV_M998A2_SOV_DES_EP1_DZE",
"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
"LandRover_Special_CZ_EP1_DZE",
"GAZ_Vodnik_DZE",
"LandRover_MG_TK_EP1_DZE",
"Offroad_DSHKM_Gue_DZE",
"Pickup_PK_GUE_DZE",
"Pickup_PK_INS_DZE",
"Pickup_PK_TK_GUE_EP1_DZE",
"UAZ_MG_TK_EP1_DZE"
];

//armed helis to spawn in missions
armed_chopper = [
"CH_47F_EP1_DZE",
"Mi17_DZE",
"UH1H_DZE",
"UH1Y_DZE",
"UH60M_EP1_DZE"
];

// civilian aircraft to spawn in missions
civil_aircraft = [
"AH6X_DZ",
"MH6J_DZ",
"Mi17_Civilian_DZ",
"AN2_DZ",
"MV22_DZ"
];

// military unarmed vehicles to spawn in missions
military_unarmed = [
"GAZ_Vodnik_MedEvac",
"HMMWV_Ambulance",
"HMMWV_Ambulance_CZ_DES_EP1",
"HMMWV_DES_EP1",
"HMMWV_DZ",
"HMMWV_M1035_DES_EP1",
"LandRover_CZ_EP1",
"LandRover_TK_CIV_EP1",
"UAZ_CDF",
"UAZ_INS",
"UAZ_RU",
"UAZ_Unarmed_TK_CIV_EP1",
"UAZ_Unarmed_TK_EP1",
"UAZ_Unarmed_UN_EP1"
];

// cargo trucks to spawn in missions
cargo_trucks = [
"Kamaz",
"MTVR_DES_EP1",
"Ural_CDF",
"Ural_TK_CIV_EP1",
"Ural_UN_EP1",
"V3S_Open_TK_CIV_EP1",
"V3S_Open_TK_EP1"
];

// refuel trucks to spawn in missions
refuel_trucks = [
"V3S_Refuel_TK_GUE_EP1_DZ",
"UralRefuel_TK_EP1_DZ",
"MtvrRefuel_DES_EP1_DZ",
"KamazRefuel_DZ"
];

// civilian vehicles to spawn in missions
civil_vehicles = [
"hilux1_civil_1_open",
"hilux1_civil_2_covered",
"hilux1_civil_3_open_EP1",
"SUV_Camo",
"SUV_TK_CIV_EP1",
"SUV_Blue",
"SUV_Charcoal",
"SUV_Green",
"SUV_Orange",
"SUV_Pink",
"SUV_Red",
"SUV_Silver",
"SUV_White",
"SUV_Yellow"
];

// Number of guns to spawn in ammo boxes 
wai_mission_numberofguns = 8;
// classnames of guns to spawn in ammo boxes (only class weapons)
ammo_box_guns = [
"M9SD",
"M9",
"AKS_74_UN_kobra",
"AK_107_pso",
"AK_107_GL_pso",
"AK_107_GL_kobra",
"M4A3_CCO_EP1",
"M4A1_AIM_SD_camo",
"M16A4_ACG",
"M8_carbineGL",
"VSS_vintorez",
"M8_sharpshooter",
"M40A3",
"Mk_48_DZ",
"M240_DZ",
"M249_DZ",
"Pecheneg_DZ",
"RPK_74",
"BAF_LRR_scoped",
"DMR",
"SVD_CAMO",
"SCAR_H_LNG_Sniper_SD",
"M110_NVG_EP1",
"Sa58V_RCO_EP1",
"KSVK_DZE",
"BAF_L86A2_ACOG",
"M14_EP1",
"Sa58V_CCO_EP1"
];

// Number of tools to spawn in ammo boxes 
wai_mission_numberoftools = 5;
// classnames of tools to spawn in ammo boxes (only toolbelt items or weapon class Eg. "Chainsaw" or "ItemToolbox")
ammo_box_tools =[
"ItemToolbox",
"ItemKnife",
"ItemCrowbar",
"ItemEtool",
"Binocular",
"Binocular_Vector",
"ItemCompass",
"ItemFishingPole",
"ItemFlashlightRed",
"ItemGPS",
"ItemHatchet_DZE",
"ItemMachete",
"ItemMatchbox_DZE",
"NVGoggles",
"chainsaw"
];

// Number of items to spawn in ammo boxes 
wai_mission_numberofitems = 10;
// classnames of items to spawn in ammo boxes (only type magazine will work here)
ammo_box_items =[
"ItemBandage",
"ItemSodaCoke"
];

//////////////////////////////////////////////////////////////////////
WAImissionconfig = True;
