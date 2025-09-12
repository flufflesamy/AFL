#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the KAM and ACE projects,
 * which is licensed under GPLv3. This code is therefore also licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Authors: Glowbal, flufflesamy
 * Local function for NPWT wound stitching. Should only be called by npwtProgressLocal.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Wound Array <ARRAY>
 *
 * Return Value:
 * 0: Success <BOOL>
 *
 * Example:
 * [player, "leftarm", []] call afl_medical_fnc_nwptStitchWound
 */
params ["_patient", "_bodyPart", "_targetWound"];
TRACE_3("npwtStitchWound",_patient,_bodyPart,_targetWound);

// Local check
if (!local _patient) exitWith {
    ERROR_1("%1 not Local!",_this);
    false;
};

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];
private _stitchedWounds = GET_STITCHED_WOUNDS(_patient);
private _stitchedWoundsOnPart = _stitchedWounds getOrDefault [_bodyPart, []];

if (_targetWound isEqualTo []) exitWith {
    ERROR_1("npwtStitchWound: Target wound must exist. Params=%1",_this);
    false;
};

if (_bandagedWoundsOnPart isEqualTo []) exitWith {
    ERROR_2("npwtStitchWound: Bandaged wounds array cannot be empty. bandagedWounds=%1, bandagedWoundsOnPart=%2",_bandagedWounds,_bandagedWoundsOnPart);
    false;
};

if (!(_targetWound in _bandagedWoundsOnPart)) exitWith {
    ERROR_2("npwtStitchWound: Target wound must be in bandaged wound array. Target Wound=%1, Wounds=%2",_targetWound,_bandagedWoundsOnPart);
    false;
};

private _bandagedWoundIndex = _bandagedWoundsOnPart find _targetWound;

private _stitchedIndex = _stitchedWoundsOnPart findIf {
    _x params ["_stitchedID"];
    _stitchedID == _targetWound select 0;
};

TRACE_2("npwtStitchWound: Before setting",_bandagedWoundsOnPart,_stitchedWoundsOnPart);

if (_stitchedIndex == -1) then {
    _stitchedWoundsOnPart pushBack _targetWound;
} else {
    private _wound = _stitchedWoundsOnPart select _stitchedIndex;
    _wound set [1, (_wound select 1) + (_targetWound select 1)];
    _targetWound = _wound;
};

// Delete wound
_stitchedWounds set [_bodyPart, _stitchedWoundsOnPart];
_bandagedWoundsOnPart deleteAt _bandagedWoundIndex;
_bandagedWounds set [_bodyPart, _bandagedWoundsOnPart];

// Set variables
_patient setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];
_patient setVariable [VAR_STITCHED_WOUNDS, _stitchedWounds, true];

// Remove Trauma
private _targetWoundTrauma = _targetWound select 3;
private _targetWoundAmount = _targetWound select 2;
[_patient, _bodyPart, -(_targetWoundTrauma * _targetWoundAmount)] call ACEFUNC(medical,addTrauma);

// Fetch updated state
_bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
_bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];
_stitchedWounds = GET_STITCHED_WOUNDS(_patient);
_stitchedWoundsOnPart = _stitchedWounds getOrDefault [_bodyPart, []];

// Check if wound is stitched
private _bandaged = _targetWound in _bandagedWoundsOnPart;
private _stitched = _targetWound in _stitchedWoundsOnPart;

TRACE_2("npwtStitchWound: Before return",_bandagedWoundsOnPart,_stitchedWoundsOnPart);

private _return = false;
if (_stitched && !_bandaged) then {
    _return = true;
};

_return;
