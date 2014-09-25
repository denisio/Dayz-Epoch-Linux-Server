/*
	Namalsk Classname Configuration
	
	Last updated: 6:26 PM 1/24/2014
	
*/

//Classname-related settings for Namalsk
DZAI_BanditTypes = [DZAI_BanditTypes,["CamoWinterW_DZN", "CamoWinter_DZN", "Sniper1W_DZN"]] call DZAI_append;
DZAI_tools0 = [DZAI_tools0,[["BrokenItemGPS",0.04],["BrokenNVGoggles",0.04],["BrokenItemRadio",0.02],["ItemSolder",0.01],["APSI",0.01]]] call DZAI_append;
DZAI_tools1 = [DZAI_tools0,[["BrokenItemGPS",0.04],["BrokenNVGoggles",0.04],["BrokenItemRadio",0.02],["ItemSolder",0.01],["APSI",0.01]]] call DZAI_append;

//Modify item-related settings for Namalsk
DZAI_gadgets0 set [1,["NVGoggles",0.005]];	//Reduce probability of functional NVGs
DZAI_tools0 set [9,["ItemGPS",0.005]];		//Reduce probability of functional GPS
DZAI_chanceMedicals = 0.25;					//Reduce probability of medical items			
DZAI_chanceEdibles = 0.25;					//Reduce probability of edible items
				
diag_log "[DZAI] Namalsk classnames loaded.";
