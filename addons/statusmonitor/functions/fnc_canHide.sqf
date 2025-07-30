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
params ["_unit"];

_display = uiNamespace getVariable [QGVAR(RscStatusMonitor), displayNull];

_unit call FUNC(hasMonitor) && !isNull _display;
