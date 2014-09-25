/*
	Sauerland static spawn configuration 
	
	Last updated: 9:07 PM 1/23/2014
	
*/

#include "spawn_markers\markers_sauerland.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [12270.443, 13632.132];
	"DZAI_centerMarker" setMarkerSize [17500, 17500];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	#include "spawn_areas\areas_sauerland.sqf"		//Load spawn area definitions file.
	//marker name, [minimum AI, max additional AI], [markers for manual spawn points] (leave as empty array to use nearby buildings as spawn points), equipType (optional, required if number of AI groups is defined), number of AI groups (optional)
	//AUTO GENERATED
	['DZAI_Wenden_Airfield',[2,1],[],2] call DZAI_static_spawn;
	['DZAI_Old_Airfield',[2,1],[],3] call DZAI_static_spawn;
	['DZAI_Fernsehturm',[0,2],[],3] call DZAI_static_spawn;
	['DZAI_Heidermuehle',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Arnsberg',[2,0],[],1,2] call DZAI_static_spawn;
	['DZAI_Suederbarup',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Klein_Sodenau',[0,1],[],1] call DZAI_static_spawn;
	['DZAI_Reine',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Heggen',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_Berghausen',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_Moosbach',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_Strelingen',[0,2],[],0] call DZAI_static_spawn;
	['DZAI_Garbow',[2,1],[],1,2] call DZAI_static_spawn;
	['DZAI_Ihrhofen',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Ihren',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Berghoven',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Grossenfelde',[1,2],[],0] call DZAI_static_spawn;
	['DZAI_Oberdorf',[1,1],[],1,2] call DZAI_static_spawn;
	['DZAI_Oeventrop',[2,1],[],1,2] call DZAI_static_spawn;
	['DZAI_Schmallenberg',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_Schueren',[0,2],[],0] call DZAI_static_spawn;
	['DZAI_Hoeinghausen',[0,2],[],0] call DZAI_static_spawn;
	['DZAI_Fahrenbrecht',[2,1],[],2] call DZAI_static_spawn;
	['DZAI_Meschede',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Uhlenbusch',[2,0],[],1] call DZAI_static_spawn;
	['DZAI_Niederbergbach',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Rhaude',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_Osterholz',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Remblinghausen',[1,1],[],0,2] call DZAI_static_spawn;
	['DZAI_Buersfeld',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Seedorf',[1,1],[],0,2] call DZAI_static_spawn;
	['DZAI_Niedersalvey',[1,1],[],1] call DZAI_static_spawn;
	//MANUAL GENERATED
	['DZAI_Old_Airfield2',[2,1],[],2] call DZAI_static_spawn;
	['DZAI_OldAirfieldTown',[1,1],[],1] call DZAI_static_spawn;
	['DZAI_OldAirfieldVillage',[0,1],[],1] call DZAI_static_spawn;
	['DZAI_Fahrenbrecht2',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Fahrenbrecht3',[2,0],[],1] call DZAI_static_spawn;
	['DZAI_Fahrenbrecht4',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Fahrenbrecht5',[2,0],[],1] call DZAI_static_spawn;
	['DZAI_Fahrenbrecht6',[1,1],[],0] call DZAI_static_spawn;
	['DZAI_Niedersalvey2',[1,1],[],1] call DZAI_static_spawn;
	['DZAI_Uhlenbusch2',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Uhlenbusch3',[1,1],[],1] call DZAI_static_spawn;
	['DZAI_WestMilBase',[2,1],[],3] call DZAI_static_spawn;
	['DZAI_Loc332',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_Arnsberg2',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Nordern',[2,0],[],1] call DZAI_static_spawn;
	['DZAI_NordernBarracks',[2,0],[],3] call DZAI_static_spawn;
	['DZAI_Nordern2',[1,1],[],1] call DZAI_static_spawn;
	['DZAI_Loc80',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_RiverRailway',[1,1],[],1] call DZAI_static_spawn;
	['DZAI_NorthMilBase',[2,1],[],3,2] call DZAI_static_spawn;
	['DZAI_TownWithChurch',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_WendenBarracks',[2,0],[],3] call DZAI_static_spawn;
	['DZAI_Meschede1',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede2',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede3',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede4',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede5',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede6',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede7',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede8',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede9',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede10',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede11',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede12',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_Meschede13',[2,1],[],1] call DZAI_static_spawn;
	['DZAI_NorthMilBase2',[2,1],[],3] call DZAI_static_spawn;
	['DZAI_Reine2',[0,1],[],0] call DZAI_static_spawn;
	['DZAI_SEMilBase',[2,0],[],2] call DZAI_static_spawn;
	['DZAI_GarbowMilBase',[2,1],[],3] call DZAI_static_spawn;
	['DZAI_GarbowIndustrial',[1,1],[],0] call DZAI_static_spawn;
};

#include "custom_markers\cust_markers_sauerland.sqf"
#include "custom_spawns\cust_spawns_sauerland.sqf"

diag_log "Sauerland static spawn configuration loaded.";
