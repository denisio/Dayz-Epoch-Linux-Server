/*
	DayZ Epoch configuration
	
	Description: Adds DayZ Epoch-specific items to DZAI loot tables if Epoch mode is on.
	
	Last updated: 5:10 PM 9/8/2013
	
*/

DZAI_metalBars = [["ItemSilverBar",0.15],["ItemSilverBar10oz",0.10],["ItemGoldBar",0.075],["ItemGoldBar10oz",0.035]]; //Format: [["Bar1Classname",Bar1Chance],["Bar2Classname",Bar2Chance],["Bar2Classname",Bar2Chance]]
DZAI_metalBarNum = 2;		//Maximum number of metal bars to generate

DZAI_banditTypesNew = ["Bandit1_DZ","BanditW1_DZ","BanditW2_DZ","Camo1_DZ","Sniper1_DZ","Soldier1_DZ","Survivor2_DZ","SurvivorW2_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_2_DZ","RU_Policeman_DZ","Pilot_EP1_DZ","Haris_Press_EP1_DZ","Ins_Soldier_GL_DZ","GUE_Commander_DZ","Functionary1_EP1_DZ","Priest_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","TK_INS_Warlord_EP1_DZ","TK_INS_Soldier_EP1_DZ","Soldier_Sniper_PMC_DZ","Soldier_TL_PMC_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","Bandit2_DZ","SurvivorWcombat_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","Soldier_Bodyguard_AA12_PMC_DZ","GUE_Soldier_CO_DZ"];
DZAI_ediblesNew = ["ItemSodaRabbit","ItemSodaMtngreen","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste","ItemSodaLemonade","ItemSodaLvg","ItemSodaMzly","FoodBioMeat","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy","FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell","FoodCanTylers","FoodPumpkin","FoodSunFlowerSeed"];
DZAI_MiscItemSNew = ["ItemZombieParts"];

DZAI_Backpacks0New = ["DZ_TerminalPack_EP1"]; //Added: DZ_TerminalPack_EP1
DZAI_Backpacks1New = ["DZ_TerminalPack_EP1", "DZ_CompactPack_EP1"]; //Added: DZ_TerminalPack_EP1, DZ_CompactPack_EP1
DZAI_Backpacks2New = ["DZ_CompactPack_EP1","DZ_GunBag_EP1"]; //Added: DZ_CompactPack_EP1, DZ_GunBag_EP1
DZAI_Backpacks3New = ["DZ_GunBag_EP1","DZ_LargeGunBag_EP1"]; //Added: DZ_GunBag_EP1, DZ_LargeGunBag_EP1

//Do not edit below lines. Replaces standard hatchet and matchbox classnames with Epoch versions.
(DZAI_tools0 select 3) set [0,"ItemHatchet_DZE"];
(DZAI_tools0 select 7) set [0,"ItemMatchbox_DZE"];
(DZAI_tools1 select 3) set [0,"ItemHatchet_DZE"];
(DZAI_tools1 select 7) set [0,"ItemMatchbox_DZE"];

diag_log "[DZAI] Epoch classnames loaded.";
