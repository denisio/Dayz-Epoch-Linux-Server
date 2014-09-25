/*
	DZAI Configuration File
	
	Description: Contains all configurable settings of DZAI. Contains settings for debugging, customization of AI units, spawning, and loot.
	
	Last updated: 6:25 AM 6/17/2014
*/

diag_log "[DZAI] Reading DZAI configuration file.";

/*	DZAI Settings
--------------------------------------------------------------------------------------------------------------------*/	

//Enable or disable event logging to arma2oaserver.rpt. Debug level setting. 0: No debug output, 1: Basic Debug output, 2: Extended Debug output. (Default: 0)
//Debug output may help finding additional information about DZAI's background behavior. This output is helpful when asking for help regarding bugs or unexpected behaviors.
DZAI_debugLevel = 1;

//Frequency of server monitor update to RPT log in seconds. The monitor periodically reports number of max/current AI units and dynamically spawned triggers into RPT log. (Default: 300, 0 = Disable reporting)										
DZAI_monitorRate = 300;

//Enable or disable verification of classname tables used by DZAI. If invalid entries are found, they are removed and logged into the RPT log.
//If disabled, any invalid classnames will not be removed and clients may crash if AI bodies with invalid items are looted. Disable ONLY if a previous scan shows no invalid classnames (Default: true).										
DZAI_verifyTables = true;

//Enable to have server spawn in objects/buildings normally spawned clientside by DayZ's CfgTownGenerator. Prevents AI from walking/shooting through clutter and other objects. (Default: true)	
//If running DayZ Mod ("vanilla DayZ") or DayZ Overwatch, it is highly recommended to enable this option, as many added buildings are handled by the CfgTownGenerator. Not used with Epoch.							
DZAI_objPatch = true;

//Minimum seconds to pass until each dead AI body or destroyed vehicle can be cleaned up by DZAI's task scheduler. DZAI will not clean up a body/vehicle if there is a player close by (Default: 900).	
//Note: Other cleanup scripts might interfere by cleaning up dead AI bodies/vehicles!									
DZAI_cleanupDelay = 900;									


/*

	DZAI_modName value	|	Enables additional settings for...	|	Automatically detected by DZAI? (If Yes, editing DZAI_modName is not needed)
	--------------------------------------------------------------------------------------------------------------------
	""						Automatically detect mod 						N/A
	"default"				Force default settings							N/A
	"2017"					DayZ 2017/Namalsk 2017						No - Must set DZAI_modName = "2017" to enable additional settings.
	"epoch"					DayZ Epoch 									Yes - Adds bar currency to AI loot tables, AI skins, Epoch foods, replaces toolbelt items with Epoch versions.
	"overwatch"				DayZ Overwatch 								Yes - Adds Overwatch skins for AI.
	"huntinggrounds"		DayZ Hunting Grounds 						Yes - Enables additional static AI spawns for expanded Lingor map, AI skins, and backpacks.
	"unleashed"				DayZ Unleashed								Yes - Enables Unleashed static AI spawns and AI skins.
	
*/

//(Optional) In most cases this setting should be left unchanged. This setting should only be changed if DZAI is detecting the wrong DayZ mod automatically. (Default: "")
DZAI_modName = "epoch";


/*	AI Unit Settings
--------------------------------------------------------------------------------------------------------------------*/		

//Enhanced AI health system setting. 
//If enabled, AI units will use DayZ's 12,000 blood system, can be knocked unconscious and Tasered, and can self-bloodbag/morphine. If disabled, AI units will use default Arma 2 damage handling. (Default: true)
DZAI_useHealthSystem = true;

//Minimum and maximum AI blood level to spawn each unit with. Each individual unit will have a randomized blood level within this range. Upper limit: 12000 blood (Default: [10000,12000])
//Note: No effect if DZAI_useHealthSystem is false
DZAI_unitBloodLevel = [10000,12000];

//Amount of blood restored from a full self-heal. One-third of the total amount is restored 3 times every 3 seconds. Note: Applies to infantry-type AI units. (Default: 6000)
//Note: No effect if DZAI_useHealthSystem is false
DZAI_unitHealAmount = 6000;

