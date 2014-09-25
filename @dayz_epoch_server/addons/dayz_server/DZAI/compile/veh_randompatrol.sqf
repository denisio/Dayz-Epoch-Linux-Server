private ["_unitGroup","_tooClose","_wpSelect"];
_unitGroup = _this select 0;

_tooClose = true;
while {_tooClose} do {
	_wpSelect = (DZAI_locationsLand call BIS_fnc_selectRandom2) select 1;
	if (((waypointPosition [_unitGroup,0]) distance _wpSelect) > 300) then {
		_tooClose = false;
	};
};

_wpSelect = [_wpSelect,random(300),random(360),0,[1,300]] call SHK_pos;
[_unitGroup,0] setWPPos _wpSelect; 
[_unitGroup,0] setWaypointCompletionRadius 150;
if ((count (waypoints _unitGroup)) == 1) then {
	_unitGroup setCurrentWaypoint [_unitGroup,0];
};
