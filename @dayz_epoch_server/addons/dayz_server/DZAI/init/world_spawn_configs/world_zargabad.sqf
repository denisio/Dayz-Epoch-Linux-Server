/*
	Zargabad static spawn configuration 
	
	Last updated: 11:44 AM 6/7/2013
	
*/

#include "spawn_markers\markers_zargabad.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [3917.6201, 3800.0376];
	"DZAI_centerMarker" setMarkerSize [2000, 2000];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {

//begin triggers

	_this = createTrigger ["EmptyDetector", [2873.4944, 4976.3965]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nango";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],1,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_0 = _this;

	_this = createTrigger ["EmptyDetector", [3416.9648, 4627.6279]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Road to Zargabad";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,175,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_3 = _this;

	_this = createTrigger ["EmptyDetector", [3631.8796, 4171.1382]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Zargabad Airfield";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,250,thisTrigger,[],2,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_5 = _this;

	_this = createTrigger ["EmptyDetector", [4136.916, 4173.3862]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ZargabadCenter";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,250,thisTrigger,[],1,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_9 = _this;

	_this = createTrigger ["EmptyDetector", [4179.103, 3560.9189, 2.7623634]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Yarum";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,250,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_11 = _this;

	_this = createTrigger ["EmptyDetector", [3937.438, 2765.1133]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Barracks";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,175,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_13 = _this;

	_this = createTrigger ["EmptyDetector", [3512.5876, 1975.5415]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Shahbaz";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_15 = _this;

	_this = createTrigger ["EmptyDetector", [4146.8389, 4593.7168]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ZargabadN";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_17 = _this;

	_this = createTrigger ["EmptyDetector", [4888.5908, 4581.9858]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "The Villa";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,150,thisTrigger,[],3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_19 = _this;

	_this = createTrigger ["EmptyDetector", [4890.0259, 6153.4834]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Military Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,125,thisTrigger,[],3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_21 = _this;

	_this = createTrigger ["EmptyDetector", [4001.5908, 6074.7681]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Hazar Bagh";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_23 = _this;

	_this = createTrigger ["EmptyDetector", [1988.1465, 4677.229]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Azizyt";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,250,thisTrigger,[],2,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_25 = _this;

	_this = createTrigger ["EmptyDetector", [4731.5024, 3923.0283]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ZargabadE";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_27 = _this;

//end triggers
};

#include "custom_markers\cust_markers_zargabad.sqf"
#include "custom_spawns\cust_spawns_zargabad.sqf"

diag_log "Zargabad static spawn configuration loaded.";
