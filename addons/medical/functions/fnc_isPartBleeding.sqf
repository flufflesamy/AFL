#include "..\script_component.hpp"
/*
    The following code is a derivative work of the code from the ACE project,
    which is licensed under GPLv2 or later. This code is therefore licensed
    under the terms of the GNU Public License, version 3.

    Original file: ACE3/addons/medical_treatment/fuctions/fnc_canBandage.sqf
	Authors: kymckay, flufflesamy

	Description:
		Checks if patient is bleeding on bodyPart.

	Parameter(s):
		0: Patient <OBJECT>
        1: Body Part <STRING>

	Returns:
		0: Is Bleeding <BOOL>

	Examples:
		[player] call afl_medical_fnc_isPartBleeding
*/
params ["_patient", "_bodyPart"];

if (isNil "_patient" || isNil "_bodyPart") exitWith {
    ERROR_2("%1 or %2 cannot be nil!",_patient,_bodyPart);
};

private _isBleeding = false;

{
    _x params ["", "_amountOf", "_bleeding"];

    if (_amountOf * _bleeding > 0) exitWith {
        _isBleeding = true;
    };
} forEach ((GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []]);

_isBleeding;
