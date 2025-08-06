#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Checks if unit has monitor item.

	Parameter(s):
		None.

	Returns:
		0: Has monitor <BOOL>

	Examples:
		[] call afl_statusmonitor_fnc_hasMonitor
*/
LOG("Hiding status monitor.");

// Hide status monitor
QGVAR(statusMonitor) cutRsc ["Default", "PLAIN"];

uiNamespace setVariable [QGVAR(RscStatusMonitor), displayNull];

private _monitorPFH = uiNamespace getVariable [QGVAR(statusMonitorPFH), nil];

_monitorPFH call CFUNC(removePerFrameHandler);
uiNamespace setVariable [QGVAR(statusMonitorPFH), -1];
