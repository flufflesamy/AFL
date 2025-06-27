#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		Handles opening of medical sim menu. Called from onLoad event.

	Parameter(s):
		0: Medical sim display <DISPLAY>

	Returns:
		Nothing.

	Examples:
		[DISPLAY] call afl_medicalsim_fnc_onMenuOpen;
*/

params ["_display"];
TRACE_1("onMenuOpen",_display);

uiNamespace setVariable [QGVAR(RscSimMenu), _display];
