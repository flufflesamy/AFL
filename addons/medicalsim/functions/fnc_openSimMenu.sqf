#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Opens medical sim menu.

	Parameter(s):
		0: Entity menu is opened from. <OBJECT>

	Returns:
		0: Medical sim dialog. <DIALOG>

	Examples:
		[_entity] call afl_medicalsim_fnc_openSimMenu;
*/

params ["_entity"];
TRACE_1("openSimMenu",_entity);

if (!(isNull (findDisplay IDD_MEDSIM_MENU))) exitWith {
    ERROR_1("Medical sim for %1 is already open",_entity);
    closeDialog 2;
};

GVAR(menuTarget) = _entity;

private _dialog = createDialog QGVAR(RscSimMenu);

_dialog;
