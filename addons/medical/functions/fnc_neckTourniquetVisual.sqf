#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles neck tourniquet effects.

	Parameter(s):
		0: Unit <OBJECT>

	Returns:
		Nothing

	Examples:
		[player] call afl_medical_fnc_neckTourniquetEffects
*/
params ["_enable"];
TRACE_1("neckTourniquetVisual",_enable);

if (!_isLocal)  exitWith {ERROR_1("%1 not Local!",_this)};

[_enable, 1] call KEFUNC(feedback,effectLowSpO2);