//Below this blood level, AI may decide to heal themselves for amount specified by DZAI_unitHealAmount. Healing requires 9 seconds to fully complete and can be interrupted by knocking the unit unconscious. (Default: 5000)
//Note: No effect if DZAI_useHealthSystem is false
DZAI_lowBloodLevel = 5000;

//Enable or disable zombie attraction to AI weapon sounds. No effect if DZAI_zombieEnemy is set to false. Enabling this option may impact server performance as a script is run for each AI bullet fired.
//Note: AI cannot be attacked or damaged by zombies.(Default: false)		
DZAI_weaponNoise = false;

//If enabled, AI group will attempt to track down player responsible for killing a group member. Players with radios will be given text warnings if they are being pursued (Default: true)
DZAI_findKiller = true;	

//If normal probability check for spawning NVGs fails, then give AI temporary NVGs only if they are spawned with weapongrade 1 or higher (applies only during nighttime hours). Temporary NVGs are unlootable and will be removed at death (Default: false).									
DZAI_tempNVGs = false;	

//Amount of humanity to reward player for killing an AI unit (Default: 0)									
DZAI_humanityGain = 0;										

//If enabled, players with radios will be given text warnings if they are being pursued by AI groups. (Default: true)
DZAI_radioMsgs = true;

//If enabled, last surviving unit of a group will be granted slightly boosted skills. No effect if unit is spawned alone (Default: false)
DZAI_lastManStanding = false;


/*DZAI client-side addon settings. 
**NOTE**: These settings require the DZAI client-side addon to be installed to your mission pbo file in order to work.
--------------------------------------------------------------------------------------------------------------------*/	

//Enable to use client-side radio addon for radio messages instead of remote execution method. (Default: false)
DZAI_clientRadio = false;

//Enable or disable AI hostility to zombies. If enabled, AI units spawned by DZAI will attack nearby zombies. (Default: false)
DZAI_zombieEnemy = true;	

//Maximum distance (in meters) for AI group leader to detect zombies. Increasing range beyond default may negatively impact server performance. (Default: 150)							
DZAI_zDetectRange = 300;									


/*	Static AI Spawning Settings
--------------------------------------------------------------------------------------------------------------------*/	

//Enable or disable static AI spawns. If enabled, AI spawn points will be generated in cities, towns, and other predefined areas. Does not affect custom-defined spawns (Default: true).
DZAI_staticAI = true;

//Set minimum and maximum wait time in seconds to respawn an AI group after all units have been killed. Applies to both static AI and custom spawned AI (Default: Min 300, Max 600).									
DZAI_respawnTimeMin = 300;
DZAI_respawnTimeMax = 600;

//Time to allow spawned AI units to exist in seconds before being despawned when no players are present in a trigger area. Applies to both static AI and custom spawned AI (Default: 120)										
DZAI_despawnWait = 120;										

//Respawn limits. Set to -1 for unlimited respawns. (Default: -1 for each).
DZAI_respawnLimit0 = -1; //Respawn limit for low level AI found in low-value areas (Default: -1)
DZAI_respawnLimit1 = -1; //Respawn limit for mid level AI found in cities and other mid-value areas (Default: -1)
DZAI_respawnLimit2 = -1; //Respawn limit for high level AI found in places with military loot (Default: -1)
DZAI_respawnLimit3 = -1; //Respawn limit for very high level AI in places with high-grade military loot (Default: -1)


/*	Dynamic AI Spawning Settings
--------------------------------------------------------------------------------------------------------------------*/		

//Enable or disable dynamic AI spawns. If enabled, AI spawn locations will be generated for randomly selected players at randomized intervals (Default: true)									
DZAI_dynAISpawns = false;

//Time (seconds) required to reach maximum spawn probability per player, after which the probability is reset to 0%. Lower number = More frequent spawns, Higher Number = Less frequent. (Recommended range: 1200-2700, Default: 1800)
DZAI_maxSpawnTime = 1800;

//Time (seconds) to allow each player to retain maximum spawn probability. (Default: 1800).
DZAI_keepMaxSpawnTime = 1800;

//Probability for dynamic AI to actively hunt a targeted player. If probability check fails, dynamic AI will patrol the area instead of hunting (Default: 0.50)
DZAI_huntingChance = 0.50;

