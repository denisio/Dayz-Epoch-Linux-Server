/*
	Napf static spawn configuration 
	
	
	
*/

#include "spawn_markers\markers_napf.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [10725.096, 9339.918];
	"DZAI_centerMarker" setMarkerSize [8500, 8500];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	if (DZAI_modName == "unleashed") then {
		call compile preprocessFileLineNumbers format ["%1\init\world_spawn_configs\world_dayzunleashed.sqf",DZAI_directory];
	} else {
		//Generic Napf static spawns begin here
		#include "spawn_areas\areas_napf.sqf"		//Load spawn area definitions file.
		
		//marker name, [minimum AI, max additional AI], [markers for manual spawn points] (leave as empty array to use nearby buildings as spawn points), equipType (optional, required if number of AI groups is defined), number of AI groups (optional)
		//Auto Generated
		['DZAI_Lenzburg',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_Trueb',[2,1],[],0] call DZAI_static_spawn;
		['DZAI_Seltisberg',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Neue_Welt',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Bubendorf',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Huttwil',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Ruchfeld',[0,2],[],0] call DZAI_static_spawn;
		['DZAI_Oberdorf',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Muttenz',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_Muenchenstein',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_Chatzbach',[2,1],[],1] call DZAI_static_spawn;
		['DZAI_Bruderholz',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Freidorf',[2,1],[],0] call DZAI_static_spawn;
		['DZAI_Olten',[1,1],[],0,2] call DZAI_static_spawn;
		['DZAI_Ruemlingen',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Hirsegg',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Lausen',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Unterdorf',[0,1],[],0] call DZAI_static_spawn;
		['DZAI_Luzern',[2,1],[],1,2] call DZAI_static_spawn;
		['DZAI_Emmen',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_Wolhusen',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Horw',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Meggen',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Liestal',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_Sachseln',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Eggwil',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Pfeffikon',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_Signau',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Schangen',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Hasle',[0,2],[],0] call DZAI_static_spawn;
		['DZAI_Worb',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_Munsingen',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Ittingen',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Hindelbank',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Homburg',[2,1],[],1] call DZAI_static_spawn;
		['DZAI_Sorenberg',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Romoos',[0,2],[],0] call DZAI_static_spawn;
		['DZAI_South_Airstrip',[1,1],[],2] call DZAI_static_spawn;
		['DZAI_Froburg',[2,1],[],2] call DZAI_static_spawn;
		['DZAI_Brienz',[1,1],[],0] call DZAI_static_spawn;
		//Manually added
		['DZAI_WorbE',[2,1],[],1] call DZAI_static_spawn;
		['DZAI_WorbN',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_WorbIndustrial',[0,2],[],0] call DZAI_static_spawn;
		['DZAI_MuenchensteinS',[0,1],[],0] call DZAI_static_spawn;
		['DZAI_MuenchensteinE',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_MuttenzN',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_SuhrenfeldMilitary',[2,1],[],3,2] call DZAI_static_spawn;
		['DZAI_SuhrenfeldBarracks',[1,1],[],3] call DZAI_static_spawn;
		['DZAI_TruebN',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Harbour',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_Magden',[1,1],[],0] call DZAI_static_spawn;
		['DZAI_LenzburgW',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_LenzburgE',[1,1],[],1] call DZAI_static_spawn;
		['DZAI_LenzburgIndustrial',[0,2],[],0] call DZAI_static_spawn;
		['DZAI_LuzernW',[1,1],[],0,2] call DZAI_static_spawn;
		['DZAI_LuzernS',[1,1],[],0,2] call DZAI_static_spawn;
		['DZAI_Airport',[2,1],[],3] call DZAI_static_spawn;
		['DZAI_AirportE',[2,0],[],2] call DZAI_static_spawn;
		['DZAI_Airbase',[2,1],[],3] call DZAI_static_spawn;
		['DZAI_AirbaseHangars',[1,1],[],2] call DZAI_static_spawn;
		['DZAI_MilanMilitary',[2,0],[],3] call DZAI_static_spawn;
		['DZAI_Nordstern',[0,1],[],0] call DZAI_static_spawn;
		['DZAI_SouthAirbaseBarracks',[2,0],[],3] call DZAI_static_spawn;
		['DZAI_SuhrenfeldHotels',[1,1],[],2] call DZAI_static_spawn;
	};
};

#include "custom_markers\cust_markers_napf.sqf"
#include "custom_spawns\cust_spawns_napf.sqf"

diag_log "Napf static spawn configuration loaded.";
