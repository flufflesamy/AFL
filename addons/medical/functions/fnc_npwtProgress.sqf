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

// Local check
if (!local _medic) exitWith {
    ERROR_1("%1 not Local!",_this);
    false;
};

private _return = nil;
private _isPartBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);
private _initialWoundsCount = _medic getVariable [QGVAR(initialWoundsCount), 0];
private _bandagedWoundsOnPart = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
private _counter = _medic getVariable [QGVAR(treatmentCounter), 0];

private _treatmentInterval = _totalTime / (_initialWoundsCount max 1);
private _threshold = _treatmentInterval * _counter + _treatmentInterval;

// Halt checks
switch (true) do {
    // Stop treatment when timer done and all wounds stitched and bandaged
    case (!_isPartBleeding && _bandagedWoundsOnPart isEqualTo [] && _elapsedTime >= _totalTime): {
        INFO_2("NPWT Progress Complete: Elapsed=%1s, Total=%2s",_elapsedTime,_totalTime);
        if (_elapsedTime - _totalTime > 0.02) then {
            WARNING_1("NPWT time exceeded by %1s",((_elapsedTime - _totalTime) toFixed 2));
        };
        _return = true;
    };
    // Timeout with error if treatment goes on for too long
    case ((_elapsedTime - _totalTime) > 1): {
        ERROR_5("NPWT timeout by %1s: Wound Count=%2, Bandaged Wounds=%3, Interval=%4, Threshold=%5",((_elapsedTime - _totalTime) toFixed 2),_initialWoundsCount,_bandagedWoundsOnPart,_treatmentInterval,_threshold);

        _return = false;
    };
    // Failsafe, if not all treated, set counter to 0 so that treatment will loop immediately
    case (_elapsedTime >= _totalTime): {
        _counter = 0;
    };
    // Otherwise, continue treatment
    default {};
};

if (_elapsedTime >= _threshold && isNil "_return") then {
    TRACE_4("NPWT treating wound",_treatmentInterval,_counter,_threshold,_elapsedTime);

    // If bleeding, bandage
    if (_isPartBleeding) then {
        [QACEGVAR(medical_treatment,bandageLocal), [_patient, _bodyPart, "PackingBandage", 1000], _patient] call CFUNC(targetEvent);
        INFO_1("Finished bandaging: Time=%1",_elapsedTime);
    };

    // Stitch wound
    [QGVAR(npwtStitchLocal), [_patient, _bodyPart], _patient] call CFUNC(targetEvent);

    // Increment counter
    INC(_counter);
    _medic setVariable [QGVAR(treatmentCounter), _counter, false];
    INFO_1("NPWT treated wound:%1",_this);
};

RETNIL(_return);
