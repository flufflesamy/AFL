#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles showing low spo2 visual to neck TQ victims

	Parameter(s):
		0: Enable effect <BOOL>

	Returns:
		Nothing

	Examples:
		true call afl_medical_fnc_neckTourniquetVisual
*/
params ["_enable"];
TRACE_1("neckTourniquetVisual",_enable);

if (!_isLocal)  exitWith {ERROR_1("%1 not Local!",_this)};

[_enable, 1] call KEFUNC(feedback,effectLowSpO2);
