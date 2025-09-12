#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Checks if medic can use surgical kit on patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * 0: Can NPWT <BOOL>
 *
 * Example:
 * [player, cursorTarget, "leftarm"] call afl_medical_fnc_npwtCan
 */
params ["_medic", "_patient", "_bodyPart"];

private _return = false;
private _bandagedWoundsOnPart = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];

_return = _bandagedWoundsOnPart isNotEqualTo [];

_return;
