custom_publish  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\custom_publishVehicle.sqf";
spawn_ammo_box  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\ammobox.sqf";

//Custom Boxes
Construction_Supply_Box  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\ConstructionSupplyBox.sqf";
Medical_Supply_Box  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\MedicalSupplyBox.sqf";
Sniper_Gun_Box  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\SniperGunBox.sqf";
Chain_Bullet_Box  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\ChainBulletBox.sqf";

Extra_Large_Gun_Box  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\ExtraLargeGunBox.sqf";
Large_Gun_Box = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\LargeGunBox.sqf";
Medium_Gun_Box = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\MediumGunBox.sqf";
Small_Gun_Box = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\SmallGunBox.sqf";

clean_running_mission = False;

//load mission config
[] ExecVM "\z\addons\dayz_server\WAI\missions\missionCfg.sqf";
waitUntil {WAImissionconfig};
diag_log "WAI: Mission Config File Loaded";
[] ExecVM "\z\addons\dayz_server\WAI\missions\missions.sqf";
//Custom ammo boxes
[] ExecVM "\z\addons\dayz_server\WAI\missions\StaticAmmoBoxes.sqf";