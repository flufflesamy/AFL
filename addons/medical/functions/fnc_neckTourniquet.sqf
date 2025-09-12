#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the KAM and ACE
 * projects, which is licensed under GPLv3. This code is therefore also licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Author: Glowbal, mharis001, flufflesamy
 * Applies a tourniquet to the patient on the given body part.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment (unused) <STRING>
 * 4: Item User (unused) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, cursorObject, "LeftLeg", "", objNull, "ACE_tourniquet"] call afl_medical_fnc_neckTourniquet
 *
 * Public: No
 */
params ["_medic", "_patient", "_bodyPart", "", "", "_usedItem"];
TRACE_2("neckTourniquet",_medic,_patient);

// Exit if there is a tourniquet already applied to body part
if ([_patient, _bodyPart] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo)) exitWith {
    ["There is already a tourniquet on this body part!", 1.5] call ACEFUNC(common,displayTextStructured); // todo: localize
};

[_patient, _usedItem] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", ACELSTRING(medical_treatment,Activity_appliedTourniquet), [[_medic, false, true] call ACEFUNC(common,getName)]] call ACEFUNC(medical_treatment,addToLog);

[QGVAR(neckTourniquetLocal), [_patient, _bodyPart], _patient] call CFUNC(targetEvent);
