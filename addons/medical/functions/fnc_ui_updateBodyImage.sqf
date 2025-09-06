#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Updates body image for target and adds neck TQ image.
 *
 * Arguments:
 * 0: Body Image Controls Group <CONTROL>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [controlNull, player] call afl_medical_fnc_updateBodyImage
 */
params ["_ctrlGroup", "_target"];

private _neckTourniquets = ([ARR_2(_target,"Head")] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo));
private _tqControl = _ctrlGroup controlsGroupCtrl IDC_BODY_HEAD_T;

_tqControl ctrlShow _neckTourniquets;
