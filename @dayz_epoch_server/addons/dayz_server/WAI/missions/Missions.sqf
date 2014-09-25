if(!isServer) exitWith {};

diag_log "WAI: Starting AI Missions Moniter";

markerready = true;
missionrunning = false;
_startTime = floor(time);
_result = 1;

sleep(120);

while {true} do
{
	_cnt = {alive _x} count playableUnits;
	_currTime = floor(time);
	if((_currTime - _startTime >= wai_mission_timer) AND (!missionrunning)) then {_result = 1};
	
	if(missionrunning) then
	{
		_startTime = floor(time);
	};
	
	if((_result == 1) AND (_cnt >= 1) AND (markerready))  then
    {
		clean_running_mission = False;
        _mission = wai_missions call BIS_fnc_selectRandom;
        execVM format ["\z\addons\dayz_server\WAI\missions\missions\%1.sqf",_mission];
		missionrunning = true;
        diag_log format["WAI: Starting Mission %1",_mission];
        _startTime = floor(time);
        _result = 0;
    } else {
    	sleep 60;
    };    
};
