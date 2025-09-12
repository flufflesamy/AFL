#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the KAM and ACE projects,
 * which is licensed under GPLv3. This code is therefore also licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Authors: BaerMitUmlaut, mharis001, MiszczuZPolski, flufflesamy
 * In progress callback for dressing vacuum.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic <OBJECT>
 *   1: Patient <OBJECT>
 *   2: Body Part <STRING>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * 0: Success <BOOL>
 *   true: Runs surgicalKitSuccess (unused) and ends treatment
 *   false: Runs surgicalKitFailure (unused) and ends treatment
 *   nil: Continue treatment
 *
 * Example:
 * [[player, cursorTarget, "leftarm"], 5, 10] call afl_medical_fnc_nwptProgress
 */
params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_medic", "_patient", "_bodyPart"];

private _initialWoundsCount = GVAR(initialWoundsCount);
private _counter = GVAR(surgicalKitCounter);

// Set treatment interval and threshold
private _treatmentInterval = _totalTime / (_initialWoundsCount max 1);
private _threshold = _treatmentInterval * _counter + _treatmentInterval;

if (_initialWoundsCount > 0 && _elapsedTime >= _threshold) then {
    TRACE_5("Surgical Kit treating wound",_this,_treatmentInterval,_counter,_threshold,_elapsedTime);

    [QGVAR(surgicalKitProgressLocal), [_patient, _bodyPart], _patient] call CFUNC(targetEvent);

    // Increment counter
    INC(_counter);
    GVAR(surgicalKitCounter) = _counter;
    INFO_1("surgicalKitProgress: Stitched wound. Params=%1",_this);
};

private _return = nil;

if (_elapsedTime >= _totalTime) then {
    INFO_1("surgicalKitProgress: Progress Complete. Params=%1",_this);
    _return = true;
};

_return;
