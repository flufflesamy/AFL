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

private _bodyPart = toLowerANSI _bodyPart;
private _isPartBleeding = [_patient, _bodyPart] call FUNC(isPartBleeding);
private _bandagedWoundsOnPart = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
private _counter = _medic getVariable [QGVAR(treatmentCounter), 0];
private _treatmentInterval = _medic getVariable [QGVAR(treatmentInterval), 0];

// On first run
if (_counter == 0) then {
    private _initialOpenWounds = (GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
    _treatmentInterval = _totalTime / (count _initialOpenWounds);
    TRACE_1("initialopenwounds",_initialOpenWounds);
    _medic setVariable [QGVAR(treatmentInterval), _treatmentInterval, false];
};

private _interval = (_treatmentInterval * _counter) max _treatmentInterval;

if (_elapsedTime >= _interval) then {
    TRACE_4("npwt treatment",_treatmentInterval,_counter,_interval,_elapsedTime);
    // Bandage wounds
    if (_isPartBleeding) then {
        [QACEGVAR(medical_treatment,bandageLocal), [_patient, _bodyPart, "Dressing"], _patient] call CFUNC(targetEvent);
    };

    // Stitch wounds
    if (_bandagedWoundsOnPart isNotEqualTo []) then {
        private _stitched = false;
        while {not _stitched} do {
            _stitched = [_patient, _bodyPart] call ACEFUNC(medical_treatment,stitchWound);
        };
    };

    INC(_counter);
    _medic setVariable [QGVAR(treatmentCounter), _counter, false];
};

// Continue if treatement time not reached
if (_totalTime - _elapsedTime > ([_patient, _patient, _bodyPart] call KEFUNC(surgery,getNPWTTime)) - KEGVAR(surgery,npwtTime)) exitWith {true};

// Stop only if all parts are bandaged and stitched
if (!_isPartBleeding && _bandagedWoundsOnPart isEqualTo []) exitWith {false};
