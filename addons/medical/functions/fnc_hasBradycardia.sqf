#include "..\script_component.hpp"
/*
 * Author: Mazinski.H Edited by flufflesamy
 * Checks if patient has bradycardia
 *
 * Arguments:
 * 0: Patient <OBJECT>
 *
 * Return Value:
 * Has bradycardia <BOOL>
 *
 * Example:
 * [player] call afl_medical_fnc_hasBradycardia;
 */

params ["_patient"];
TRACE_1("hasBradycardia",_patient);

private _medicationArray = _patient getVariable [QACEGVAR(medical,medications), []];
private _hasBradycardia = false;

{
    _x params ["_medication"];

    if (_medication isEqualTo "BRADYCARDIA") then {
        _hasBradycardia = true;
        break;
    };
} forEach (_medicationArray);

_hasBradycardia;
