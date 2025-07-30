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
LOG("ui_onMonitorHide");
// clean up
uiNamespace setVariable [QGVAR(RscStatusMonitor), displayNull];

private _monitorPFH = uiNamespace getVariable [QGVAR(statusMonitorPFH), nil];

if (!isNil "_monitorPFH") then {
    uiNamespace setVariable [QGVAR(statusMonitorPFH), -1];
    _monitorPFH call CFUNC(removePerFrameHandler);
};
