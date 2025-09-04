#include "..\script_component.hpp"
/*
* The following code is a derivative work of the code from the ACE project,
* which is licensed under GPLv2 or later. This code is therefore licensed
* under the terms of the GNU Public License, version 3.
*
* Author: kymckay (ace_medical_treatment_fnc_canBandage), flufflesamy
* Checks if patient is bleeding on bodyPart.
*
* Arguments:
* 0: Patient <OBJECT>
* 1: Body Part <STRING>
*
* Return Value:
* 0: Is Bleeding <BOOL>
*
* Example:
* [player, "leftarm"] call afl_medical_fnc_isPartBleeding
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
