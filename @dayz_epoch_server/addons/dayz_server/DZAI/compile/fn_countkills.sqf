private ["_killer","_victim","_killType","_killCount"];
_killer = _this select 0;
_victim = _this select 1;
_killType = _this select 2;

_killCount = _killer getVariable [_killType,0];
_killer setVariable [_killType,(_killCount +1),true];

if (DZAI_humanityGain != 0) then {
	_humanity = _killer getVariable["humanity",0];
	_humanity = _humanity + DZAI_humanityGain;
	_killer setVariable["humanity",_humanity,true];
};
