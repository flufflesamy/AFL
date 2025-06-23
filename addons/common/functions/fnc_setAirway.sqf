#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		Adds pneumothorax for a unit.

	Parameter(s):
		0: Unit <OBJECT>
        1: Occlusion <BOOL>
        2: Obstruction <BOOL>
        3: SPO2 <NUMBER>

	Returns:
		Nothing

	Examples:
		[player, "true", "true", 90] call afl_common_setAirway;
*/

params["_unit", "_occluded", "_obstructed", "_spo2"];

_unit setVariable [QKEGVAR(airway,occluded), _occluded, true];
_unit setVariable [QKEGVAR(airway,obstructed), _obstructed, true];

private _bloodGas = GET_BLOOD_GAS(_unit);
_bloodGas set [1, _spo2]
_unit setVariable [QKEGVAR(circulation,bloodGas), _bloodGas, true];
