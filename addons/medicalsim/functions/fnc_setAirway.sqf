#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Sets airway for unit.

	Parameter(s):
		0: Unit <OBJECT>
        1: Occlusion <BOOL>
        2: Obstruction <BOOL>
        3: SPO2 <NUMBER>

	Returns:
		Nothing

	Examples:
		[player, "true", "true", 90] call afl_common_fnc_setAirway;
*/

params["_unit", "_occluded", "_obstructed", "_pao2"];
TRACE_4("setAirway",_unit,_occluded,_obstructed,_spo2);

_unit setVariable [QKEGVAR(airway,occluded), _occluded, true];
_unit setVariable [QKEGVAR(airway,obstruction), _obstructed, true];

private _bloodGas = _unit getVariable [QKEGVAR(circulation,bloodGas), [40,90,0.96,0.24,7.4,37]];

_bloodGas set [1, _pao2];

_unit setVariable [QKEGVAR(circulation,bloodGas), _bloodGas, true];

_unit call ACEFUNC(medical_vitals,handleUnitVitals);
