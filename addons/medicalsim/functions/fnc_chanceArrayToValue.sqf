#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Spawns patient based on preset;

	Parameter(s):
		0: Chance array <ARRAY>
        1: Range (Optional) <ARRAY>

	Returns:
		0: Value <NUMBER>

	Examples:
		[[1]] call afl_medicalsim_fnc_chanceArrayToValue;
*/
params ["_chanceArray", ["_range", [2, 3]]];
TRACE_2("chanceArrayToValue",_chanceArray,_range);

private _arraySize = count _chanceArray;
private _returnValue = 0;

switch (_arraySize) do {
    case 1: {
        _chanceArray params ["_value"];
        _returnValue = _value;
    };
    case 2: {
        _chanceArray params ["_chance1", "_chance2"];
        if ((_chance1 >= random 1)) then {
            if (_chance2 >= random 1) then {
                _range params ["_low", "_high"];
                _returnValue = _low + floor (random (_high - _low + 1));
            } else {
                _returnValue = 1;
            };
        };
    };
    case 3: {
        _chanceArray params ["_min", "_mid", "_max"];
        _returnValue = random [_min, _mid, _max];
    };
};

_returnValue;
