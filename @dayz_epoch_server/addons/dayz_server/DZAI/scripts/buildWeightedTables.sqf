private ["_startTime","_getWeightedIndices"];

_startTime = diag_tickTime;

//Function exerpt from fn_selectRandomWeighted.sqf written by Joris-Jan van 't Land
_getWeightedIndices = {
	private ["_array", "_weights","_index","_weighted","_i"];
	_array = _this select 0;
	_weights = _this select 1;

	//Parameter validation.
	if ((typeName _array) != (typeName [])) exitWith {debugLog "Log: [selectRandomWeighted] Array (0) must be an Array!"; nil};
	if ((typeName _weights) != (typeName [])) exitWith {debugLog "Log: [selectRandomWeighted] Weights (1) must be an Array!"; nil};
	if ((count _array) > (count _weights)) exitWith {debugLog "Log: [selectRandomWeighted] There must be at least as many elements in Weights (1) as there are in Array (0)!"; nil};

	//Created weighted array of indices.
	private ["_weighted"];
	_weighted = [];
	for "_i" from 0 to ((count _weights) - 1) do 
	{
		private ["_weight"];
		_weight = _weights select _i;

		//Ensure the weight is a Number.
		//If it's not, set weight to 0 to exclude it.
		if ((typeName _weight) != (typeName 0)) then {debugLog "Log: [selectRandomWeighted] Weights should be Numbers; weight set to 0!"; _weight = 0};
		
		//The weight should be a Number between 0 and 1.
		if (_weight < 0) then {debugLog "Log: [selectRandomWeighted] Weights should be more than or equal to 0; weight set to 0!"; _weight = 0};
		//if (_weight > 1) then {debugLog "Log: [selectRandomWeighted] Weights should be less than or equal to 1; weight set to 1!"; _weight = 1};
		
		//Normalize the weight for a precision of hundreds.
		_weight = round(_weight * 100);
		
		for "_k" from 0 to (_weight - 1) do 
		{
			//_weighted = _weighted + [_i];
			_weighted set [count _weighted,_i];
		};
	};

	_weighted
};

{
	private ["_weightedTable","_gradeChances"];
	_gradeChances = missionNamespace getVariable (_x select 0);
	_weightedTable = [DZAI_weaponGrades,_gradeChances] call _getWeightedIndices;
	missionNamespace setVariable [_x select 1,_weightedTable];
	missionNamespace setVariable [_x select 0,nil];
} count [
			//Input variable - Gradechances array, Output variable - Gradeindices array
			["DZAI_gradeChances0","DZAI_gradeIndices0"],
			["DZAI_gradeChances1","DZAI_gradeIndices1"],
			["DZAI_gradeChances2","DZAI_gradeIndices2"],
			["DZAI_gradeChances3","DZAI_gradeIndices3"],
			["DZAI_gradeChancesDyn","DZAI_gradeIndicesDyn"]
		];

if (DZAI_debugLevel > 0) then {diag_log format ["[DZAI] DZAI finished building weighted weapongrade tables in %1 seconds.",(diag_tickTime - _startTime)]};

true

