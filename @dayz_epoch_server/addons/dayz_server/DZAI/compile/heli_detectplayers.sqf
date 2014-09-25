private ["_unitGroup","_detected","_detectBase","_detectFactor","_detectRange","_helicopter","_detectOrigin"];
_unitGroup = _this select 0;

_helicopter = vehicle (leader _unitGroup);
_detectDelay = if ((waypointType [_unitGroup,1]) == "MOVE") then {5} else {20};
_detectRange = if (_unitGroup getVariable ["DetectPlayersWide",false]) then {_unitGroup setVariable ["DetectPlayersWide",false]; 375} else {250};

uiSleep (round (random _detectDelay));

_detectOrigin = [getPosASL _helicopter,200,getDir _helicopter,1] call SHK_pos;
_detectOrigin set [2,0];
_detected = _detectOrigin nearEntities [["CAManBase","LandVehicle"],_detectRange];

if (!(_helicopter getVariable ["heli_disabled",false])) then {
	{
		if (isPlayer _x) then {
			_heliAimPos = aimPos _helicopter;
			_playerAimPos = aimPos _x;
			if (!(terrainIntersectASL [_heliAimPos,_playerAimPos]) && {!(lineIntersects [_heliAimPos,_playerAimPos,_helicopter,_x])}) then { //if no intersection of terrain and objects between helicopter and player, then reveal player
				_unitGroup reveal [_x,2.5];
			};
		};
		uiSleep 0.1;
	} forEach _detected;
};
