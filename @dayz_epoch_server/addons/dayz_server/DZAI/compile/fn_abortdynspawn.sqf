private["_trigger"];
_trigger = _this;

DZAI_dynTriggerArray = DZAI_dynTriggerArray - [_trigger];
if ((!isNil "DZAI_debugMarkersEnabled") && {DZAI_debugMarkersEnabled}) then {deleteMarker format["trigger_%1",_trigger]};

deleteVehicle _trigger;

false
