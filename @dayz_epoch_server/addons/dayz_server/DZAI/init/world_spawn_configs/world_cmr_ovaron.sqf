/*
	Ovaron static spawn configuration 
	
	Last updated: 9:07 PM 1/23/2014
	
*/

#include "spawn_markers\markers_cmr_ovaron.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	//"DZAI_centerMarker" setMarkerPos [10240,10240]; //To do: Find proper value
	//"DZAI_centerMarker" setMarkerSize [8500, 8500]; //To do: Find proper value
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	[] execVM format ["%1\scripts\setup_autoStaticSpawns.sqf",DZAI_directory]; //IMPORTANT: REMOVE THIS ENTIRE LINE BEFORE ADDING STATIC SPAWNS HERE
};

#include "custom_markers\cust_markers_cmr_ovaron.sqf"
#include "custom_spawns\cust_spawns_cmr_ovaron.sqf"

diag_log "Ovaron static spawn configuration loaded.";