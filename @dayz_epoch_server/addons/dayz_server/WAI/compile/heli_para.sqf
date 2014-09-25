if (!isServer)exitWith{};
private ["_cleanheli","_drop","_helipos","_gunner2","_gunner","_playerPresent","_skillarray","_aicskill","_aiskin","_aigear","_helipatrol","_gear","_skin","_backpack","_mags","_gun","_triggerdis","_startingpos","_aiweapon","_mission","_heli_class","_startPos","_helicopter","_unitGroup","_pilot","_skill","_paranumber","_position","_wp1"];
_position = _this select 0;
_startingpos = _this select 1;
_triggerdis = _this select 2;
_heli_class = _this select 3;
_paranumber = _this select 4;
_skill = _this select 5;
_gun = _this select 6;
_mags = _this select 7;
_backpack = _this select 8;
_skin = _this select 9;
_gear = _this select 10;
_helipatrol = _this select 11;
if (count _this > 12) then {
	_mission = _this select 12;
} else {
	_mission = False;
};
//_delay = _this select 12;
_aiweapon = [];
_aigear = [];
_aiskin = "";
_aicskill = [];
_skillarray = ["aimingAccuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];

// wait for player to come into area.
diag_log "WAI: Paradrop Waiting for player";
waitUntil
{
	sleep 10;
	_playerPresent = false;
	{if((isPlayer _x) AND (_x distance [(_position select 0),(_position select 1),0] <= _triggerdis)) then {_playerPresent = true};}forEach playableUnits;
	(_playerPresent)
};
//Delay before chopper spawns in.
//sleep _delay;
//Spawing in Chopper and crew
diag_log format ["WAI: Spawning a %1 with %2 units to be paradropped at %3",_heli_class,_paranumber,_position];
_unitGroup = createGroup east;
_pilot = _unitGroup createUnit ["Bandit1_DZ", [0,0,0], [], 1, "NONE"];
[_pilot] joinSilent _unitGroup;
ai_air_units = (ai_air_units +1);

_helicopter = createVehicle [_heli_class, [(_startingpos select 0),(_startingpos select 1), 100], [], 0, "FLY"];
_helicopter setFuel 1;
_helicopter engineOn true;
_helicopter setVehicleAmmo 1;
_helicopter flyInHeight 150;
_helicopter addEventHandler ["GetOut",{(_this select 0) setFuel 0;(_this select 0) setDamage 1;}];

_pilot assignAsDriver _helicopter;
_pilot moveInDriver _helicopter;

_gunner = _unitGroup createUnit ["Bandit1_DZ", [0,0,0], [], 1, "NONE"];
_gunner assignAsGunner _helicopter;
_gunner moveInTurret [_helicopter,[0]];
[_gunner] joinSilent _unitGroup;
ai_air_units = (ai_air_units +1);

_gunner2 = _unitGroup createUnit ["Bandit1_DZ", [0,0,0], [], 1, "NONE"];
_gunner2 assignAsGunner _helicopter;
_gunner2 moveInTurret [_helicopter,[1]];
[_gunner2] joinSilent _unitGroup;
ai_air_units = (ai_air_units +1);

{_pilot setSkill [_x,1]} forEach _skillarray;
{_gunner setSkill [_x,0.7]} forEach _skillarray;
{_gunner2 setSkill [_x,0.7]} forEach _skillarray;
{_x addweapon "Makarov";_x addmagazine "8Rnd_9x18_Makarov";_x addmagazine "8Rnd_9x18_Makarov";} forEach (units _unitgroup);
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_helicopter];
[_helicopter] spawn veh_monitor;

_unitGroup allowFleeing 0;
_unitGroup setBehaviour "CARELESS";
_unitGroup setSpeedMode "FULL";
_unitGroup setCombatMode "RED";