//Probability to send first available AI helicopter to reinforce dynamic AI group. No effect if DZAI_maxHeliPatrols is set to zero. (Default: 0.50)
DZAI_heliReinforceChance = 0.50;

//Array of area blacklist markers. Players within marker areas will not be targeted for dynamic AI spawns (Example: ["BlacklistArea1","BlacklistArea2","BlacklistArea3"])
//Epoch: DZAI will automatically set up 200m-radius blacklist areas around each trader area.
DZAI_dynAreaBlacklist = [];

//Time to wait before despawning all AI units in dynamic trigger area when no players are present. (Default: 120)
DZAI_dynDespawnWait = 120;

//Enable or disable dynamic spawn-free zones of 600m radius around player spawn areas. (Default: false)
DZAI_freshSpawnSafeArea = false;


/*	AI Air vehicle patrol settings. These AI vehicles will randomly travel between different cities and towns.
--------------------------------------------------------------------------------------------------------------------*/		

//Global maximum number of active AI air vehicle patrols. Set at 0 to disable (Default: 0).							
DZAI_maxHeliPatrols = 1;

//Set minimum and maximum wait time in seconds to respawn an AI vehicle patrol after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
DZAI_respawnTMinA = 600;
DZAI_respawnTMaxA = 900;

//Classnames of air vehicle types to use, with the maximum amount of each type to spawn. Default: [["UH1H_DZ",1]]
DZAI_heliList = [["UH1H_DZ",1]];

//Difficulty level of air vehicle patrol units. Difficulty level also affects unit loadout and loot. Possible values: 0 to 3 (Default: 3)
DZAI_heliUnitLevel = 3;

//Maximum number of gunner units per air vehicle. Limited by actual number of available gunner positions. (Default: 2)
DZAI_heliGunnerUnits = 3;

//Specify vehicle weapon for air vehicles that are unarmed by default. DZAI will arm these air vehicles with the specified weapons upon spawning each vehicle.
//Weapon classnames are verified. If the classname is invalid (banned or nonexistent), it will not be added to the vehicle.
//Format: Each row containing a vehicle classname will be equipped with the weapon from the corresponding row in weapon classnames section. DZAI will automatically select ammo type.
DZAI_airWeapons = [
	//Air vehicle classnames (Remember: no comma for last entry! Otherwise, separate each string with commas)
	["Helicopter1_Example_Classname","Helicopter2_Example_Classname"]
	,
	//Corresponding weapon classnames (Remember: no comma for last entry! Otherwise, separate each string with commas)
	["Helicopter1_Example_Weapon","Helicopter2_Example_Weapon"]
];


/*AI Land vehicle patrol settings. These AI vehicles will randomly travel between different cities and towns.
--------------------------------------------------------------------------------------------------------------------*/	

//Global maximum number of active AI land vehicle patrols. Set at 0 to disable (Default: 0).	
DZAI_maxLandPatrols = 0;

//Set minimum and maximum wait time in seconds to respawn an AI vehicle patrol after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
DZAI_respawnTMinL = 600;
DZAI_respawnTMaxL = 900;

//Classnames of land vehicle types to use, with the maximum amount of each type to spawn. Default: [["UAZ_Unarmed_TK_EP1",1]]
DZAI_vehList = [["UAZ_Unarmed_TK_EP1",1]];

//Difficulty level of land vehicle patrol units. Difficulty level also affects unit loadout and loot. Possible values: 0 to 3 (Default: 3)
DZAI_vehUnitLevel = 3;

//Maximum number of gunner units per land vehicle. Limited by actual number of available gunner positions. (Default: 1)
DZAI_vehGunnerUnits = 2;

//Maximum number of cargo units per land vehicle. Limited by actual number of available cargo positions. (Default: 3)
DZAI_vehCargoUnits = 3;


/*	AI Vehicle (Air & Land) Settings
--------------------------------------------------------------------------------------------------------------------*/

//Array of area blacklist markers. Areas covered by marker will not be used as waypoints for vehicle patrols. (Example: ["BlacklistArea1","BlacklistArea2","BlacklistArea3"])
//Note: Vehicles may still pass through these areas but will not make stops unless enemies are encountered.
DZAI_waypointBlacklist = [];


