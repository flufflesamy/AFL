#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the KAM project,
 * which is licensed under GPLv3. This code is therefore also licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Author: Glowbal, mharis001, Edited by flufflesamy
 * Applies a tourniquet to the patient on the given body part.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment (not used) <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "LeftLeg", "", objNull, "ACE_tourniquet"] call afl_medical_fnc_neckTourniquet
 */

params ["_medic", "_patient", "_bodyPart", "", "", "_usedItem"];

[_patient, _usedItem] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", ACELSTRING(medical_treatment,Activity_appliedTourniquet), [[_medic, false, true] call ACEFUNC(common,getName)]] call ACEFUNC(medical_treatment,addToLog);

[QGVAR(headTourniquetLocal), [_patient, _bodyPart], _patient] call CFUNC(targetEvent);
