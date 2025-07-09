#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the ACE project,
 * which is licensed under GPLv2 or later. This code is therefore licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Authors: kymckay, Edited by flufflesamy
 * Calculates the time to bandage a wound based on it's size, the patient and the medic.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorTarget, "head", "FieldDressing"] call ace_medical_treatment_fnc_getBandageTime
 */

params ["_medic", "_patient", "_bodyPart", "_bandage"];
TRACE_4("getBandageTime",_medic,_patient,_bodyPart,_bandage);

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;
if (_partIndex < 0) exitWith { ERROR_1("invalid partIndex - %1",_this); 0 };

private _targetWounds = [_patient, _bandage, _bodyPart] call ACEFUNC(medical_treatment,findMostEffectiveWounds);
TRACE_1("findMostEffectiveWounds",_targetWounds);

private _woundCount = count _targetWounds;

// Everything is patched up on this body part already
if (_woundCount == 0) exitWith {0};

// Base bandage time is based on wound size and remaining percentage
private _bandageTimesArray = [GVAR(bandageTimeS), GVAR(bandageTimeM), GVAR(bandageTimeL)];
private _bandageTime = 0;

{
    private _wound = _x;
    _wound params ["_classID", "", "_amountOf"];
    _y params ["_effectiveness", "", "_impact"];
    private _category = (_classID % 10);

    // Base bandage time is based on wound size and remaining percentage
    private _woundTime = _bandageTimesArray select _category;

    // Scale bandage time based on amount left and effectiveness (less time if only a little wound left)
    // Basic bandage treatment will have a very high effectiveness and can be ignored
    if (ACEGVAR(medical_treatment,advancedBandages != 0)) then {
        _woundTime = _woundTime * linearConversion [0, _effectiveness, _impact, 0.666, 1, true];
    };

    _bandageTime = _bandageTime + _woundTime;
} forEach _targetWounds;

// Bandaging yourself requires more work
if (_medic == _patient) then {
    _bandageTime = _bandageTime + BANDAGE_TIME_MOD_SELF;
};

// Bandaging multiple injuries doesn't require opening a new bandage each time
if (_woundCount > 1) then {
    _bandageTime = _bandageTime - (2 * _woundCount);
};

TRACE_1("",_bandageTime);
// Nobody can bandage instantly
_bandageTime max 0.5
