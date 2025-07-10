#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Adds a medical sim menu to an eden entity.

	Parameter(s):
		0: Eden entity <OBJECT>
        1: Stretcher assigned to monitor <OBJECT>

	Returns:
		Nothing

	Examples:
		[fr_medicalConsole, [[fr_stretcher_0, "Stretcher A"], [fr_stretcher_1, "Stretcher B"]] call afl_medicalsim_fnc_addSimMenu;
*/

params ["_entity", "_stretcher"];
TRACE_2("addSimMenu",_entity,_stretcher);

_entity setVariable [QGVAR(monitorStretcher), _stretcher, true];

_entity addAction [
    "Open Simulator Menu",
    {
        _this select 3 call FUNC(openMonitor);
    },
    _entity,
    1.5,
    true,
    true,
    "",
    "true",
    5,
    false,
    "",
    ""
];
