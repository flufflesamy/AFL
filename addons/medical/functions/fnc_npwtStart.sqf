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
 *
 * Public: No
 */
params ["_medic", "_patient", "_bodyPart"];
TRACE_3("npwtStart",_medic,_patient,_bodyPart);

private _validWounds = [_patient, _bodyPart] call FUNC(npwtGetWoundCount);
_validWounds params ["_openWounds", "_bandagedWounds"];
private _initialWoundsCount = _openWounds + _bandagedWounds;

// Initialize global variables
GVAR(npwtCounter) = 0;
GVAR(initialWoundsCount) = _initialWoundsCount;

// Add action to log
[_patient, "Dressing Vacuum"] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", LLSTRING(Activity_usedNPWT), [[_medic, false, true] call ACEFUNC(common,getName)]] call ACEFUNC(medical_treatment,addToLog);

INFO_2("npwtStart: Starting treatment. _initialWoundsCount=%1, Params=%2",_initialWoundsCount,_this);
