/*
	Podagorsk static spawn configuration 
	
	Last updated: 3:32 PM 6/21/2014
	
*/

#include "spawn_markers\markers_podagorsk.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [10771.362, 8389.2568];
	"DZAI_centerMarker" setMarkerSize [2750, 2750];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	//begin spawns
	#include "spawn_areas\areas_podagorsk.sqf"		//Load spawn area definitions file.
	
	['DZAI_BolshevikS',[0,2],[],1] call DZAI_static_spawn;
	['DZAI_Bolshevik',[2,0],[],2] call DZAI_static_spawn;
	['DZAI_BolshevikN',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_BolshevikBarracks',[3,0],[],3] call DZAI_static_spawn;
	['DZAI_OstrovYBarracks',[3,0],[],3] call DZAI_static_spawn;
	['DZAI_KrasnoflotskiyeBarracks',[2,1],[],3] call DZAI_static_spawn;
	['DZAI_Tobolsk',[0,2],[],0] call DZAI_static_spawn;
	['DZAI_TobolskTowers',[0,2],[],0] call DZAI_static_spawn;
	['DZAI_KronotskyBarracks',[2,0],[],3] call DZAI_static_spawn;
	['DZAI_SonaBarracks',[2,0],[],3,2] call DZAI_static_spawn;
	['DZAI_Protvino',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_ProtvinoBarrack',[1,1],[],3] call DZAI_static_spawn;
	['DZAI_PijmaBarracks',[2,0],[],3] call DZAI_static_spawn;
	['DZAI_BereznikiE',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_BereznikiW',[1,1],[],1] call DZAI_static_spawn;
	['DZAI_Kirsanov',[0,1],[],1] call DZAI_static_spawn;
	['DZAI_BoronukBarracks',[2,1],[],3] call DZAI_static_spawn;
	['DZAI_Kovrov',[1,1],[],1] call DZAI_static_spawn;
	['DZAI_Zirnitra',[0,2],[],0] call DZAI_static_spawn;
	['DZAI_Sona',[1,1],[],3] call DZAI_static_spawn;
	//end of spawns
};

#include "custom_markers\cust_markers_podagorsk.sqf"
#include "custom_spawns\cust_spawns_podagorsk.sqf"

diag_log "Podagorsk static spawn configuration loaded.";
