/*
	//DayZ Unleashed-specific spawns
	
	
*/


_this = createTrigger ["EmptyDetector", [16404.818, 18407.805]];
_this setTriggerArea [900, 900, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "suhrenfeld_internal";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,8,850,thisTrigger,[],3,2] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_6 = _this;

_this = createTrigger ["EmptyDetector", [18338.666, 17120.857]];
_this setTriggerArea [400, 400, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "pfeffikon";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [3,5,350,thisTrigger,[],3,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_9 = _this;

_this = createTrigger ["EmptyDetector", [14408.414, 16992.586]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_north1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_12 = _this;

_this = createTrigger ["EmptyDetector", [14647.103, 16670.883]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_north2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_14 = _this;

_this = createTrigger ["EmptyDetector", [14874.174, 16418.256]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_north3";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_16 = _this;

_this = createTrigger ["EmptyDetector", [15154.952, 16126.912]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_north4";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_18 = _this;

_this = createTrigger ["EmptyDetector", [18163.58, 2037.2637, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_southeast1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_21 = _this;

_this = createTrigger ["EmptyDetector", [18464.359, 2430.2002, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_southeast";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_23 = _this;

_this = createTrigger ["EmptyDetector", [4130.9883, 4493.3403]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_southwest1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_25 = _this;

_this = createTrigger ["EmptyDetector", [4690.6611, 4678.5127]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_southwest2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_27 = _this;

_this = createTrigger ["EmptyDetector", [5183.7568, 4688.9141]];
_this setTriggerArea [400, 400, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "airport_southwest3";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,350,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_29 = _this;

_this = createTrigger ["EmptyDetector", [2533.6628, 11372.42]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "hindelbank2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_31 = _this;

_this = createTrigger ["EmptyDetector", [2326.0884, 11103.879, 8.392334e-005]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "hindelbank1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_33 = _this;

_this = createTrigger ["EmptyDetector", [1969.004, 10009.399]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "ittingen1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_36 = _this;

_this = createTrigger ["EmptyDetector", [1990.7776, 9816.3418, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "ittingen2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_38 = _this;

_this = createTrigger ["EmptyDetector", [2159.1592, 9589.8965]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "ittingen3";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_40 = _this;

_this = createTrigger ["EmptyDetector", [3252.1887, 9148.6221, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "hasle_southeast";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_42 = _this;

_this = createTrigger ["EmptyDetector", [3491.6978, 9655.2197, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "hasle2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_44 = _this;

_this = createTrigger ["EmptyDetector", [3676.0464, 9926.6621, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "hasle1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_46 = _this;

_this = createTrigger ["EmptyDetector", [2363.8328, 8425.7461, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb9";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_48 = _this;

_this = createTrigger ["EmptyDetector", [2212.8699, 8202.2051, 4.7683716e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb8";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_50 = _this;

_this = createTrigger ["EmptyDetector", [2098.1963, 7938.02, -4.7683716e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb6";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_52 = _this;

_this = createTrigger ["EmptyDetector", [2214.3215, 7549, 9.5367432e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb3";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_54 = _this;

_this = createTrigger ["EmptyDetector", [2655.5977, 7479.3237, -1.9073486e-006]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_56 = _this;

_this = createTrigger ["EmptyDetector", [2424.7983, 7820.4419, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb5";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_58 = _this;

_this = createTrigger ["EmptyDetector", [2604.7927, 8231.2354, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb7";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_60 = _this;

_this = createTrigger ["EmptyDetector", [3130.2598, 7447.3887, -9.5367432e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb4";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_62 = _this;

_this = createTrigger ["EmptyDetector", [2777.5298, 7936.5684, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "worb1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_64 = _this;

_this = createTrigger ["EmptyDetector", [3514.9255, 8202.2012, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "munsingen1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_66 = _this;

_this = createTrigger ["EmptyDetector", [3667.3401, 7962.6929, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "munsingen2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_68 = _this;

_this = createTrigger ["EmptyDetector", [2885.3394, 6229.498, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "homburg";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_70 = _this;

_this = createTrigger ["EmptyDetector", [5353.5059, 5675.8838]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,450,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_72 = _this;

_this = createTrigger ["EmptyDetector", [6117.0796, 5107.5576, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "buckten_southeast";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_76 = _this;

_this = createTrigger ["EmptyDetector", [8942.9766, 5357.8394]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "schangen1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_78 = _this;

_this = createTrigger ["EmptyDetector", [9199.4727, 5520.2275, 0.77199554]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "schangen2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_80 = _this;

_this = createTrigger ["EmptyDetector", [7308.8135, 6713.7588, -5.3405762e-005]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "eggwil";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,450,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_82 = _this;

_this = createTrigger ["EmptyDetector", [5982.0449, 8952.29, 4.3856812]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "signau";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_84 = _this;

_this = createTrigger ["EmptyDetector", [6294.2505, 9481.6221, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "muenchenstein2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_86 = _this;

_this = createTrigger ["EmptyDetector", [6383.7153, 9737.5332, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "muenchenstein1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_88 = _this;

_this = createTrigger ["EmptyDetector", [6650.0273, 9581.4902, 9.5367432e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "muenchenstein3";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_90 = _this;

_this = createTrigger ["EmptyDetector", [7786.0205, 9306.8555, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "chatzbach";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_92 = _this;

_this = createTrigger ["EmptyDetector", [10015.75, 7582.4756, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "milan";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_94 = _this;

_this = createTrigger ["EmptyDetector", [11084.175, 8673.1826]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "sissach2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_96 = _this;

_this = createTrigger ["EmptyDetector", [11281.655, 8785.5947]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "sissach1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_98 = _this;

_this = createTrigger ["EmptyDetector", [10590.528, 4926.6992, 11.500801]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "schrattendamm";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_100 = _this;

_this = createTrigger ["EmptyDetector", [13537.42, 5317.3462, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "sorenberg";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_102 = _this;

_this = createTrigger ["EmptyDetector", [16839.898, 5182.0947, 8.1885509]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "giswil";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_104 = _this;

_this = createTrigger ["EmptyDetector", [17217.1, 3523.4072, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "froburg";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_106 = _this;

_this = createTrigger ["EmptyDetector", [13085.807, 6985.7456]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "farnen";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_108 = _this;

_this = createTrigger ["EmptyDetector", [12407.355, 9419.6377]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "liestal1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_110 = _this;

_this = createTrigger ["EmptyDetector", [12700.942, 9575.6875]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "liestal2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_112 = _this;

_this = createTrigger ["EmptyDetector", [12923.115, 9795.2168]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "liestal3";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_114 = _this;

_this = createTrigger ["EmptyDetector", [9833.3955, 9936.5967, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "bruderholz";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_116 = _this;

_this = createTrigger ["EmptyDetector", [8862.5166, 11018.768, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "ag";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
agerifeld = _this;
_trigger_118 = _this;

_this = createTrigger ["EmptyDetector", [11075.406, 11822.705, 4.3609467]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "napf";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_120 = _this;

_this = createTrigger ["EmptyDetector", [12944.842, 11750.984, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "romoos";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_122 = _this;

_this = createTrigger ["EmptyDetector", [14896.84, 11082.713, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "sachseln1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_124 = _this;

_this = createTrigger ["EmptyDetector", [14895.552, 10847.114, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "sachseln2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_126 = _this;

_this = createTrigger ["EmptyDetector", [18664.523, 9478.3291, -4.7683716e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "alpnach";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_128 = _this;

_this = createTrigger ["EmptyDetector", [19003.676, 6876.001, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "island_east";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_130 = _this;

_this = createTrigger ["EmptyDetector", [14338.446, 12520.148, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "wolhusen2";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_132 = _this;

_this = createTrigger ["EmptyDetector", [14183.622, 12754.734, 6.3866339]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "wolhusen1";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_134 = _this;

_this = createTrigger ["EmptyDetector", [10487.617, 14090.64, 0]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "hirsegg";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,450,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_136 = _this;

_this = createTrigger ["EmptyDetector", [8653.4922, 14330.331, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "truebsaal";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_138 = _this;

_this = createTrigger ["EmptyDetector", [7533.418, 14246.273, -1.1444092e-005]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "trueb";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,450,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_142 = _this;

_this = createTrigger ["EmptyDetector", [7396.2163, 14776.627]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "trueb_north";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,450,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_144 = _this;

_this = createTrigger ["EmptyDetector", [5924.395, 13703.486, 0]];
_this setTriggerArea [500, 500, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "neue_welt";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,450,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_146 = _this;

_this = createTrigger ["EmptyDetector", [9752.668, 15666.391, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "lenzburg_south";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_148 = _this;

_this = createTrigger ["EmptyDetector", [11305.615, 18476.525, 1.9073486e-006]];
_this setTriggerArea [200, 200, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "hasenmatt";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,150,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_150 = _this;

_this = createTrigger ["EmptyDetector", [8419.9619, 945.08301, 9.5367432e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "waldegg";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_152 = _this;

_this = createTrigger ["EmptyDetector", [759.22412, 6988.7656, 3.8146973e-006]];
_this setTriggerArea [600, 600, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "feldmoos";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,550,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_154 = _this;

_this = createTrigger ["EmptyDetector", [9101.6924, 17625.164]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "harbour";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_156 = _this;

_this = createTrigger ["EmptyDetector", [8406.0137, 17206.279, 0]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "freidorf";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_158 = _this;

_this = createTrigger ["EmptyDetector", [6532.5107, 16838.295, 9.5367432e-007]];
_this setTriggerArea [300, 300, 0, false];
_this setTriggerActivation ["ANY", "PRESENT", false];
_this setTriggerTimeout [20, 25, 30, false];
_this setTriggerText "seewen";
_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "nul = [0,2,250,thisTrigger,[],1,1] call DZAI_spawnBandits_init;", "nul = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger_160 = _this;
