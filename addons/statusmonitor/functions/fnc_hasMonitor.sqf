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
// TRACE_1("hasMonitor",_unit);

private _unitItems = _unit call ACEFUNC(common,uniqueUnitItems);
private _hasMonitor = false;

{
    if (_x in _unitItems) exitWith { hasMonitor = true };
} forEach GVAR(monitorItems);

hasMonitor;
