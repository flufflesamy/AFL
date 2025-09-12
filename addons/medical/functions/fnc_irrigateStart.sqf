#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Callback on start of irrigate treatment.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorTarget, "leftArm"] call afl_medical_fnc_irrgateStart
 *
 * Public: No
 */
params ["_medic", "_patient", "_bodyPart"];
TRACE_3("npwtStart",_medic,_patient,_bodyPart);

private _consumed = false;
// Consume saline
switch (true) do {
    case ([_medic, "ACE_salineIV_250"] call EFUNC(misc,hasItem)): {
        _consumed = [_medic, "ACE_salineIV_250"] call FUNC(consumeFluid);
    };
    case ([_medic, "ACE_salineIV_500"] call EFUNC(misc,hasItem)): {
        _consumed = [_medic, "ACE_salineIV_500"] call FUNC(consumeFluid);
    };
    case ([_medic, "ACE_salineIV"] call EFUNC(misc,hasItem)): {
        _consumed = [_medic, "ACE_salineIV"] call FUNC(consumeFluid);
    };
};

// If fluid not consumed, write error to log
if (!_consumed) then {
    ERROR_1("irrigateStart: Fluid cannot be consumed. Params=%1",_this);
};

// // Add action to log
// [_patient, "Irrigate fracture"] call ACEFUNC(medical_treatment,addToTriageCard);
// [_patient, "activity", LLSTRING(Activity_usedIrrigate), [[_medic, false, true] call ACEFUNC(common,getName)]] call ACEFUNC(medical_treatment,addToLog);