// Add waypoints to the chopper group.
_wp = _unitGroup addWaypoint [[(_position select 0), (_position select 1)], 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 100;

_drop = True;
_helipos = getpos _helicopter;
while {(alive _helicopter) AND (_drop)} do {
	private ["_magazine","_weapon","_weaponandmag","_chute","_para","_pgroup"];
	sleep 1;
	_helipos = getpos _helicopter;
	if (_helipos distance [(_position select 0),(_position select 1),100] <= 200) then {
		_pgroup = createGroup east;
		for "_x" from 1 to _paranumber do {
			_helipos = getpos _helicopter;
			switch (_gun) do {
				case 0 : {_aiweapon = ai_wep0;};
				case 1 : {_aiweapon = ai_wep1;};
				case 2 : {_aiweapon = ai_wep2;};
				case 3 : {_aiweapon = ai_wep3;};
				case 4 : {_aiweapon = ai_wep4;};
				case "Random" : {_aiweapon = ai_wep_random call BIS_fnc_selectRandom;};
			};
			_weaponandmag = _aiweapon call BIS_fnc_selectRandom;
			_weapon = _weaponandmag select 0;
			_magazine = _weaponandmag select 1;
				switch (_gear) do {
				case 0 : {_aigear = ai_gear0;};
				case 1 : {_aigear = ai_gear1;};
				case 2 : {_aigear = ai_gear2;};
				case 3 : {_aigear = ai_gear3;};
				case 4 : {_aigear = ai_gear4;};
				case "Random" : {_aigear = ai_gear_random call BIS_fnc_selectRandom;};
			};
			_gearmagazines = _aigear select 0;
			_geartools = _aigear select 1;
			if (_skin == "") then {
				_aiskin = ai_skin call BIS_fnc_selectRandom;
			} else {
				_aiskin = _skin
			};
			_para = _pgroup createUnit [_aiskin, [0,0,0], [], 1, "PRIVATE"];
			if (_backpack == "") then {
				_aipack = ai_packs call BIS_fnc_selectRandom;
			} else {
				_aipack = _backpack
			};
			_para enableAI "TARGET";
			_para enableAI "AUTOTARGET";
			_para enableAI "MOVE";
			_para enableAI "ANIM";
			_para enableAI "FSM";
			_para setCombatMode ai_combatmode;
			_para setBehaviour ai_behaviour;
			removeAllWeapons _para;
			removeAllItems _para;
			_para addweapon _weapon;
			for "_i" from 1 to _mags do {_para addMagazine _magazine;};
			_para addBackpack _aipack;
			{_para addMagazine _x} forEach _gearmagazines;
			{_para addweapon _x} forEach _geartools;
			if (ai_custom_skills) then {
				switch (_skill) do {
				case 0 : {_aicskill = ai_custom_array1;};
				case 1 : {_aicskill = ai_custom_array2;};
				case 2 : {_aicskill= ai_custom_array3;};
				case "Random" : {_aicskill = ai_skill_random call BIS_fnc_selectRandom;};
			};
				{_para setSkill [(_x select 0),(_x select 1)]} forEach _aicskill;
			} else {
				{_para setSkill [_x,_skill]} forEach _skillarray;
			};
			ai_ground_units = (ai_ground_units + 1);
			_para addEventHandler ["Killed",{[_this select 0, _this select 1, "ground"] call on_kill;}];
			_chute = createVehicle ["ParachuteEast", [(_helipos select 0), (_helipos select 1), (_helipos select 2)], [], 0, "NONE"];
			_para moveInDriver _chute;
			[_para] joinSilent _pgroup;
			sleep 1.5;
		};
		_drop = false;
		_pgroup selectLeader ((units _pgroup) select 0);
		diag_log format ["WAI: Spawned in %1 ai units for paradrop",_paranumber];
		[_pgroup, _position,_mission] call group_waypoints;
	};
};
if (_helipatrol) then { 
	_wp1 = _unitGroup addWaypoint [[(_position select 0),(_position select 1)], 100];
	_wp1 setWaypointType "SAD";
	_wp1 setWaypointCompletionRadius 150;
	_unitGroup setBehaviour "AWARE";
	_unitGroup setSpeedMode "FULL";
	_unitGroup setCombatMode "RED";
	{_x addEventHandler ["Killed",{[_this select 0, _this select 1, "air"] call on_kill;}];} forEach (units _unitgroup);
} else {
	{_x doMove [(_startingpos select 0), (_startingpos select 1), 100]} forEach (units _unitGroup);
	_unitGroup setBehaviour "CARELESS";
	_unitGroup setSpeedMode "FULL";
	_unitGroup setCombatMode "RED";
	_cleanheli = True;
	while {_cleanheli} do {
		sleep 20;
		_helipos1 = getpos _helicopter;
		if ((_helipos1 distance [(_startingpos select 0),(_startingpos select 1),100] <= 200) OR (!alive _helicopter)) then {
			deleteVehicle _helicopter;
			{deleteVehicle _x} forEach (units _unitgroup);
			sleep 10;
			deleteGroup _unitGroup;
			ai_air_units = (ai_air_units -3);
			diag_log "WAI: Paradrop cleaned up";
			_cleanheli = False;
		};
	};
};


	
	
