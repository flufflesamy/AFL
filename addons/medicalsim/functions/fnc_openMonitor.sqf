#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Opens patient monitor.

	Parameter(s):
		0: Entity menu is opened from. <OBJECT>

	Returns:
		0: Patient monitor dialog <DIALOG>

	Examples:
		[_entity] call afl_medicalsim_fnc_openSimMenu;
*/

params ["_entity"];
TRACE_1("openMonitor",_entity);

if (!(isNull (findDisplay IDD_PATIENT_MONITOR))) exitWith {
    ERROR_1("Medical sim for %1 is already open",_entity);
    closeDialog 2;
};

GVAR(monitorTarget) = _entity;

private _dialog = createDialog QGVAR(RscPatientMonitor);

_dialog;
