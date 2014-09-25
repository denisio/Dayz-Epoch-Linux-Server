if ((getMarkerColor (_this select 0)) == "") exitWith {diag_log format ["DZAI Error: Provided marker %1 is not valid.",(_this select 0)]};
if (!([(_this select 1),"vehicle"] call DZAI_checkClassname)) exitWith {diag_log format ["DZAI Error: Provided vehicle type %1 not valid.",(_this select 1)]};
if ((typeName (_this select 2)) != "ARRAY") then {_this set [3,[3,3]]};
if (!((_this select 3) in DZAI_weaponGradesAll)) then {_this set [3,1]};
DZAI_customSpawnQueue set [(count DZAI_customSpawnQueue),_this];
