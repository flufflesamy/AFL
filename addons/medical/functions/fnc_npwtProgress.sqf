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
 *   true: Runs npwtSuccess (unused) and ends treatment
 *   false: Runs npwtFailure (unused) and ends treatment
 *   nil: Continue treatment
 *
 * Example:
 * [[player, cursorTarget, "leftarm"], 5, 10] call afl_medical_fnc_nwptProgress
 */
params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_medic", "_patient", "_bodyPart"];

private _return = nil;
private _isPartBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);
private _initialWoundsCount = _medic getVariable [QGVAR(initialWoundsCount), 0];
private _bandagedWoundsOnPart = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
private _counter = _medic getVariable [QGVAR(treatmentCounter), 0];

private _treatmentInterval = _totalTime / (_initialWoundsCount max 1);
private _threshold = _treatmentInterval * _counter + _treatmentInterval;

private _stitch = {
    params ["_patient", "_bodyPart"];

    TRACE_1("Start stitching",_elapsedTime);
    // Stitch wounds
    private _stitched = false;
    while {!_stitched} do {
        _stitched = [_patient, _bodyPart] call ACEFUNC(medical_treatment,stitchWound);
    };
    TRACE_1("Finished stitching",_elapsedTime);
};

// Halt checks
switch (true) do {
    // Stop treatment when timer done and all wounds stitched and bandaged
    case (!_isPartBleeding && _bandagedWoundsOnPart isEqualTo [] && _elapsedTime >= _totalTime): {
        TRACE_2("NPWT Complete",_elapsedTime,_totalTime);
        _return = true;
    };
    // Timeout with error if treatment goes on for too long
    case ((_elapsedTime - _totalTime) > 1): {
        ERROR_4("NPWT timeout by %1s. Total Wounds:%2 Interval:%3 Threshold:%4",(_elapsedTime - _totalTime),_totalWoundsCount,_treatmentInterval,_threshold);
        _return = false;
    };
    // Failsafe, if not all treated, set counter to 0 so that treatment will loop immediately
    case (_elapsedTime >= _totalTime): {
        // Don't spam the log
        if (_counter > 0 && (_elapsedTime - _totalTime > 0.01)) then {
            WARNING_1("NPWT time exceeded by %1s",(_elapsedTime - _totalTime));
        };

        _counter = 0;
    };
    // Otherwise, continue treatment
    default {};
};

if (_elapsedTime >= _threshold && isNil "_return") then {
    TRACE_4("NPWT treating wound",_treatmentInterval,_counter,_threshold,_elapsedTime);
    // If bleeding, bandage and stitch
    if (_isPartBleeding) then {
        TRACE_1("Bandaging wound",_elapsedTime);
        [QACEGVAR(medical_treatment,bandageLocal), [_patient, _bodyPart, "Dressing"], _patient] call CFUNC(targetEvent);
        TRACE_1("Finished bandaging",_elapsedTime);

        [_patient, _bodyPart] call _stitch;
    };

    // If no open wounds left, stitch
    if (_bandagedWoundsOnPart isNotEqualTo [] && !_isPartBleeding) then {
        [_patient, _bodyPart] call _stitch;
    };

    // Increment counter
    INC(_counter);
    _medic setVariable [QGVAR(treatmentCounter), _counter, false];
};

_return;
