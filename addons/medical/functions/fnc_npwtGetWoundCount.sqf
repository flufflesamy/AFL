#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the ACE project,
 * which is licensed under GPLv2 or later. This code is therefore licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Author: kymckay (ace_medical_treatment_fnc_canBandage), flufflesamy
 * Get number of NPWT treatable wounds.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * 0: Bleeding Wounds <NUMBER>
 * 1: Valid Bandaged Wounds <NUMBER>
 *
 * Example:
 * [player, "leftarm"] call afl_medical_fnc_npwtGetWoundCount
 *
 * Public: No
 */
params ["_patient", "_bodyPart"];
TRACE_2("npwtGetWoundCount",_patient,_bodyPart);

// Get total number of bandaged and open wounds
private _initialBandagedWounds = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
private _initialOpenWounds = (GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []];

private _validOpenWounds = [];
{
    _x params ["_classID", "_amountOf", "_bleeding", "_damage"];

    if ((_amountOf * _bleeding) > 0) then {
        _validOpenWounds pushBack _x;
    }
} forEach _initialOpenWounds;

private _validBandagedWounds = [];
{
    _x params ["_classID"];

    private _openIndex = _validOpenWounds findIf {
        _x params ["_openID"];
        _openID == _classID;
    };

    // Don't add to counter if wound is of the same class
    if (_openIndex == -1) then {
        _validBandagedWounds pushBack _x;
    };
} forEach _initialBandagedWounds;

private _return = [0, 0];
_return = [(count _validOpenWounds), (count _validBandagedWounds)];

_return;
