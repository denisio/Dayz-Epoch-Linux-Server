private ["_spawnMarker","_patrolRadius","_trigStatements","_trigger","_respawn","_weapongrade","_totalAI","_respawnTime"];
	
_spawnMarker = _this select 0;
if ((typeName _spawnMarker) != "STRING") exitWith {diag_log "DZAI Error: Marker string not given!"};
_totalAI = if ((typeName (_this select 1)) == "SCALAR") then {_this select 1} else {1};
_weapongrade = if ((typeName (_this select 2)) == "SCALAR") then {_this select 2} else {1};
_respawn = if ((count _this) > 3) then {if ((typeName (_this select 3)) == "BOOL") then {_this select 3} else {true}} else {true};
_respawnTime = if ((count _this) > 4) then {if ((typeName (_this select 4)) == "SCALAR") then {_this select 4} else {0}} else {0};

_patrolRadius = ((((getMarkerSize _spawnMarker) select 0) min ((getMarkerSize _spawnMarker) select 1)) min 300);

_trigStatements = format ["0 = [%1,0,%2,thisTrigger,%3,%4] call fnc_spawnBandits_custom;",_totalAI,_patrolRadius,_weapongrade,_spawnMarker];
_trigger = createTrigger ["EmptyDetector", getMarkerPos(_spawnMarker)];
_trigger setTriggerArea [600, 600, 0, false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerTimeout [5, 5, 5, true];
_trigger setTriggerText _spawnMarker;
_trigger setTriggerStatements ["{isPlayer _x} count thisList > 0;",_trigStatements,"0 = [thisTrigger] spawn fnc_despawnBandits;"];
_trigger setVariable ["respawn",_respawn];
_trigger setVariable ["spawnmarker",_spawnMarker];
if (_respawnTime > 0) then {_trigger setVariable ["respawnTime",_respawnTime];};
//diag_log format ["DEBUG :: %1",_trigStatements];

if ((markerAlpha _spawnMarker) > 0) then {
	_spawnMarker setMarkerAlpha 0;
};

if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Created custom spawn area %1 at %2 with %3 AI units, weapongrade %4, respawn %5, respawn time %6.",_spawnMarker,mapGridPosition _trigger,_totalAI,_weapongrade,_respawn,_respawnTime];};

_trigger
