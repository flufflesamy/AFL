#include "..\script_component.hpp"
/*
* The following code is a derivative work of code from the ACE project,
* which is licensed under GPLv2 or later. This code is therefore licensed
* under the terms of the GNU Public License, version 3.
*
* Author: LinkIsGrim (ace_medical_treatment_fnc_addTrauma), flufflesamy
* Local callback on NPWT treatment success.
*
* Arguments:
* 0: Patient <OBJECT>
* 1: Body Part <STRING>
*
* Return Value:
* Nothing
*
* Example:
* [player, cursorTarget, "leftArm"] call afl_medical_fnc_npwtSuccessLocal
*/
params ["_patient", "_bodyPart"];
TRACE_2("npwtSuccessLocal",_patient,_bodyPart);

// Local check
if (!_isLocal)  exitWith {ERROR_1("%1 not Local!",_this)};

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;
private _openWounds = _patient getVariable [QACEGVAR(medical,openWounds), createHashMap];
private _bodyPartDamage = _patient getVariable [QACEGVAR(medical,bodyPartDamage), [0, 0, 0, 0, 0, 0]];

// Clear wounds
TRACE_2("NPWT Clear Wounds",_partIndex,_openWounds);
_openWounds set [_bodyPart, []];
_patient setVariable [QACEGVAR(medical,openWounds), _openWounds, true];

// Get rid of trauma
_bodyPartDamage set [_partIndex, 0];
_patient setVariable [QACEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];

// Update body part visuals (ace_medical_treatment_fnc_addTrauma)
switch (_bodyPart) do {
    case "head":     { [_patient, true, false, false, false] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
    case "body":     { [_patient, false, true, false, false] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
    case "leftarm";
    case "rightarm": { [_patient, false, false, true, false] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
    default { [_patient, false, false, false, true] call ACEFUNC(medical_engine,updateBodyPartVisuals); };
};

// Update medical engine
_patient call ACEFUNC(medical_vitals,handleUnitVitals);

// Clear condition caches
private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ACEFUNC(common,isPlayer)};
TRACE_1("clearConditionCaches: npwtSuccessLocal",_nearPlayers);
[QACEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CFUNC(targetEvent);
