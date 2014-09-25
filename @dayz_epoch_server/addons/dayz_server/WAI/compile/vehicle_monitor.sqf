if (!isServer) exitWith {};
private ["_mission","_veh"];
_veh = _this select 0;
if (count _this == 2) then {
	_mission = _this select 1;
} else {
	_mission = false;
};
waitUntil { count crew _veh > 0};
while {(alive _veh) and ({alive _x} count crew _veh > 0)} do {
	_veh setVehicleAmmo 1;
	_veh setFuel 1;
	if ({alive _x} count crew _veh == 0) then {
		_veh setDamage 1;
		_veh setVariable ["killedat", time];
	};
	if ((_mission) AND (clean_running_mission)) then {
		_veh setDamage 1;
		_veh setVariable ["killedat", time];
	};
	sleep 30;
};
_veh setDamage 1;
_veh setVariable ["killedat", time];