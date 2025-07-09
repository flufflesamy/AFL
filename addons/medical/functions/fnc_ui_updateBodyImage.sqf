#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Updates body image for target and adds neck TQ image.

	Parameter(s):
		0: Body image controls group <CONTROL>
        1: Target <OBJECT>

	Returns:
		Nothing

	Examples:
		[CONTROL, _Target, 0] call afl_medical_fnc_updateBodyImage
*/

params ["_ctrlGroup", "_target"];
// TRACE_2("ui_updateBodyImage",_ctrlGroup,_target);

private _neckTourniquets = ([ARR_2(_target,"Head")] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo));
private _tqControl = _ctrlGroup controlsGroupCtrl IDC_BODY_HEAD_T;
// TRACE_2("neckTQControl",_neckTourniquets,_tqControl);

_tqControl ctrlShow _neckTourniquets;