/*	AI weapon selection settings
--------------------------------------------------------------------------------------------------------------------*/

//True: Dynamically generate AI weapon list from CfgBuildingLoot (DayZ loot tables). False: Use preset weapon tables located near the end of this file. (Default: true).
//Highly recommended to enable DZAI_verifyTables if this option is set to false. 
DZAI_dynamicWeaponList = true;

//Determines whether DZAI reads from default DayZ loot tables for dynamic AI weapon generation or from user-installed custom loot tables. (Default: false)
//No effect if DZAI_dynamicWeaponList is 'false'. If DZAI is unable to find custom loot tables installed, default loot tables will be used instead. If no loot tables are found, DZAI will use prebuilt weapon tables.
DZAI_customLootTables = false;

//List of classnames of weapons that AI should never use. By default, AI may carry any lootable weapon. (Only if DZAI_dynamicWeaponList = true)  
//Example: DZAI_banAIWeapons = ["M107_DZ","BAF_AS50_scoped"] will remove the M107 and AS50 from AI weapon tables if dynamic weapon list is enabled.								
//Note: It is recommended to add all melee weapon classnames into this list as AI have issues using melee weapons. 
//Pre-banned weapons by DZAI: "Crossbow_DZ","Crossbow","MeleeHatchet","MeleeCrowbar","MeleeMachete","MeleeBaseball","MeleeBaseBallBat","MeleeBaseBallBatBarbed","MeleeBaseBallBatNails"
DZAI_banAIWeapons = [];										

//List of launcher-type weapons for mid/high-level AI to use (by default, weapongrade 1/2/3), example: ["M136"]. If left empty, AI will not use launcher weapons. (Default: [])
//If AI encounter an armored player vehicle, they will switch to a randomly-selected launcher-type weapon to engage.
//Weapon classnames added here are verified if DZAI_verifyTables is set to true. Note: Launcher weapons are removed from the AI unit upon death.
DZAI_launcherTypes = [];	

//List of AI weapongrades that are permitted to use launcher-type weapons. Individual custom weapongrade levels may be added to allow launcher use (Default: [1,2,3])
DZAI_launcherLevels = [1,2,3];								

//Limit of number of launcher-type weapons to add to each AI group. Groups cannot have more launcher weapons than their weapongrade value (Default: 1).
DZAI_launchersPerGroup = 1;


/*	AI loot quantity settings
--------------------------------------------------------------------------------------------------------------------*/

//Number of selections of medical items (Inventory)
DZAI_invmedicals = 1;

//Number of selections of edible items (Inventory) 										
DZAI_invedibles = 1;	

//Number of selections of medical items (Backpack)									
DZAI_bpmedicals = 1; 	

//Number of selections of edible items (Backpack)									
DZAI_bpedibles = 1;	

//Maximum number of items to select from DZAI_MiscItemS table.										
DZAI_numMiscItemS = 3;						

//Maximum number of items to select from DZAI_MiscItemL table.				
DZAI_numMiscItemL = 1;										


/*	AI loot probability settings
--------------------------------------------------------------------------------------------------------------------*/

//Chance to add each medical item.
DZAI_chanceMedicals = 0.70;	

//Chance to add each edible item.								
DZAI_chanceEdibles = 0.70;

//Chance to add each random item from DZAI_MiscItemS table.									
DZAI_chanceMiscItemS = 0.60;

//Chance to add each random item from DZAI_MiscItemL table.								
DZAI_chanceMiscItemL = 0.15;								


/*AI weapon/skill probabilities (gradeChances should add up to 1.00) - [Civilian, Military, MilitarySpecial, HeliCrash] - Note: AI with higher grade weaponry will also have higher skill settings.
--------------------------------------------------------------------------------------------------------------------*/

//equipType level 0 - most AI will have basic pistols or rifles, and occasionally common military weapons.
DZAI_gradeChances0 = [0.90,0.10,0.00,0.00];	

//equipType level 1 - most AI will have common rifles, many will have common military weapons. Very rarely, AI will spawn with high-grade military or helicrash weapons.				
DZAI_gradeChances1 = [0.65,0.30,0.04,0.01];	

