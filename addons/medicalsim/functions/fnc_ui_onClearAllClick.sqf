#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles clear all button click event. Clears all patients from stretchers.

	Parameter(s):
		0: Control <CONTROL>

	Returns:
		Nothing

	Examples:
		[] call afl_medicalsim_fnc_ui_onClearAllClick;
*/
params ["_control"];
TRACE_1("ui_onClearAllClick",GVAR(menuTarget));

ctrlSetFocus displayCtrl IDC_STRETCHERS_LISTBOX;

if !(GVAR(clearAllConfirm)) exitWith {
    true call FUNC(ui_updateClearAllButton);
};

private _stretchers = GVAR(menuTarget) getVariable[QGVAR(simStretchers), []];

{
    TRACE_1("Clearing stretcher",_x);
    _x call FUNC(clearPatient);
} forEach _stretchers;

TRACE_1("Stretchers cleared",_stretchers);

[false] call FUNC(ui_updateClearAllButton);
