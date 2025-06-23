#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		Adds pneumothorax for a unit.

	Parameter(s):
		0: Unit <OBJECT>
        1: Pneumothorax type <STRING>
        2. Pneumothorax strength (Optional Default 1) <NUMBER>
        3: Deterioration toggle (Optional Default false) <BOOL>
        4: Tamponade toggle (Optional Default false) <BOOL>

	Returns:
		Nothing

	Examples:
		[player, "tension"] call afl_common_fnc_setPneumothorax;
*/

params ["_unit", "_type", ["_strength", 1], ["_det", false], ["_tam", false]];
TRACE_2("setPulmo",_unit,_type);

private _pType = PNUMO_TYPE find toLower _type;

if (isNil _unit) exitWith {
    ERROR_1("%1 cannot be nil.",_unit);
};

if (_pType == -1) exitWith {
    ERROR_1("Invalid pneumothorax type %1",_type);
};

if (_strength < 0 || _strength > 4) exitWith {
    ERROR_1("Invalid pneumothorax %1. Must be between 1-4.",_strength);
};

_unit setVariable [QKEGVAR(breathing,deepPenetratingInjury), true, true];
_unit setVariable [QKEGVAR(breathing,activeChestSeal), false, true];

// tension
if (_pType == 1) then {_unit setVariable [QKEGVAR(breathing,tensionpneumothorax), true, true];};

// hemo
if (_pType == 2) then {_unit setVariable [QKEGVAR(breathing,hemopneumothorax), true, true];};

// Initial
if (_pType == 0) then {
    _unit setVariable [QKEGVAR(breathing,pneumothorax), _strength, true];

    [_unit, -12 * _pneumothorax, -12 * _pneumothorax, "ptx_tension", true] call KEFUNC(circulation,updateBloodPressureChange);
    [_unit, 0.5 * (_pneumothorax / 4)] call ACEFUNC(medical_status,adjustPainLevel);

    // deteriorate after delay
    if (_det) then {[_unit, 15] call KEFUNC(breathing,handlePneumothoraxDeterioration);};
} else { // Tension or Hemo
    _unit setVariable [QKEGVAR(breathing,pneumothorax), 4, true];
    [_unit, -48, -48, "ptx_tension", true] call KEFUNC(circulation,updateBloodPressureChange);
    [_unit, 0.5] call ACEFUNC(medical_status,adjustPainLevel);
};

[_unit] call KEFUNC(circulation,updateInternalBleeding);

// create tamponade
if (_tam == true) then {_unit call KEFUNC(circulation,createTamponade);};
