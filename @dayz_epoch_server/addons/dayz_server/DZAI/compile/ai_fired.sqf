private["_unit","_ammo","_audible","_distance"];

//[unit, weapon, muzzle, mode, ammo, magazine]
_unit = 		_this select 0;
_ammo = 		_this select 4;

if ((diag_tickTime - (_unit getVariable ["lastFired",0])) > 5) then {
	//Calculate audible range of fired bullet
	_audible = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFire");
	_caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
	_distance = round(_audible * 10 * _caliber);
	[_unit,_distance/2,true,(ASLtoATL getPosASL _unit)] spawn DZAI_alertZombies;
	_unit setVariable ["lastFired",diag_tickTime];
};

true
