private["_trigger"];

_trigger = _this select 0;
_trigger setVariable ["isCleaning",false];
_trigger setVariable ["GroupArray",(_this select 1)];
if ((count _this) > 3) then {
	_trigger setVariable ["patrolDist",(_this select 2)];
	_trigger setVariable ["equipType",(_this select 3)];
	_trigger setVariable ["locationArray",(_this select 4)];
	_trigger setVariable ["maxUnits",(_this select 5)];
	if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Initialized static trigger at %1. GroupArray: %2, PatrolDist: %3. equipType: %4. %LocationArray %5 positions, MaxUnits %6.",triggerText _trigger,(_this select 1),(_this select 2),(_this select 3),count (_this select 4),(_this select 5)];};
} else {
	if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Initialized dynamic trigger at %1. GroupArray: %2.",triggerText _trigger,(_this select 1)];};
	_location = createLocation ["Strategic",(getPosASL _trigger),600,600]; //Create temporary dynamic spawn blacklist area
	_trigger setVariable ["triggerLocation",_location];
};
_trigger setVariable ["triggerStatements",+(triggerStatements _trigger)];
_trigger setVariable ["initialized",true];

true
