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

private _unitItems = uniqueUnitItems [_unit];
private _hasMonitor = false;
private _monitorItems = GVAR(monitorItems);

{
    if (_x in _unitItems) exitWith { _hasMonitor = true };
} forEach _monitorItems;

_hasMonitor;
