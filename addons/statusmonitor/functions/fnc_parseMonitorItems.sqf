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

private _configBase = configFile >> "CfgWeapons";

GVAR(monitorItems) = [];

{
    private _entry = _x;
    private _className = configName _entry;

    private _isMonitor = GET_NUMBER(_entry >> "AFL_isMonitor",0);
    // TRACE_3("configProperties",_entry,_className,_isMonitor);

    if (_isMonitor == 1) then {
        GVAR(monitorItems) pushBack _className;
    };
} forEach configProperties [_configBase, "isClass _x"];
