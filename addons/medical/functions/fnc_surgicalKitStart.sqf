#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Callback on start of NPWT treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorTarget, "leftArm"] call afl_medical_fnc_npwtStart
 */
params ["_medic", "_patient", "_bodyPart"];
TRACE_3("surgicalKitStart",_medic,_patient,_bodyPart);

private _bandagedWoundsOnPart = GET_BANDAGED_WOUNDS(_patient) getOrDefault [_bodyPart, []];
private _initialWoundsCount = count _bandagedWoundsOnPart;

// Initialize global variables
GVAR(surgicalKitCounter) = 0;
GVAR(initialWoundsCount) = _initialWoundsCount;

// Add action to log
[_patient, "Surgical Kit"] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", LLSTRING(Activity_usedNPWT), [[_medic, false, true] call ACEFUNC(common,getName)]] call ACEFUNC(medical_treatment,addToLog);

INFO_2("surgicalKitStart: Starting treatment. _initialWoundsCount=%1, Params=%2",_initialWoundsCount,_this);
