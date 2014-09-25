spawn_group = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\SpawnGroup.sqf";
group_waypoints = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\patrol.sqf";
spawn_static  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\SpawnStatic.sqf";
heli_para  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\heli_para.sqf";
heli_patrol = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\heli_patrol.sqf";
vehicle_patrol = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\vehicle_patrol.sqf";

on_kill = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\ai_killed.sqf";

ai_monitor = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\AImonitor.sqf";
veh_monitor = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\vehicle_monitor.sqf";

createCenter east;
WEST setFriend [EAST,0];
EAST setFriend [WEST,0];
WAIconfigloaded = False;
WAImissionconfig = False;

ai_ground_units = 0;
ai_emplacement_units = 0;
ai_air_units = 0;
ai_vehicle_units = 0;

//Load config
[] ExecVM "\z\addons\dayz_server\WAI\AIconfig.sqf";
//Wait for config
waitUntil {WAIconfigloaded};
diag_log "WAI: AI Config File Loaded";
[] spawn ai_monitor;
//Load custom spawns
[] ExecVM "\z\addons\dayz_server\WAI\customSpawns.sqf";
if (ai_mission_sysyem) then {
	//Load AI mission system
	[] ExecVM "\z\addons\dayz_server\WAI\missions\missionIni.sqf";
};