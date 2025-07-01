#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles clear all button click event. Clears all patients from stretchers.

	Parameter(s):
		Nothing

	Returns:
		Nothing

	Examples:
		[] call afl_medicalsim_fnc_ui_onClearAllClick;
*/
TRACE_1("ui_onClearAllClick",GVAR(menuTarget));

private _stretchers = GVAR(menuTarget) getVariable[QGVAR(simStretchers), []];

{
    TRACE_1("Clearing stretcher",_x);
    _x call FUNC(clearPatient);
} forEach _stretchers;

TRACE_1("Stretchers cleared",_stretchers)
