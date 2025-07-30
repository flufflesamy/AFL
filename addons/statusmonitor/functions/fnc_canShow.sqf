#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Tests if status monitor can be shown.

	Parameter(s):
		None.

	Returns:
		0: Can show <BOOL>

	Examples:
		[] call afl_statusmonitor_fnc_canShow
*/
params ["_unit"];

_display = uiNamespace getVariable [QGVAR(RscStatusMonitor), displayNull];

_unit call FUNC(hasMonitor) && isNull _display;