//equipType level 2 - most AI carry military weapons, and occasionally high-grade military weapons.				
DZAI_gradeChances2 = [0.15,0.65,0.15,0.05];

//equipType level 3 - All AI will carry at least a military-grade weapon. Many will be carrying high-grade military weapons. Note: Air and land vehicle patrols use equipType level 3.					
DZAI_gradeChances3 = [0.00,0.50,0.35,0.15];	

//equipType level "dynamic" - Weapongrade chances for dynamic-spawned AI. Majority of dynamic AI will be carrying low-grade military weapons, some will carry high-grade military.			
DZAI_gradeChancesDyn = [0.00,0.88,0.09,0.03];				


/*
	AI skill settings
	Skill Level: Description
	0-1: Low to medium-skilled AI. Most common type of AI encountered. Intended to challenge players.
	2-3: High-skilled AI. Uncommon/rare type of AI found in places with military loot. Intended to kill players.
	Hint: The best way to quickly adjust AI difficulty is by modifying aimingAccuracy value. For all skill types, higher number = better skill.
*/

//AI skill settings level 0 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.50
DZAI_skill0 = [	
	["aimingAccuracy",0.10,0.125],
	["aimingShake",0.50,0.59],
	["aimingSpeed",0.50,0.59],
	["endurance",0.50,0.59],
	["spotDistance",0.50,0.59],
	["spotTime",0.50,0.59],
	["courage",0.50,0.59],
	["reloadSpeed",0.50,0.59],
	["commanding",0.60,0.69],
	["general",0.60,0.69]
];

//AI skill settings level 1 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.60
DZAI_skill1 = [	
	["aimingAccuracy",0.125,0.15],
	["aimingShake",0.60,0.69],
	["aimingSpeed",0.60,0.69],
	["endurance",0.60,0.69],
	["spotDistance",0.60,0.69],
	["spotTime",0.60,0.69],
	["courage",0.60,0.69],
	["reloadSpeed",0.60,0.69],
	["commanding",0.70,0.79],
	["general",0.70,0.79]
];

//AI skill settings level 2 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.70
DZAI_skill2 = [	
	["aimingAccuracy",0.175,0.225],
	["aimingShake",0.70,0.79],
	["aimingSpeed",0.70,0.79],
	["endurance",0.70,0.79],
	["spotDistance",0.70,0.79],
	["spotTime",0.70,0.79],
	["courage",0.70,0.79],
	["reloadSpeed",0.70,0.79],
	["commanding",0.80,0.89],
	["general",0.80,0.89]
];

//AI skill settings level 3 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.80
DZAI_skill3 = [	
	["aimingAccuracy",0.225,0.250],
	["aimingShake",0.80,0.89],
	["aimingSpeed",0.80,0.89],
	["endurance",0.80,0.89],
	["spotDistance",0.80,0.89],
	["spotTime",0.80,0.89],
	["courage",0.80,0.89],
	["reloadSpeed",0.80,0.89],
	["commanding",0.90,0.99],
	["general",0.90,0.99]
];


/*
	Additional AI skill settings can be defined (DZAI_skill4 - DZAI_skill9) for the corresponding custom weapongrade level using the same format above.
	Note: If a custom weapongrade is used without defining the corresponding custom skill settings, DZAI_skill3 settings will be used instead.
	Instructions: replace "nil" with the skill array. Refer to the above preset skill arrays for examples.
	Custom AI skill settings can only be used with custom-defined spawns (spawns created using the DZAI_spawn function).
*/

//weapongrade 4 skills
DZAI_skill4 = nil; 

//weapongrade 5 skills
DZAI_skill5 = nil; 

//weapongrade 6 skills
DZAI_skill6 = nil; 

//weapongrade 7 skills
DZAI_skill7 = nil; 

//weapongrade 8 skills
DZAI_skill8 = nil;

//weapongrade 9 skills
DZAI_skill9 = nil; 


/*
	AI weapon, loot, and equipment settings
	
	DZAI will first load the classname tables defined below, the modify the settings according to the DayZ map/mod being run.
	
	Example: DZAI will always first load the classname tables defined below, then if DayZ Epoch is detected, DZAI will add or overwrite settings specified by \world_classname_configs\epoch\dayz_epoch.sqf. 
	
*/

