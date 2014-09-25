
_index = 0;
while {(getMarkerColor ("spawn" + (str _index))) != ""} do {
	_markerPos = getMarkerPos ("spawn" + (str _index));
	_blacklist = createLocation ["Strategic",_markerPos,600,600];
	_index = _index + 1;
	uiSleep 0.5;
};
if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Created %1 dynamic spawn blacklist areas for new player spawn areas.",_index]};
