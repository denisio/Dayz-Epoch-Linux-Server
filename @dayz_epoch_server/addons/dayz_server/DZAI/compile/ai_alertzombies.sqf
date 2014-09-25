
private["_unit","_distance","_i","_listTalk","_zombie","_targets","_pos"];
//Alert Zed's to noise of shot
_unit = 	_this select 0;
_distance = _this select 1;
_doRun = 	_this select 2;
_pos = 		_this select 3;
_listTalk = _pos nearEntities ["zZombie_Base",_distance];

{
	private ["_targets"];
	if (_doRun) then {
		_localtargets = _x getVariable ["localtargets",[]];
		_remotetargets = _x getVariable ["remotetargets",[]];
		_epochtargets = _x getVariable ["targets",[]];
		_targets = _localtargets + _remotetargets + _epochtargets;
		if (!(_unit in _targets)) then {
			_remotetargets set [count _remotetargets,_unit];
			_x setVariable ["remotetargets",_remotetargets,true];
			_x setVariable ["targets",_remotetargets,true];
		};
	} else {
		_x setVariable ["myDest",_pos,true];
	};

} count _listTalk;
