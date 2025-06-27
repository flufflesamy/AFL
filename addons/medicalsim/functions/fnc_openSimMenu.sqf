#include "..\script_component.hpp"

params ["_entity"];
TRACE_1("openSimMenu",_entity);

if (!(isNull (findDisplay IDD_MEDSIM_MENU))) exitWith {closeDialog 2;};

GVAR(menuTarget) = _entity;

private _dialog = createDialog QGVAR(RscSimMenu);

_dialog;

//createDialog ["RscDisplayName", true];
