private["_unit","_hit","_damage","_source","_ammo","_partdamage","_durability"];
_unit = 		_this select 0;				//Object the event handler is assigned to. (the unit taking damage)
_hit = 			_this select 1;				//Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections. 
_damage = 		_this select 2;				//Resulting level of damage for the selection. (Received damage)
_source = 		_this select 3;				//The source unit that caused the damage. 
_ammo = 		_this select 4;				//Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.) 

_durability = _unit getVariable "durability";

if ((_ammo != "")&&{!isNil "_durability"}) then {
	call {
		if (_hit == "") exitWith {
			//Structural damage
			_partdamage = (_durability select 0) + _damage;
			_durability set [0,_partdamage];
			if (((_partdamage >= 0.9) or {((_durability select 1) >= 0.9)}) && {(alive _unit)}) then {
				0 = [_unit] call DZAI_parachuteOut; 
				_nul = _unit spawn {
					uiSleep 3;
					_this setVehicleAmmo 0;
					_this setFuel 0;
					_this setDamage 1;
				};
				{_unit removeAllEventHandlers _x} forEach ["HandleDamage","GetOut","Killed"];
			};
		};
		if (_hit == "motor") exitWith {
			_partdamage = (_durability select 1) + _damage;
			_durability set [1,_partdamage];
			if ((_partdamage > 0.88) && {alive _unit}) then {
				_damage = 0.88;	//Intercept fatal damage to helicopter engine - next hit will destroy the helicopter.
			};
		};
		if (_hit == "mala vrtule") exitWith {
			_partdamage = (_durability select 2) + _damage;
			_durability set [2,_partdamage];
			if ((_partdamage >= 0.9) && {_unit getVariable ["tailRotorFunctional",true]}) then {
				_unit setHit ["mala vrtule",1];	//Knock out helicopter tail rotor when sufficiently damaged
				_unit setVariable ["tailRotorFunctional",false];
			};
		};
	};
};

_damage
