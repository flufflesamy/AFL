#include "..\script_component.hpp"
/*
	Author: flufflesamy

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
TRACE_1("ui_onMonitorClose",_display);

private _monitor = GVAR(monitorTarget);
private _monitorPFH = _monitor getVariable [QGVAR(monitorPFH), nil];

_monitor setVariable [QGVAR(monitorPFH), nil];
_monitorPFH call CFUNC(removePerFrameHandler);
