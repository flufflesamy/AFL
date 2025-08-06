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
params ["_display"];
TRACE_1("ui_onMonitorShow",_display);

uiNamespace setVariable [QGVAR(RscStatusMonitor), _display];
uiNamespace setVariable [QGVAR(createdEntries), []];
_display call FUNC(initMonitor);

private _monitorPFH = [{
    params ["_args", "_idPFH"];
    _args params ["_monitorDisplay"];

    // Remove PFH if display does not exist
    if (isNil "_monitorDisplay" || isNull _monitorDisplay) exitWith {
        LOG("Removing monitor PFH.");
        _idPFH call CFUNC(removePerFrameHandler);
        uiNamespace setVariable [QGVAR(statusMonitorPFH), -1];
    };

    // Close display if player removes monitor item
    if (!(player call FUNC(hasMonitor))) exitWith {

        [] call FUNC(hideMonitor);
    };

    private _groupUnits = units player; // get player group
    private _updateUnits = [];

    {
        private _unit = _x;

        private _unitStatus = _unit call FUNC(getUnitStatus);

        _updateUnits pushBack _unitStatus;
    } forEach _groupUnits;
    TRACE_1("updateUnits",_updateUnits);

    [_monitorDisplay, _updateUnits] call FUNC(ui_updateMonitor);
}, GVAR(updateInterval), _display] call CFUNC(addPerFrameHandler);

uiNamespace setVariable [QGVAR(statusMonitorPFH), _monitorPFH];
