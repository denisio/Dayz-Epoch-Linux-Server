private ["_unitGroup","_vehicle","_loadWP","_loadWPCond"];

_unitGroup = _this select 0;
_vehicle = _this select 1;

_loadWP = _unitGroup addWaypoint [(ASLtoATL getPosASL _vehicle),0];
_loadWP setWaypointType "LOAD";
_loadWPCond = "_vehicle = (group this) getVariable ['assignedVehicle',objNull]; ({_x == (vehicle _x)} count (assignedCargo _vehicle)) == 0";
_loadWP setWaypointStatements [_loadWPCond,(format ["_unitGroup = (group this); deleteWaypoint [_unitGroup,%1]; _unitGroup setVariable ['regrouped',true]; _unitGroup setCurrentWaypoint [_unitGroup,0];",(_loadWP select 1)])];
_loadWP setWaypointCompletionRadius 20;
_unitGroup setCurrentWaypoint _loadWP;

if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Regroup order issued for AI group %1 to vehicle %2. Check WP count: %3.",_unitGroup,typeOf _vehicle,(count (waypoints _unitGroup))];};

true
