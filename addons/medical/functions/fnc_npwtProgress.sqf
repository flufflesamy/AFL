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
 * Continue Treatment <BOOL>
 *
 * Example:
 * [[objNull, player], 5, 10] call afl_medical_fnc_nwptProgress
 */
params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_medic", "_patient", "_bodyPart"];

private _isPartBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);
private _initialWoundsCount = _medic getVariable [QGVAR(initialWoundsCount), 0];
private _counter = _medic getVariable [QGVAR(treatmentCounter), 0];

private _treatmentInterval = _totalTime / _initialWoundsCount;
private _threshold = _treatmentInterval * _counter + _treatmentInterval;

if (_elapsedTime >= _threshold) then {
    TRACE_4("npwt treatment",_treatmentInterval,_counter,_threshold,_elapsedTime);
    // Bandage wounds
    if (_isPartBleeding) then {
        [QACEGVAR(medical_treatment,bandageLocal), [_patient, _bodyPart, "PackingBandage", 1000], _patient] call CFUNC(targetEvent);
    };

    // Stitch wounds
    private _stitched = false;
    while {not _stitched} do {
        _stitched = [_patient, _bodyPart] call ACEFUNC(medical_treatment,stitchWound);
    };

    INC(_counter);
    _medic setVariable [QGVAR(treatmentCounter), _counter, false];
};

private _return = true;

_return;
