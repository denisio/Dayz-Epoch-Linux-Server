private["_unit","_hit","_damage","_source","_ammo","_unithealth","_scale","_blooddamage","_newbloodlevel","_headShots","_partdamage","_deathType","_headHit"];
/*
	Damage Handler script modified for DZAI
	Simulates DayZ's player health system for individual AI units
	
*/
_unit = 		_this select 0;				//Object the event handler is assigned to. (the unit taking damage)
_hit = 			_this select 1;				//Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections. 
_damage = 		_this select 2;				//Resulting level of damage for the selection. (Received damage)
_source = 		_this select 3;				//The source unit that caused the damage. 
_ammo = 		_this select 4;				//Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.) 

if ((group _unit) == (group _source)) then {_damage = (_damage/10)};	//Reduce friendly fire and collision damage.
//if (isNil {_unit getVariable "unithealth"}) then {_unit setVariable ["unithealth",[12000,0,false]]};	//Reset initial health stats if not found
_unithealth = _unit getVariable "unithealth"; 		// Retrieve unit's health statistics

_scale = 300;
_deathType = "bled";
_headHit = (_hit == "head_hit");
if (_damage > 0.4) then {
	//Calculate locational damage
	call {
		if (_hit == "legs") exitWith {
			_partdamage = (_unithealth select 1) + (_damage/2);
			_unithealth set [1,_partdamage];	//Record leg damage internally
			if ((_partdamage >= 1) && {!(_unithealth select 2)}) then {
				_nul = _unit spawn {_this setHit["legs",1]}; //Break legs when enough damage taken
				[nil,_unit,rSAY,["z_fracture_1",40]] call RE;
				_unithealth set [2,true];
			}; 
		};
		if (_headHit) exitWith {
			_scale = _scale + 500;
		};
	};
	
	//special death types
	call {
		if (_ammo isKindOf "GrenadeBase") exitWith {
			_scale = _scale + 200;
			if (_damage > 4) then {
				_deathType = "explosion";
				_scale = 12000;	//sufficient grenade damage causes instant death
			};
		};
		if ((_ammo isKindOf "B_127x107_Ball") or (_ammo isKindOf "B_127x99_Ball")) exitWith {
			_scale = _scale + 200;
			if (_damage > 4) then {
				_deathType = "shotheavy";
				_scale = 12000;	//sufficient high calibre damage causes instant death
			};
		};
	};
	
	//additional damage if attacker is a player
	if (isPlayer _source) then {
		_scale = _scale + 800;
		if (_headHit) then {
			_scale = _scale + 500;
			if (_damage > 1.5) then {
				_deathType = "shothead";
				_scale = 12000;	//sufficient head shot damage causes instant death
			};
		};
	};
	_blooddamage = (_damage * _scale);
	_newbloodlevel = (_unithealth select 0) - _blooddamage;
	_unithealth set [0,_newbloodlevel];
	
	//Uncomment the following line to report blood damage to rpt log
	//diag_log format ["DEBUG :: Unit %1 took %2 blood damage in part %3 by ammo %4 (Blood level: %5).",_unit,_blooddamage,_hit,_ammo,_newbloodlevel];
	
	if (_newbloodlevel < 0) then {
		_nul = [_unit,_source,_deathType] call DZAI_unitDeath;
		//diag_log format ["DEBUG :: %1 was killed by %2 from %3m. Cause: %4.",_unit,_source,(_unit distance _source),_deathType];
	} else {
		if (!(_unit getVariable ["unconscious",false]) && {((_damage > 2) || {((_damage > 0.5) && (_hit == "head_hit"))})}) then {_nul = [_unit,_hit] spawn DZAI_unconscious; _unit setVariable ["unconscious",true];};
	};
};

0
