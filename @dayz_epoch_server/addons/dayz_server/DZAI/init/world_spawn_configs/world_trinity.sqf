/*
	Trinity Island static spawn configuration 
	
	Last updated: 11:44 AM 6/7/2013
	
*/

#include "spawn_markers\markers_trinity.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [7183.8403, 7067.4727];
	"DZAI_centerMarker" setMarkerSize [5250, 5250];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	#include "spawn_areas\areas_trinity.sqf"		//Load spawn area definitions file.
	
	//marker name, [minimum AI, max additional AI], [markers for manual spawn points] (leave as empty array to use nearby buildings as spawn points), equipType (optional, required if number of AI groups is defined), number of AI groups (optional)
	["DZAI_StansfieldAirport",[2,2],[],2] call DZAI_static_spawn;
	["DZAI_FarmArea",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_HouseArea1",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_HouseArea2",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_Edan"] call DZAI_static_spawn;
	["DZAI_Barracks1",[2,1]] call DZAI_static_spawn;
	["DZAI_ChapelHill",[0,1]] call DZAI_static_spawn;
	["DZAI_SarasotaS"] call DZAI_static_spawn;
	["DZAI_Sarasota"] call DZAI_static_spawn;
	["DZAI_CoastalHouse",[0,1]] call DZAI_static_spawn;
	["DZAI_Rivlin",[2,2]] call DZAI_static_spawn;
	["DZAI_RivlinChurch"] call DZAI_static_spawn;
	["DZAI_MilBase",[1,1],[],3] call DZAI_static_spawn;
	["DZAI_Ellesmere"] call DZAI_static_spawn;
	["DZAI_Bree",[1,2]] call DZAI_static_spawn;
	["DZAI_Helm",[1,2]] call DZAI_static_spawn;
	["DZAI_HelmE"] call DZAI_static_spawn;
	["DZAI_MilBase2"] call DZAI_static_spawn;
	["DZAI_MilBase3"] call DZAI_static_spawn;
	["DZAI_Abbeyfield",[2,1]] call DZAI_static_spawn;
	["DZAI_StFrances"] call DZAI_static_spawn;
	["DZAI_StFrancesW",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Contra",[2,1]] call DZAI_static_spawn;
	["DZAI_ContraNW"] call DZAI_static_spawn;
	["DZAI_Richmond",[2,1]] call DZAI_static_spawn;
	["DZAI_Totley",[1,2],[],1,2] call DZAI_static_spawn;
	["DZAI_Koul"] call DZAI_static_spawn;
	["DZAI_DurrasHights"] call DZAI_static_spawn;
	["DZAI_LodgeMoor"] call DZAI_static_spawn;
	["DZAI_MilBase4",[2,1],[],2] call DZAI_static_spawn;
	["DZAI_MilBase5"] call DZAI_static_spawn;
	["DZAI_Deepcut",[2,2]] call DZAI_static_spawn;
	["DZAI_FarmArea2"] call DZAI_static_spawn;
	["DZAI_LibertyAirport",[2,1],[],2] call DZAI_static_spawn;
	["DZAI_Maine",[1,2]] call DZAI_static_spawn;
	["DZAI_Eastwick"] call DZAI_static_spawn;
	["DZAI_HessIsland",[0,2]] call DZAI_static_spawn;
	["DZAI_StattonPort"] call DZAI_static_spawn;
	["DZAI_HarleyW"] call DZAI_static_spawn;
	["DZAI_Harley"] call DZAI_static_spawn;
	["DZAI_MilBarracks",[2,2],[],3] call DZAI_static_spawn;
	["DZAI_Yale",[2,1]] call DZAI_static_spawn;
	["DZAI_YaleS",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Madison"] call DZAI_static_spawn;
	["DZAI_MilBase6"] call DZAI_static_spawn;
	["DZAI_Lavayette"] call DZAI_static_spawn;
	["DZAI_TimberlandN",[2,1]] call DZAI_static_spawn;
	["DZAI_MilBase7"] call DZAI_static_spawn;
	["DZAI_TimberlandIndustrial"] call DZAI_static_spawn;
};

#include "custom_markers\cust_markers_trinity.sqf"
#include "custom_spawns\cust_spawns_trinity.sqf"

diag_log "Trinity Island static spawn configuration loaded.";
