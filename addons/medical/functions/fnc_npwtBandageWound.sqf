#include "..\script_component.hpp"
/*
 * Authors: flufflesamy
 * Local function for NPWT wound bandaging. Should only be called by npwtProgressLocal.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * 0: Bandaged Wound <ARRAY>
 *
 * Example:
 * [player, "leftarm"] call afl_medical_fnc_nwptBandageWound
 */
params ["_patient", "_bodyPart"];
TRACE_2("npwtBandageWound",_patient,_bodyPart);

// Local check
if (!local _patient) exitWith {
    ERROR_1("%1 not Local!",_this);
    [];
};

private _openWounds = GET_OPEN_WOUNDS(_patient);
private _openWoundsOnPart = _openWounds getOrDefault [_bodyPart, []];
private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];

private _targetWoundIndex = _openWoundsOnPart findIf {
    _x params ["", "_amountOf", "_bleeding"];
    (_amountOf * _bleeding) > 0;
};

// Bleeding wound check
if (_targetWoundIndex == -1) exitWith {
    ERROR_1("npwtBandageWound: No bleeding wound. Params=%1",_this);
    [];
};

private _targetWound = _openWoundsOnPart select _targetWoundIndex;

// Add wound to bandaged wounds
private _bandagedIndex = _bandagedWoundsOnPart findIf {
    _x params ["_bandagedID"];
    _bandagedID == _targetWound select 0;
};

TRACE_1("npwtBandageWound: Before setting",_bandagedWoundsOnPart);

if (_bandagedIndex == -1) then {
    _bandagedWoundsOnPart pushBack _targetWound;
} else {
    private _wound = _bandagedWoundsOnPart select _bandagedIndex;
    private _amount = _wound select 1;
    _wound set [1, (_wound select 1) + (_targetWound select 1)];
    _targetWound = _wound;
};

// Delete open wound
_openWoundsOnPart deleteAt _targetWoundIndex;
_openWounds set [_bodyPart, _openWoundsOnPart];

// Set bandaged wound
_bandagedWounds set [_bodyPart, _bandagedWoundsOnPart];

// Update open wounds
_patient setVariable [VAR_OPEN_WOUNDS, _openWounds, true];
// Update bandaged wounds
_patient setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];
// Update blood loss
_patient call ACEFUNC(medical_status,updateWoundBloodLoss);

// Fetch updated state
_openWounds = GET_OPEN_WOUNDS(_patient);
_openWoundsOnPart = _openWounds getOrDefault [_bodyPart, []];
_bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
_bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];

// Check if wound is bandaged
private _bandaged = _targetWound in _bandagedWoundsOnPart;
private _open = _targetWound in _openWoundsOnPart;
TRACE_2("npwtBandageWound: Before return",_bandagedWounds,_openWounds);

private _return = [];
if (_bandaged && !_open) then {
    _return = _targetWound;
};

_return;
