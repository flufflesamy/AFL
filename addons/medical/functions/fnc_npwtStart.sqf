#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Callback on start of NPWT treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment (unused) <STRING>
 * 4: Item User (unused) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorTarget, "leftArm"] call afl_medical_fnc_npwtStart
 */
params ["_medic", "_patient", "_bodyPart", "", "", "_usedItem"];
TRACE_3("npwtStart",_medic,_patient,_bodyPart);

// Get total number of bandaged and open wounds
private _initialBandagedWounds = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
private _initialOpenWounds = (GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []];

private _openWoundsCount = 0;
{
    _x params ["_classID", "_amountOf", "_bleeding", "_damage"];

    if ((_amountOf * _bleedMulti) > 0) then {
        INC(_openWoundsCount);
    }
} forEach _initialOpenWounds;

private _initialWoundsCount = (count _initialBandagedWounds) + (count _initialOpenWounds);
INFO_3("NPWT Start: Bandaged=%1, Open=%2, Total=%3",_initialBandagedWounds,_initialOpenWounds,_initialWoundsCount);

// Initialize variables
_medic setVariable [QGVAR(treatmentCounter), 0, false];
_medic setVariable [QGVAR(initialWoundsCount), _initialWoundsCount, false];

// Add action to log
[_patient, _usedItem] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", LLSTRING(Activity_usedNPWT), [[_medic, false, true] call ACEFUNC(common,getName)]] call ACEFUNC(medical_treatment,addToLog);
