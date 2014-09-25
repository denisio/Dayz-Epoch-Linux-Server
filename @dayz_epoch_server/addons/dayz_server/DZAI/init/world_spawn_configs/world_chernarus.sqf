/*
	Chernarus static spawn configuration 
	
	Last updated: 3:37 PM 12/24/2013
	
*/

#include "spawn_markers\markers_chernarus.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [7652.9634, 7870.8076];
	"DZAI_centerMarker" setMarkerSize [5500, 5500];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	#include "spawn_areas\areas_chernarus.sqf"		//Load spawn area definitions file.
	
	//marker name, [minimum AI, max additional AI], [markers for manual spawn points] (leave as empty array to use nearby buildings as spawn points), equipType (optional, required if number of AI groups is defined), number of AI groups (optional)
	["DZAI_Kamenka",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Komarovo",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Balota",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_BalotaAirstrip",[1,1],['Balota1','Balota2','Balota3','Balota4','Balota5'],1] call DZAI_static_spawn;
	["DZAI_Cherno1",[1,2],[],1] call DZAI_static_spawn;
	["DZAI_Cherno2",[1,1],[],0] call DZAI_static_spawn;
	["DZAI_Cherno3",[1,1],[],0] call DZAI_static_spawn;
	["DZAI_Cherno4",[2,1],[],1] call DZAI_static_spawn;
	["DZAI_Elektro1",[1,1],[],0] call DZAI_static_spawn;
	["DZAI_Elektro2",[1,2],[],1] call DZAI_static_spawn;
	["DZAI_Elektro3",[1,2],[],0] call DZAI_static_spawn;
	["DZAI_Skalisty",[0,1],['Skalisty1','Skalisty2','Skalisty3'],1] call DZAI_static_spawn;
	["DZAI_Kamyshovo",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Tulga",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Rog",[2,2],['CastleRog','CastleRog2','Rog3','Rog4'],1] call DZAI_static_spawn;
	["DZAI_Pusta",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_ThreeValleys",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Solnichniy",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_SolnichniyFactory",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Nizhnoye",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Orlovets",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Berezino",[2,1],[],1] call DZAI_static_spawn;
	["DZAI_Berezino2",[0,2],[],1] call DZAI_static_spawn;
	["DZAI_Berezino3",[2,1],[],1] call DZAI_static_spawn;
	["DZAI_Berezino4",[2,1],[],1] call DZAI_static_spawn;
	["DZAI_Khelm",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Olsha",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_NEAF",[2,2],['NEAF1','NEAF2','NEAF3','NEAF4','NEAF5'],2] call DZAI_static_spawn;
	["DZAI_Krasnostav",[1,1],[],2] call DZAI_static_spawn;
	["DZAI_Gvozdno",[0,2],[],2] call DZAI_static_spawn;
	["DZAI_Pavlovo",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Bor",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Msta",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Staroye",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Dolina",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_OrlovetsFactory",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_DubrovkaNW",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Dubrovka",[0,2],[],1] call DZAI_static_spawn;
	["DZAI_Polana",[1,2],[],1] call DZAI_static_spawn;
	["DZAI_Mogilevka",[0,2],[],1] call DZAI_static_spawn;
	["DZAI_Nadezhdino",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_Zub",[2,2],['CastleZub','CastleZub2','Zub3','Zub4'],1] call DZAI_static_spawn;
	["DZAI_Kozlovka",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Drozhino",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Zelenogorsk",[1,1],[],1,2] call DZAI_static_spawn;
	["DZAI_GreenMountain",[0,3],[],2] call DZAI_static_spawn;
	["DZAI_Shakhovka",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Guglovo",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Vyshnoye",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Pulkovo",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Sosnovka",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Myshkino",[0,2],[],1] call DZAI_static_spawn;
	["DZAI_Pustoshka",[1,2],[],1] call DZAI_static_spawn;
	["DZAI_Vybor",[1,2],[],2] call DZAI_static_spawn;
	["DZAI_Pogorevka",[0,2],[],1] call DZAI_static_spawn;
	["DZAI_Rogovo",[0,1],[],1] call DZAI_static_spawn;
	["DZAI_Gorka",[0,2],[],2] call DZAI_static_spawn;
	["DZAI_NovySobor",[2,1],[],2] call DZAI_static_spawn;
	["DZAI_StarySobor",[2,0],[],2,2] call DZAI_static_spawn;	//Recommended to remove for Epoch servers
	["DZAI_Kabanino",[1,2],[],1] call DZAI_static_spawn;
	["DZAI_Lopatino",[0,2],[],2] call DZAI_static_spawn;
	["DZAI_DevilsCastle",[2,2],['DevilsCastle','DevilsCastle2','Devils3','Devils4'],1] call DZAI_static_spawn;
	["DZAI_Grishino",[1,2],[],2] call DZAI_static_spawn;
	["DZAI_NWAF2",[3,0],[],3] call DZAI_static_spawn;
	["DZAI_NWAF3",[3,0],[],3] call DZAI_static_spawn;
	["DZAI_NWAF4",[2,1],['NWAF4_1','NWAF4_2','NWAF4_3','NWAF4_4'],2] call DZAI_static_spawn;
	["DZAI_NWAF5",[2,1],['NWAF5_1','NWAF5_2','NWAF5_3','NWAF5_4'],2] call DZAI_static_spawn;
	["DZAI_NWAF6",[2,1],['NWAF6_1','NWAF6_2','NWAF6_3','NWAF6_4'],2] call DZAI_static_spawn;
	["DZAI_NWAF7",[2,1],['NWAF7_1','NWAF7_2','NWAF7_3','NWAF7_4'],2] call DZAI_static_spawn;
};

#include "custom_markers\cust_markers_chernarus.sqf"
#include "custom_spawns\cust_spawns_chernarus.sqf"

diag_log "Chernarus static spawn configuration loaded.";
