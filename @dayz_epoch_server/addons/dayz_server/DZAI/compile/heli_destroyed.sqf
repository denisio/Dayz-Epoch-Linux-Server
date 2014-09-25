/*
		DZAI_heliDestroyed
		
		Description: Called when AI air vehicle is destroyed by collision damage.
		
		Last updated: 12:11 AM 6/17/2014
*/

private ["_helicopter","_unitGroup","_weapongrade"];
_helicopter = _this select 0;

if (_helicopter getVariable ["heli_disabled",false]) exitWith {false};
_helicopter setVariable ["heli_disabled",true];
{_helicopter removeAllEventHandlers _x} count ["HandleDamage","GetOut","Killed"];
_unitGroup = _helicopter getVariable "unitGroup";
[_unitGroup,_helicopter] call DZAI_respawnAIVehicle;

if !(surfaceIsWater (getPosASL _helicopter)) then {
	_weapongrade = _unitGroup getVariable ["weapongrade",1];
	_unitGroup setVariable ["unitType","aircrashed"];	//Recategorize group as "aircrashed" to prevent AI inventory from being cleared since death is considered suicide.
	{
		if (alive _x) then {
			_x action ["eject",_helicopter];
			_nul = [_x,_x] call DZAI_unitDeath;
			0 = [_x,_weapongrade] spawn DZAI_addLoot;
		} else {
			[_x] joinSilent grpNull;
		};
	} count (units _unitGroup);
} else {
	//_unitGroup call DZAI_deleteGroup;
};

_unitGroup setVariable ["GroupSize",-1];
if (DZAI_debugLevel > 0) then {diag_log format ["DZAI Debug: AI helicopter patrol destroyed at %1",mapGridPosition _helicopter];};

true
