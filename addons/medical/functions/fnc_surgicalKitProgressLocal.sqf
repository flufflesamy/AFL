#include "..\script_component.hpp"
/*
 * Authors: flufflesamy
 * In progress local callback for surgical kit.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, player, "leftarm"] call afl_medical_fnc_surgicalKitProgressLocal
 *
 * Public: No
 */
params ["_patient", "_bodyPart"];

// Local check
if (!local _patient) exitWith { ERROR_1("%1 not Local!",_this); };

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];

// Progress check
if (_bandagedWoundsOnPart isEqualTo []) exitWith {
    ERROR_2("surgicalKitProgressLocal: Nothing to process. Params=%1, Bandaged=%2",_this,_bandagedWoundsOnPart);
};

// Select first wound
private _targetWound = _bandagedWoundsOnPart select 0;

// Stitch wound
private _success = false;
_success = [_patient, _bodyPart, _targetWound] call FUNC(npwtStitchWound);
if (!_success || isNil("_success")) exitWith {
    ERROR_2("surgicalKitProgressLocal: Cannot stitch wound. Target Wound=%1, Wounds=%2",_bandagedWound,_bandagedWoundsOnPart);
};

INFO_3("surgicalKitProgressLocal: Treated bandaged wound. Params=%1, Target Wound=%2, Stitched=%3",_this,_bandagedWound,_success);

// Clear condition caches
private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ACEFUNC(common,isPlayer)};
TRACE_1("clearConditionCaches: npwtProgressLocal",_nearPlayers);
[QACEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CFUNC(targetEvent);
