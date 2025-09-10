#include "..\script_component.hpp"
/*
 * The following code is a derivative work of code from the ACE project,
 * which is licensed under GPLv2 or later. This code is therefore licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Authors: LinkIsGrim (ace_medical_treatment_fnc_addTrauma), flufflesamy
 * Local callback on NPWT treatment success. Should only be called by npwtSuccess.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, "leftarm"] call afl_medical_fnc_npwtSuccessLocal
 */
params ["_patient", "_bodyPart"];
TRACE_2("npwtSuccessLocal",_patient,_bodyPart);

// Local check
if (!local _patient) exitWith { ERROR_1("%1 not Local!",_this) };

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;
private _openWounds = GET_OPEN_WOUNDS(_patient);
private _openWoundsOnPart = _openWounds getOrDefault [_bodyPart, []];
private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];
private _bodyPartDamage = GET_BODYPART_DAMAGE(_patient);
private _bodyPartDamageOnPart = _bodyPartDamage select _partIndex;

// Clear open wounds
if (_openWoundsOnPart isNotEqualTo []) then {
    TRACE_1("npwtSucessLocal: Clear open wounds",_openWoundsOnPart);
    private _isBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);

    _openWounds set [_bodyPart, []];
    _patient setVariable [VAR_OPEN_WOUNDS, _openWounds, true];

    if (_isBleeding) then {
        WARNING_2("npwtSuccessLocal: Treatment incomplete, patient has bleeding wounds. _openWoundsOnPart=%1, Params=%2",_openWoundsOnPart,_this);

        _patient call ACEFUNC(medical_status,updateWoundBloodLoss);

        // Update limping
        if (_bodyPart in ["leftleg", "rightleg"] && ACEGVAR(medical,limping) > 0) then {
            _patient call ACEFUNC(medical_engine,updateDamageEffects);
        };
    };
};

// Clear bandaged wounds
if (_bandagedWoundsOnPart isNotEqualTo []) then {
    WARNING_2("npwtSuccessLocal: Treatment incomplete, patient has unstitched wounds. _bandagedWoundsOnPart=%1, Params=%2",_bandagedWoundsOnPart,_this);
    _bandagedWounds set [_bodyPart, []];
    _patient setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];
};

// Get rid of trauma
if (_bodyPartDamageOnPart isNotEqualTo []) then {
    TRACE_1("npwtSucessLocal: Removing trauma",_bodyPartDamageOnPart);
    _bodyPartDamage set [_partIndex, 0];
    _patient setVariable [VAR_BODYPART_DAMAGE, _bodyPartDamage, true];
};

// Update body part visuals (ace_medical_treatment_fnc_addTrauma)
switch (_bodyPart) do {
    case "head":     { [_patient, true, false, false, false] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
    case "body":     { [_patient, false, true, false, false] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
    case "leftarm";
    case "rightarm": { [_patient, false, false, true, false] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
    default { [_patient, false, false, false, true] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
};

// Update medical engine
_patient call ACEFUNC(medical_vitals,handleUnitVitals);

// Clear condition caches
private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ACEFUNC(common,isPlayer)};
TRACE_1("clearConditionCaches: npwtSuccessLocal",_nearPlayers);
[QACEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CFUNC(targetEvent);

INFO_1("npwtSuccessLocal: All wounds and trauma on part cleared. Params=%1",_this);
