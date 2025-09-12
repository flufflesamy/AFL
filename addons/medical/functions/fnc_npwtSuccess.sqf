#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Callback on NPWT treatment success.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorTarget, "leftArm"] call afl_medical_fnc_npwtSuccess
 *
 * Public: No
 */
params ["_medic", "_patient", "_bodyPart"];
TRACE_3("npwtSuccess",_medic,_patient,_bodyPart);

[QGVAR(npwtSuccessLocal), [_patient, _bodyPart], _patient] call CFUNC(targetEvent);
