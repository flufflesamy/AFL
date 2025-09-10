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
 *   true: Runs npwtSuccess and ends treatment
 *   false: Runs npwtFailure (unused) and ends treatment
 *   nil: Continue treatment
 *
 * Example:
 * [[player, cursorTarget, "leftarm"], 5, 10] call afl_medical_fnc_nwptProgress
 */
params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_medic", "_patient", "_bodyPart"];

// Get variables
private _isPartBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);
private _initialWoundsCount = GVAR(initialWoundsCount);
private _counter = GVAR(npwtCounter);
private _bandagedWoundsOnPart = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];

// Set treatment interval and threshold
private _treatmentInterval = _totalTime / (_initialWoundsCount max 1);
private _threshold = _treatmentInterval * _counter + _treatmentInterval;

if (_initialWoundsCount > 0 && _elapsedTime >= _threshold && isNil "_return") then {
    TRACE_5("NPWT treating wound",_this,_treatmentInterval,_counter,_threshold,_elapsedTime);

    [QGVAR(npwtProgressLocal), [_patient, _bodyPart], _patient] call CFUNC(targetEvent);

    // Increment counter
    INC(_counter);
    GVAR(npwtCounter) = _counter;
    INFO_1("npwtProgress: Treated wound. Params=%1",_this);
};

// Get updated state
_isPartBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);
_bandagedWoundsOnPart = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];

private _return = nil;

// Halt checks
switch (true) do {
    // Stop treatment when timer done and all wounds stitched and bandaged
    case (!_isPartBleeding && _bandagedWoundsOnPart isEqualTo [] && _elapsedTime >= _totalTime): {
        INFO_1("npwtProgress: Progress Complete. Params=%1",_this);
        _return = true;
    };
    // Timeout if treatment goes on for too long
    case (_elapsedTime >= _totalTime): {
        WARNING_1("npwtProgress: Timeout. Params=%1",_this);
        _return = true;
    };
    // Otherwise, continue treatment
    default {};
};

_return;
