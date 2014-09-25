/*
	Namalsk static spawn configuration 
	
	Last updated: 11:11 PM 7/5/2013
	
*/

#include "spawn_markers\markers_namalsk.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [5880.1313, 8889.1045];
	"DZAI_centerMarker" setMarkerSize [3000, 3000];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {
	_this = createTrigger ["EmptyDetector", [4157.5698, 6636.252]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Seraja Army Base (Markers)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,100,thisTrigger,['Seraja1','Seraja2','Seraja3','Seraja4','Seraja5'],3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_0 = _this;

	_this = createTrigger ["EmptyDetector", [3558.3298, 6664.4048]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Southern Army Base (Markers)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,0,125,thisTrigger,['SebMine1','SebMine2','SebMine3'],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_2 = _this;

	_this = createTrigger ["EmptyDetector", [3940.0078, 7536.5967]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Norinsk";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_4 = _this;

	_this = createTrigger ["EmptyDetector", [4976.6655, 6619.644, 42.068932]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Object A2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,150,thisTrigger,['ObjectA2_1','ObjectA2_2','ObjectA2_3','ObjectA2_4','ObjectA2_5'],2,3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_6 = _this;

	_this = createTrigger ["EmptyDetector", [4845.8853, 6201.1484, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Brensk Railway Station";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_8 = _this;

	_this = createTrigger ["EmptyDetector", [4081.9597, 9224.0859, 2.600769]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Western Army Checkpoint";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_10 = _this;

	_this = createTrigger ["EmptyDetector", [4690.1934, 8916.7041, 5.2387733]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sebjan Warehouse";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_12 = _this;

	_this = createTrigger ["EmptyDetector", [5781.0708, 9809.7734, -7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sebjan dam";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_14 = _this;

	_this = createTrigger ["EmptyDetector", [6308.022, 9307.7139]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sebjan Chemical Factory (Markers)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,150,thisTrigger,['SebChem1','SebChem2','SebChem3','SebChem4'],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_16 = _this;

	_this = createTrigger ["EmptyDetector", [5807.0181, 8676.9521, 12.870121]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sebjan (Markers)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,150,thisTrigger,['Seb1','Seb2','Seb3','Seb4','Seb5']] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_18 = _this;

	_this = createTrigger ["EmptyDetector", [7293.3511, 7967.5581, 3.7465744]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Old Hospital";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,150,thisTrigger,[]] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_20 = _this;

	_this = createTrigger ["EmptyDetector", [7694.8877, 7602.1001, 1.2397766e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Tara harbor (Markers)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,200,thisTrigger,['Harb1','Harb2','Harb3','Harb4','Harb5'],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_22 = _this;

	_this = createTrigger ["EmptyDetector", [7046.0806, 5808.7622]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Old Sawmill";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_26 = _this;

	_this = createTrigger ["EmptyDetector", [5986.1616, 6641.3848, -1.1444092e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nitija Army Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,100,thisTrigger,[],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_28 = _this;

	_this = createTrigger ["EmptyDetector", [4947.3247, 8158.6709, -3.8146973e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sebjan Mine (Markers)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,200,thisTrigger,['SebMine1','SebMine2','SebMine3','SebMine4','SebMine5'],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_30 = _this;

	_this = createTrigger ["EmptyDetector", [8199.6846, 10729.502]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Jalovisko";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],0,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_32 = _this;

	_this = createTrigger ["EmptyDetector", [4829.1992, 10839.983, 2.8610229e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Northern Army Base";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,150,thisTrigger,[],3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_38 = _this;

	_this = createTrigger ["EmptyDetector", [4498.3965, 11127.151, -1.2159348e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Lubjansk (Markers)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,150,thisTrigger,['Lub1','Lub2','Lub3','Lub4','Lub5'],3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_40 = _this;

	_this = createTrigger ["EmptyDetector", [4407.7451, 10748.695]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Lubjansk South";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_42 = _this;

	_this = createTrigger ["EmptyDetector", [6784.3296, 11291.731, 5.5010681]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vorkuta Central";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,0,175,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_44 = _this;

	_this = createTrigger ["EmptyDetector", [7668.0474, 8760.8672, 12.067543]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nemsk Factory";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,150,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_46 = _this;

	_this = createTrigger ["EmptyDetector", [3173.5461, 7504.5532]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "CrashedC130";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,0,150,thisTrigger,['CrashedC1301','CrashedC1302','CrashedC1303'],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_73 = _this;

	_this = createTrigger ["EmptyDetector", [6943.7725, 11424.083]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vorkuta North";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,0,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_75 = _this;

	_this = createTrigger ["EmptyDetector", [5777.3901, 10784.223, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Alakit";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,150,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_77 = _this;

	_this = createTrigger ["EmptyDetector", [6719.9434, 11113.122, 20.099487]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vorkuta South";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_80 = _this;
	//End Triggers
};

#include "custom_markers\cust_markers_namalsk.sqf"
#include "custom_spawns\cust_spawns_namalsk.sqf"

//AI hostility to Bloodsuckers by decreasing their leader's rating (untested). Required because Bloodsuckers will aggro on AI.
_nul = [] spawn {
	sleep 120;
	_bsLeader = [78.115158,112.9837,1.8671114] nearEntities ["TK_INS_Soldier_EP1",50];
	{
		_x addRating -30000;
		diag_log "DZAI: Marked bloodsucker leader unit as hostile!";
	} forEach _bsLeader;
};

diag_log "Namalsk static spawn configuration loaded.";
