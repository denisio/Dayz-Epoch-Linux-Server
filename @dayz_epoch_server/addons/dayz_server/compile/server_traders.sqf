private ["_clientID","_character","_traderid","_retrader","_data","_result","_status","_val","_key"];
//[dayz_characterID,_tent,[_dir,_location],"TentStorage"]
_character = _this select 0;
_traderid = _this select 1;

_clientID = owner _character;
//diag_log ("HIVE: Menu Request by ClientID: "+ str(_clientID));

// add cacheing
_retrader = call compile format["ServerTcache_%1;",_traderid];

if (isNil "_retrader") then {
    _retrader = [];

    _key = format["\cache\traders\%1.sqf", _traderid];
    diag_log ("LOAD TRADER: "+_key);
    _res = preprocessFile _key;
    diag_log ("TRADER CACHE: "+_res);

    if ((_res == "") or (isNil "_res")) then {
        diag_log ("TRADER NOT FOUND");
    } else {
        call compile format["ServerTcache_%1 = [];", _traderid];
        
        _myArr = call compile _res;
        diag_log format["Count: %1", str(count _myArr)];
            
        {
            call compile format["ServerTcache_%1 set [count ServerTcache_%1,%2]", _traderid, _x];
            _retrader set [count _retrader, _x];
        } forEach _myArr;

        _myArr = nil;
    };
    _res = nil;
};

// diag_log(_retrader);
PVDZE_plr_TradeMenuResult = _retrader;
if(!isNull _character) then {
	_clientID publicVariableClient "PVDZE_plr_TradeMenuResult";
};