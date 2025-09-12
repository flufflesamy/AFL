#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Checks if medic irrigate wound
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * 0: Can Irrigate <BOOL>
 *
 * Example:
 * [player, cursorTarget, "leftarm"] call afl_medical_fnc_irrigateCan
 */
#define SALINE_BAGS ["ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250"]

params ["_medic", "_patient", "_bodyPart"];

private _hasItem = false;
{
    if ([_medic, _x] call EFUNC(misc,hasItem)) exitWith {
        _hasItem = true;
    };
} forEach SALINE_BAGS;

private _baseCheck = [_medic, _patient, _bodyPart, 2.3] call KEFUNC(surgery,openReductionCheck);

private _canIrrigate = _baseCheck && _hasItem;

_canIrrigate;