//Default weapon classname tables - DZAI will ONLY use these tables if the dynamic weapon list (DZAI_dynamicWeaponList) is disabled, otherwise they are ignored and overwritten if it is enabled.
//Note: Low-level AI (weapongrade 0) may use pistols listed in DZAI_Pistols0 or DZAI_Pistols1. Mid/high level AI (weapongrade 1+) will carry pistol weapons but not use them - they will use rifle weapons instead.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_Pistols0 = ["Makarov","Colt1911","revolver_EP1"]; 				//Weapongrade 0 pistols
DZAI_Pistols1 = ["M9","M9SD","MakarovSD","UZI_EP1","glock17_EP1"]; 	//Weapongrade 1 pistols
DZAI_Pistols2 = ["M9SD","MakarovSD","UZI_EP1","glock17_EP1"]; 		//Weapongrade 2 pistols
DZAI_Pistols3 = ["M9SD","MakarovSD","UZI_EP1","glock17_EP1"]; 		//Weapongrade 3 pistols

DZAI_Rifles0 = ["LeeEnfield","Winchester1866","MR43","huntingrifle","LeeEnfield","Winchester1866","MR43"]; //Weapongrade 0 rifles
DZAI_Rifles1 = ["M16A2","M16A2GL","AK_74","M4A1_Aim","AKS_74_kobra","AKS_74_U","AK_47_M","M24","M1014","DMR_DZ","M4A1","M14_EP1","Remington870_lamp","MP5A5","MP5SD","M4A3_CCO_EP1"]; //Weapongrade 1 rifles
DZAI_Rifles2 = ["M16A2","M16A2GL","M249_DZ","AK_74","M4A1_Aim","AKS_74_kobra","AKS_74_U","AK_47_M","M24","SVD_CAMO","M1014","DMR_DZ","M4A1","M14_EP1","Remington870_lamp","M240_DZ","M4A1_AIM_SD_camo","M16A4_ACG","M4A1_HWS_GL_camo","Mk_48_DZ","M4A3_CCO_EP1","Sa58V_RCO_EP1","Sa58V_CCO_EP1","M40A3","Sa58P_EP1","Sa58V_EP1"]; //Weapongrade 2 rifles
DZAI_Rifles3 = ["FN_FAL","FN_FAL_ANPVS4","Mk_48_DZ","M249_DZ","BAF_L85A2_RIS_Holo","G36C","G36C_camo","G36A_camo","G36K_camo","AK_47_M","AKS_74_U","M14_EP1","bizon_silenced","DMR_DZ","RPK_74"]; //Weapongrade 3 rifles

	
/*
	Custom rifle tables can be defined below this line (DZAI_Rifles4 - DZAI_Rifles9) for the corresponding custom weapongrade level using the same format above. 
	Note: If a custom weapongrade is used without defining the corresponding custom rifle array, the DZAI_Rifles3 array will be used instead.
	Instructions: Replace "nil" with the wanted rifle array. Refer to the above rifle arrays for examples on how to define custom rifle tables.
	Custom rifle tables can only be used with custom-defined spawns (spawns created using the DZAI_spawn function). 
*/

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_Rifles4 = nil; //weapongrade 4 weapons
DZAI_Rifles5 = nil; //weapongrade 5 weapons
DZAI_Rifles6 = nil; //weapongrade 6 weapons
DZAI_Rifles7 = nil; //weapongrade 7 weapons
DZAI_Rifles8 = nil; //weapongrade 8 weapons
DZAI_Rifles9 = nil; //weapongrade 9 weapons


//AI skin classnames. DZAI will use any of these classnames for AI spawned. Note: Additional skins may be included on a per-map or per-mod basis - see folders in \world_classname_configs
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_BanditTypes = ["Survivor2_DZ", "SurvivorW2_DZ", "Bandit1_DZ", "BanditW1_DZ", "Camo1_DZ", "Sniper1_DZ"];


