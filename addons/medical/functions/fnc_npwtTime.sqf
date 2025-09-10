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
TRACE_3("npwtTime",_medic,_patient,_bodyPart);

private _return = 0;

// Get count of wounds to be treated
private _validWounds = [_patient, _bodyPart] call FUNC(npwtGetWoundCount);
_validWounds params ["_openWounds", "_bandagedWounds"];

// Open wound treatment includes stitching
private _openTime = GVAR(npwtBandageTime) + GVAR(npwtStitchTime);
// Bandaged wounds only need to be stitched
private _bandagedTime = GVAR(npwtStitchTime);
private _baseTime = (_openTime * _openWounds) + (_bandagedTime * _bandagedWounds);

// Get body part damage
private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;
private _bodyPartDamageOnPart = _patient getVariable [QACEGVAR(medical,bodyPartDamage), [0, 0, 0, 0, 0, 0]] select _partIndex;
private _damageTime = _bodyPartDamageOnPart * GVAR(npwtNormalizeCoef);

if (_baseTime == 0 && _bodyPartDamageOnPart > 0) then {
    _return = _bandagedTime;
} else {
    // If normalize option enabled
    if (GVAR(npwtNormalize)) then {
        // Normalize times based on trauma to avoid overly long or short treatment times
        // Make sure that treatment time is not under time to treat bruises / trauma
        _return = round ((_baseTime * (1 - GVAR(npwtNormalizeProp)) + _damageTime * GVAR(npwtNormalizeProp)) max _bandagedTime);
    } else {
        _return = round _baseTime;
    };

    // Show warning if time is 0
    if (_return == 0) then {
        WARNING_3("npwtStart: Patient %1 has no valid wounds for treatment. _openWounds=%2, _bandagedWounds=%3",_patient,_openWounds,_bandagedWounds);
    };
};

TRACE_4("npwtTime: Return",_bodyPartDamageOnPart,_baseTime,_damageTime,_return);
INFO_1("npwtTime: Treatment Time=%1s",_return);

_return;
