{
	_unit = _x;
	if (alive _x) exitWith {
		{
			_skillLevel = _unit skill _x;
			_skillLevel = (_skillLevel * 1.1) min 1;
			_unit setSkill [_x,_skillLevel];
			uiSleep 0.01;
		} count ["aimingAccuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","general"];
	};
	uiSleep 0.05;
} forEach (units _this);
