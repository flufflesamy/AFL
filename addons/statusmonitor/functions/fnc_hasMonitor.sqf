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
    _x params ["_itemName", "_type"];

    if (_itemName in _unitItems) then {
        _hasMonitor = true;

        // If CM version of monitor, end loop
        if (_type == 1) exitWith {
            _unit setVariable [QGVAR(monitorType), _type, false];
        };

        _unit setVariable [QGVAR(monitorType), _type, false];
    };

} forEach _monitorItems;

_hasMonitor;
