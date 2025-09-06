#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Local callback for NPWT stitch event.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * 0: Can NPWT <BOOL>
 *
 * Example:
 * [player, cursorTarget, "leftArm"] call afl_medical_fnc_npwtCan
 */
params ["_patient", "_bodyPart"];

if (!local _patient) exitWith {ERROR_1("%1 not Local!",_this)};

private _stitched = [_patient, _bodyPart] call ACEFUNC(medical_treatment,stitchWound);

if (!_stitched) then {
    ERROR_1("%1 stitching failed! %1",_this);
};

// Clear condition caches
private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ACEFUNC(common,isPlayer)};
TRACE_1("clearConditionCaches: npwtStitchLocal",_nearPlayers);
[QACEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CFUNC(targetEvent);
