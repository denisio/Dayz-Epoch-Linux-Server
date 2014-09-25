if (!isServer) exitWith {};

private ["_helicopter","_unitGroup"];

_helicopter = _this select 0;
_unitGroup = _this select 1;

uiSleep 60;
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: Starting helicopter awareness script for AI vehicle %1 (Group: %2).",typeOf _helicopter,_unitGroup];};

while {!(_helicopter getVariable ["heli_disabled",false]) && {alive _helicopter}} do {
	_detectOrigin = [getPosASL _helicopter,200,getDir _helicopter,1] call SHK_pos;
	_detectOrigin set [2,0];
	_detected = _detectOrigin nearEntities [["CAManBase","LandVehicle"],225];
	{
		if ((isPlayer _x) && {(_unitGroup knowsAbout _x) < 1.5}) then {
			_heliAimPos = aimPos _helicopter;
			_playerAimPos = aimPos _x;
			if (!(terrainIntersectASL [_heliAimPos,_playerAimPos]) && {!(lineIntersects [_heliAimPos,_playerAimPos,_helicopter,_x])}) then { //if no intersection of terrain and objects between helicopter and player, then reveal player
				_unitGroup reveal [_x,2.5];
			};
		};
		uiSleep 0.1;
	} forEach _detected;
	uiSleep 20;
};
