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
 * [player, cursorTarget, "leftarm"] call afl_medical_fnc_npwtCan
 *
 * Public: No
 */
params ["_medic", "_patient", "_bodyPart"];

private _return = false;
private _check = {
    params ["_patient", "_bodyPart"];

    private _partIndex = ALL_BODY_PARTS find _bodyPart;
    private _bodyPartDamageOnPart = GET_BODYPART_DAMAGE(_patient) select _partIndex;
    private _openWoundsOnPart = GET_OPEN_WOUNDS(_patient) getOrDefault [_bodyPart, []];
    private _isBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);

    // True if patient is bleeding, or has trauma, or has bruises
    private _canNPWT = _isBleeding || _bodyPartDamageOnPart > 0 || _openWoundsOnPart isNotEqualTo [];

    _canNPWT;
};

if (_patient == _medic) then {
    switch (true) do {
        // If self treatment is not enabled
        case (GVAR(npwtSelfTreatment) == 0): {
            _return = false;
        };
        // If body + legs enabled but not treating those parts
        case (GVAR(npwtSelfTreatment) == 1 && !(_bodyPart in ["leftleg", "rightleg", "body"])): {
            _return = false;
        };
        // Else
        default {
            _return = [_patient, _bodyPart] call _check;
        };
    };
} else {
    _return = [_patient, _bodyPart] call _check;
};

_return;
