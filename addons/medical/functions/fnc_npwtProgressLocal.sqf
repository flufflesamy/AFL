#include "..\script_component.hpp"
/*
 * Authors: flufflesamy
 * In progress callback for dressing vacuum.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, player, "leftarm"] call afl_medical_fnc_nwptProgressLocal
 *
 * Public: No
 */
params ["_patient", "_bodyPart"];

// Local check
if (!local _patient) exitWith { ERROR_1("%1 not Local!",_this); };

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];
private _isBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);
TRACE_3("npwtProgressLocal",_this,_bandagedWoundsOnPart,_isBleeding);

// Progress check
if (_bandagedWoundsOnPart isEqualTo [] && !_isBleeding) exitWith {
    ERROR_3("npwtProgressLocal: Nothing to process. Params=%1, Bandaged=%2, Bleeding=%3",_this,_bandagedWoundsOnPart,_isBleeding);
};

switch (true) do {
    // Patient has bleeding open wound
    case (_isBleeding): {
        // Bandage first wound
        private _bandagedWound = [];
        _bandagedWound = [_patient, _bodyPart] call FUNC(npwtBandageWound);
        if (_bandagedWound isEqualTo [] || isNil "_bandagedWound") exitWith {
            ERROR_1("npwtProgressLocal: NPWT cannot bandage wound. Target Wound=%1",_this);
        };

        TRACE_1("Bandaged wound",_bandagedWound);

        // Stitch bandaged wound
        private _success = false;
        _success = [_patient, _bodyPart, _bandagedWound] call FUNC(npwtStitchWound);
        if (!_success || isNil("_success")) exitWith {
            ERROR_2("npwtProgressLocal: NPWT cannot stitch wound. Target Wound=%1, Wounds=%2",_bandagedWound,_bandagedWoundsOnPart);
        };

        TRACE_1("Stitched Wound",_success);

        INFO_3("npwtProgressLocal: Treated bleeding wound. Params=%1, Target Wound=%2, Stitched=%3",_this,_bandagedWound,_success);
    };
    // All patient's wounds are bandaged
    case (_bandagedWoundsOnPart isNotEqualTo []): {
        // Select first wound
        private _targetWound = _bandagedWoundsOnPart select 0;

        // Stitch wound
        private _success = false;
        _success = [_patient, _bodyPart, _targetWound] call FUNC(npwtStitchWound);
        if (!_success || isNil("_success")) exitWith {
            ERROR_2("npwtProgressLocal: NPWT cannot stitch wound. Target Wound=%1, Wounds=%2",_bandagedWound,_bandagedWoundsOnPart);
        };

        TRACE_1("Stitched Wound",_success);

        INFO_3("npwtProgressLocal: Treated bandaged wound. Params=%1, Target Wound=%2, Stitched=%3",_this,_bandagedWound,_success);
    };
    default {
        if (true) exitWith {
            ERROR_3("npwtProgressLocal: cannot treat wound: Params=%1, Wounds=%2, Bleeding=%3",_this,_bandagedWoundsOnPart,_isBleeding);
        };
    };
};

private _isLimping = _patient getVariable [QACEGVAR(medical,isLimping), false];

// Update limping
if (_bodyPart in ["leftleg", "rightleg"] && ACEGVAR(medical,limping) > 0 && _isLimping) then {
    TRACE_1("Update Damage Effects",_this);
    _patient call ACEFUNC(medical_engine,updateDamageEffects);
};

// Clear condition caches
private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ACEFUNC(common,isPlayer)};
TRACE_1("clearConditionCaches: npwtProgressLocal",_nearPlayers);
[QACEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CFUNC(targetEvent);
