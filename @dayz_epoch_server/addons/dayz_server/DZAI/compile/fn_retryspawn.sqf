//If a trigger's calculated totalAI value is zero, then add new group to respawn queue to retry spawn until a nonzero value is found.
private ["_trigger","_unitGroup","_dummy","_grpArray","_side"];

_trigger = _this select 0;
_side = _this select 1;

waitUntil {uiSleep 0.1; (_trigger getVariable ["initialized",false])};

//Create placeholder dummy unit.
_unitGroup = createGroup _side;
_dummy = _unitGroup call DZAI_protectGroup;

//Initialize group variables.
_unitGroup setVariable ["dummyUnit",_dummy];
_unitGroup setVariable ["GroupSize",0];
_unitGroup setVariable ["trigger",_trigger];
_unitGroup setVariable ["unitType","static"];
_unitGroup allowFleeing 0;

//Add new group to trigger's group array.
_grpArray = _trigger getVariable "GroupArray";
_grpArray set [(count _grpArray),_unitGroup];

0 = [0,_trigger,_unitGroup,true] call fnc_respawnHandler;
