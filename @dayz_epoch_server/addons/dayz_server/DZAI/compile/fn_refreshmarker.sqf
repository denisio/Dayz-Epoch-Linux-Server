private ["_trigger","_marker"];
_trigger = _this select 0;

_marker = str (_trigger);
if ((getMarkerColor _marker) == "") then {
	_marker = createMarker [_marker, (getPosASL _trigger)];
	_marker setMarkerType "Defend";
	_marker setMarkerBrush "Solid";
};

_marker setMarkerText "STATIC TRIGGER (ACTIVE)";
_marker setMarkerColor "ColorRed";
	
while {!((getMarkerColor _marker) in ["ColorGreen",""])} do {
	_marker setMarkerPos (getMarkerPos _marker);
	uiSleep 30;
};
