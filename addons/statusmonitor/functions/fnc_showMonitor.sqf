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

QGVAR(statusMonitor) cutRsc [QGVAR(RscStatusMonitor), "PLAIN"];
