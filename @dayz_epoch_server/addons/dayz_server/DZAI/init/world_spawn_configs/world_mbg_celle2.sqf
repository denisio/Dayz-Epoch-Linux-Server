/*
	Celle static spawn configuration 
	
	Last updated: 11:57 PM 6/6/2013
	
*/

#include "spawn_markers\markers_mbg_celle2.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then {
	"DZAI_centerMarker" setMarkerPos [6163.52, 6220.3984];
	"DZAI_centerMarker" setMarkerSize [6000, 6000];
};

waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays or finish building classname arrays if verification is disabled.

if (DZAI_staticAI) then {

	//begin triggers
	_this = createTrigger ["EmptyDetector", [2356.353, 1182.4937, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Mellendorf";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,175,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_5 = _this;

	_this = createTrigger ["EmptyDetector", [1703.3657, 2045.8821]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Lindwedel";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_7 = _this;

	_this = createTrigger ["EmptyDetector", [334.01779, 3851.7898]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Schwarmstedt";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,175,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_9 = _this;

	_this = createTrigger ["EmptyDetector", [563.29688, 5061.6577, 9.5367432e-007]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "DZAI Trigger";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_13 = _this;

	_this = createTrigger ["EmptyDetector", [610.13916, 8719.7695, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dushorn";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_15 = _this;

	_this = createTrigger ["EmptyDetector", [1651.0822, 9451.3926, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Fallingbostel";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_17 = _this;

	_this = createTrigger ["EmptyDetector", [2968.6587, 10919.845]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dorfmark";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,150,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_19 = _this;

	_this = createTrigger ["EmptyDetector", [753.26855, 11076.064, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Benefeld";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,100,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_23 = _this;

	_this = createTrigger ["EmptyDetector", [6723.4248, 7989.394]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bergen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],2,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_25 = _this;

	_this = createTrigger ["EmptyDetector", [8517.1914, 8122.8779, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Beckedorf";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_27 = _this;

	_this = createTrigger ["EmptyDetector", [9078.0566, 8908.0117]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Hermannsburg";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,150,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_29 = _this;

	_this = createTrigger ["EmptyDetector", [8311.7725, 9614.6348, 7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bonstorf";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,0,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_31 = _this;

	_this = createTrigger ["EmptyDetector", [9576.0068, 10109.783, 3.9004173]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Muden";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_33 = _this;

	_this = createTrigger ["EmptyDetector", [10467.522, 10704.588]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Fassberg";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,125,thisTrigger,[],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_35 = _this;

	_this = createTrigger ["EmptyDetector", [10886.337, 10966.786]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ETHS";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,150,thisTrigger,[],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_37 = _this;

	_this = createTrigger ["EmptyDetector", [10437.518, 11522.051, 9.5367432e-007]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Fassberg Barracks";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,125,thisTrigger,[],3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_41 = _this;

	_this = createTrigger ["EmptyDetector", [7095.8955, 11341.207, 9.5367432e-007]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Wietzendorf";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,175,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_43 = _this;

	_this = createTrigger ["EmptyDetector", [8375.2324, 6201.9375]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Eversen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_49 = _this;

	_this = createTrigger ["EmptyDetector", [6972.5615, 6634.1411, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Offen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_51 = _this;

	_this = createTrigger ["EmptyDetector", [6048.7246, 5733.2813, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Walle";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_53 = _this;

	_this = createTrigger ["EmptyDetector", [7049.1787, 4662.458, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Wolthausen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_55 = _this;

	_this = createTrigger ["EmptyDetector", [8176.6689, 4471.7256, 3.4234772]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "157_677";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_57 = _this;

	_this = createTrigger ["EmptyDetector", [9032.9219, 3941.7026, 0.16929245]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Scheuen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,200,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_61 = _this;

	_this = createTrigger ["EmptyDetector", [8490.8213, 3295.0876]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gross Hehlen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_63 = _this;

	_this = createTrigger ["EmptyDetector", [9365.8906, 3105.7207, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vorwerk";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,200,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_65 = _this;

	_this = createTrigger ["EmptyDetector", [8974.5664, 2647.6582, 7.9469242]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Hehlentor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,150,thisTrigger,[],1,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_69 = _this;

	_this = createTrigger ["EmptyDetector", [8360.9912, 2662.6626]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Klein Hehlen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_71 = _this;

	_this = createTrigger ["EmptyDetector", [8947.2207, 2085.5581]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Celle";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,150,thisTrigger,[],1,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_73 = _this;

	_this = createTrigger ["EmptyDetector", [7629.2075, 1394.094, 7.0633612]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ETHC";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_81 = _this;

	_this = createTrigger ["EmptyDetector", [7087.311, 2571.6694]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "DZAI Trigger";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_83 = _this;

	_this = createTrigger ["EmptyDetector", [6155.9063, 2613.449, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Ovelgonne";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,150,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_85 = _this;

	_this = createTrigger ["EmptyDetector", [5631.1216, 3690.1201]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sudwinsen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_87 = _this;

	_this = createTrigger ["EmptyDetector", [5748.4819, 4174.6763]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Winsen(Aller)";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,180,thisTrigger,[],1,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_89 = _this;

	_this = createTrigger ["EmptyDetector", [4645.0244, 3038.4998, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Wietze";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,0,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_95 = _this;

	_this = createTrigger ["EmptyDetector", [4563.7964, 5537.4448, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Meissendorf";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_97 = _this;

	_this = createTrigger ["EmptyDetector", [4663.7559, 484.27148, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Fuhrberg";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_99 = _this;

	_this = createTrigger ["EmptyDetector", [6024.9541, 1322.4375]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "GasStation";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_101 = _this;

	_this = createTrigger ["EmptyDetector", [10888.66, 853.16016]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Wienhausen";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,2,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_103 = _this;

	_this = createTrigger ["EmptyDetector", [11969.814, 2345.9883, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Lachendorf";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_105 = _this;

	_this = createTrigger ["EmptyDetector", [11822.666, 5783.8203, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Eschede";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_107 = _this;

	_this = createTrigger ["EmptyDetector", [2694.0867, 4061.2859, 3.232378]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Thoren";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [1,1,125,thisTrigger,[],0] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_109 = _this;

	_this = createTrigger ["EmptyDetector", [5822.7529, 9192.2129, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "SmallFarm";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,1,125,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_111 = _this;

	_this = createTrigger ["EmptyDetector", [8622.5078, 2102.4631]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Celle West";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,1,200,thisTrigger,[],1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_113 = _this;

	_this = createTrigger ["EmptyDetector", [11154.374, 11190.324]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "ETHS East";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [2,2,150,thisTrigger,[],2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_115 = _this;

	_this = createTrigger ["EmptyDetector", [10489.306, 11469.34]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Fassberg Barracks";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,2,300,thisTrigger,['ETHS1','ETHS2','ETHS3','ETHS4'],3] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_118 = _this;
	//end triggers
};

#include "custom_markers\cust_markers_mbg_celle2.sqf"
#include "custom_spawns\cust_spawns_mbg_celle2.sqf"

diag_log "Celle static spawn configuration loaded.";
