/*
	
	
*/

private ["_index","_trigger","_targetPlayer","_unitGroup","_reinforcePos","_lastRedirectTime","_helicopter"];

_unitGroup = _this select 0;
_helicopter = _this select 1;

_index = floor (random (count DZAI_reinforcePlaces));
_trigger = DZAI_reinforcePlaces select _index;
if (!isNull _trigger) then {
	_targetPlayer = _trigger getVariable "targetplayer";
	if (!isNil "_targetPlayer") then {_unitGroup reveal [_targetPlayer,4]};
	_reinforcePos = (getPosASL _trigger);
	DZAI_reinforcePlaces set [_index,objNull];
	DZAI_reinforcePlaces = DZAI_reinforcePlaces - [objNull];
	[_unitGroup,0] setWPPos _reinforcePos; 
	[_unitGroup,1] setWPPos _reinforcePos;
	[_unitGroup,1] setWaypointType "SAD";
	[_unitGroup,1] setWaypointTimeout [40,50,60];
	_unitGroup setVariable ["DetectPlayersWide",true];

	_unitGroup setCurrentWaypoint [_unitGroup,0];
	if (DZAI_debugLevel > 1) then {diag_log format ["DZAI Extended Debug: Helicopter %1 (%2) redirected to dynamic spawn area at %3.",_helicopter,(typeOf _helicopter),mapGridPosition _reinforcePos]};
};
DZAI_reinforcePlaces set [_index,objNull];
DZAI_reinforcePlaces = DZAI_reinforcePlaces - [objNull];

true
