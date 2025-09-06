#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Checks if medic can use NPWT on patient.
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
 * [player, cursorTarget, "leftArm"] call afl_medical_fnc_npwtCan
 */
params ["_medic", "_patient", "_bodyPart"];
// TRACE_3("npwtCan",_medic,_patient,_bodyPart);

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;
private _bodyPartDamageOnPart = _patient getVariable [QACEGVAR(medical,bodyPartDamage), [0, 0, 0, 0, 0, 0]] select _partIndex;
private _openWoundsOnPart = _patient getVariable [QACEGVAR(medical,openWounds), newHashMap] getOrDefault [_bodyPart, []];

// True if patient is bleeding, or has trauma, or has bruises
private _return = _this call KEFUNC(surgery,canNPWT) || _bodyPartDamageOnPart > 0 || _openWoundsOnPart isNotEqualTo [];
// TRACE_3("npwtCanReturn",_partIndex,_bodyPartDamageOnPart,_return);

_return;
