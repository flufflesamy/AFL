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
private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;
private _bodyPartDamageOnPart = _patient getVariable [QACEGVAR(medical,bodyPartDamage), [0, 0, 0, 0, 0, 0]] select _partIndex;
private _baseTime = _this call KEFUNC(surgery,getNPWTTime);
private _damageTime = _bodyPartDamageOnPart max KEGVAR(surgery,npwtTime);

if (_baseTime == 0 && _bodyPartDamageOnPart > 0) then {
    _return = KEGVAR(surgery,npwtTime);
} else {
    // Normalize times based on trauma to avoid overly long or short treatment times
    _return = round ((_baseTime + _damageTime) / 2);
};

TRACE_4("npwtTimeReturn",_partIndex,_baseTime,_damageTime,_return);

_return;