//AI Backpack types (for weapongrade levels 0-3)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_Backpacks0 = ["DZ_Patrol_Pack_EP1","DZ_Czech_Vest_Puch","DZ_Assault_Pack_EP1"];
DZAI_Backpacks1 = ["DZ_Patrol_Pack_EP1","DZ_Czech_Vest_Puch","DZ_Assault_Pack_EP1","DZ_British_ACU","DZ_TK_Assault_Pack_EP1","DZ_CivilBackpack_EP1","DZ_ALICE_Pack_EP1"];
DZAI_Backpacks2 = ["DZ_CivilBackpack_EP1","DZ_British_ACU","DZ_Backpack_EP1"];
DZAI_Backpacks3 = ["DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];


//AI Food/Medical item types. DZAI_Edibles: Drinkable and edible items. DZAI_Medicals1: List of common medical items to be added to AI inventory. DZAI_Medicals2: List of all medical items available only in hospitals to be added to AI backpack.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_Edibles = ["ItemSodaCoke", "ItemSodaPepsi", "ItemWaterbottle", "FoodCanSardines", "FoodCanBakedBeans", "FoodCanFrankBeans", "FoodCanPasta", "ItemWaterbottleUnfilled","ItemWaterbottleBoiled","FoodmuttonCooked","FoodchickenCooked","FoodBaconCooked","FoodRabbitCooked","FoodbaconRaw","FoodchickenRaw","FoodmuttonRaw","foodrabbitRaw","FoodCanUnlabeled","FoodPistachio","FoodNutmix","FoodMRE"];
DZAI_Medicals1 = ["ItemBandage", "ItemPainkiller"];
DZAI_Medicals2 = ["ItemPainkiller", "ItemMorphine", "ItemBandage", "ItemBloodbag", "ItemAntibiotic","ItemEpinephrine"];


//AI Miscellaneous item types. DZAI_MiscItemS: List of random low-value items. DZAI_MiscItemL: List of random semi-valuable/useful items
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_MiscItemS = ["ItemHeatpack", "HandRoadFlare", "HandChemBlue", "HandChemRed", "HandChemGreen","SmokeShell","TrashTinCan","TrashJackDaniels","ItemSodaEmpty"];
DZAI_MiscItemL = ["ItemJerrycan", "PartWheel", "PartEngine", "PartFueltank", "PartGlass", "PartVRotor","PartWoodPile"];


//AI toolbelt item types. Toolbelt items are added to AI inventory upon death. Format: [item classname, item probability]
//Weapongrade level 0-1 AI will use DZAI_tools0 table, weapongrade level 2-3 AI will use DZAI_tools1 table. Custom-spawned AI will use DZAI_tools1 table.
//NOTE: Do not delete any elements from this list, set its chance to zero intead. Only add elements to the end of the array, not in the middle.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_tools0 = [["ItemFlashlight",0.65],["ItemWatch",0.65],["ItemKnife",0.50],["ItemHatchet",0.40],["ItemCompass",0.40],["ItemMap",0.35],["ItemToolbox",0.15],["ItemMatchbox",0.15],["ItemFlashlightRed",0.05],["ItemGPS",0.005],["ItemRadio",0.005],["ItemCrowbar",0.15]];
DZAI_tools1 = [["ItemFlashlight",0.75],["ItemWatch",0.75],["ItemKnife",0.75],["ItemHatchet",0.70],["ItemCompass",0.75],["ItemMap",0.70],["ItemToolbox",0.35],["ItemMatchbox",0.40],["ItemFlashlightRed",0.10],["ItemGPS",0.10],["ItemRadio",0.075],["ItemCrowbar",0.35]];


//AI-useable toolbelt item types. These items are added to AI inventory at unit creation and may be used by AI. Format: [item classname, item probability]
//Weapongrade level 0-1 AI will use DZAI_gadgets0 table, weapongrade level 2-3 AI will use DZAI_gadgets1 table. Custom-spawned AI will use DZAI_gadgets1 table.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_gadgets0 = [["binocular",0.40],["NVGoggles",0.00]];
DZAI_gadgets1 = [["binocular",0.60],["NVGoggles",0.05]];



//NOTHING TO EDIT BEYOND THIS POINT

//Load custom DZAI settings file.
if ((!isNil "DZAI_overrideEnabled") && {DZAI_overrideEnabled}) then {call compile preprocessFileLineNumbers format ["%1\DZAI_settings_override.sqf",DZAI_directory]};

diag_log "[DZAI] DZAI configuration file loaded.";
