#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Calculates treatment time for NPWT treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * 0: NPWT Time <NUMBER>
 *
 * Example:
 * [player, cursorTarget, "leftArm"] call afl_medical_fnc_npwtTime
 */
params ["_medic", "_patient", "_bodyPart"];
TRACE_3("surgicalKitTime",_medic,_patient,_bodyPart);

private _return = 0;

// Get count of wounds to be treated
private _bandagedWoundsOnPart = count ((GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []]);

private _baseTime = _bandagedWoundsOnPart * GVAR(npwtStitchTime);

_return = _baseTime;

INFO_1("surgicalKitTime: Treatment Time=%1s",_return);

_return;
