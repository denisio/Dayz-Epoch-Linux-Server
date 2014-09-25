if (!isServer) exitWith {};

diag_log "WAI: AI Monitor Started";
sleep 120;
while {true} do {
	if (ai_clean_dead) then {
	{
		_killedat = _x getVariable "killedat";
		if (!isNil "_killedat") then {
			if ((time - _killedat) >= cleanup_time) then {
				deleteVehicle _x;
			};
		};
	} forEach allDead;
	};
	diag_log format ["%1 Active ground units", ai_ground_units];
	diag_log format ["%1 Active emplacement units", ai_emplacement_units];
	diag_log format ["%1 Active chopper patrol units (Crew)", ai_air_units];
	diag_log format ["%1 Active vehicle patrol units (Crew)", ai_vehicle_units];

	sleep 600;
};