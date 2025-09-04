#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the ACE project,
 * which is licensed under GPLv2 or later. This code is therefore licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Author: Glowbal, flufflesamy
 * Local callback for applying a tourniquet to a patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "LeftLeg"] call afl_medical_fnc_neckTourniquetLocal
 */
params ["_patient", "_bodyPart"];
TRACE_2("neckTourniquetLocal",_patient,_bodyPart);

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

private _tourniquets = GET_TOURNIQUETS(_patient);
_tourniquets set [_partIndex, CBA_missionTime];
_patient setVariable [VAR_TOURNIQUET, _tourniquets, true];

// Apply rope burn to head
[_patient, [[0.2, "Head"]], "ropeburn"] call ACEFUNC(medical_damage,woundsHandlerBase);

[_patient] call ACEFUNC(medical_status,updateWoundBloodLoss);

private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ACEFUNC(common,isPlayer)};
TRACE_1("clearConditionCaches: tourniquetLocal",_nearPlayers);
[QACEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CFUNC(targetEvent);
