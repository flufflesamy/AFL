#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Updates color and text of clear all button.

	Parameter(s):
		0: isConfirmed <BOOL>

	Returns:
		Nothing.

	Examples:
		[true] call afl_medicalsim_fnc_ui_updateClearAllButton
*/
params ["_isConfirmed"];

private _control = displayCtrl IDC_CLEARALL_BUTTON;

private _confirmColor = [
    (profileNamespace getVariable ["GUI_BCG_RGB_R",0.13]),
    (profileNamespace getVariable ["GUI_BCG_RGB_G",0.54]),
    (profileNamespace getVariable ["GUI_BCG_RGB_B",0.21]),
    (profileNamespace getVariable ["GUI_BCG_RGB_A",0.8])
];

private _confirmTextColor = [
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_R",1.0]),
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_G",1.0]),
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_B",1.0]),
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_A",0.6])
];

private _backgroundColor = [0, 0, 0, 0.8];
private _textColor = [1, 1, 1, 1];

// If button has not been pressed once already
if (!(_isConfirmed)) then {
    _control ctrlSetBackgroundColor _backgroundColor;
    _control ctrlSetTextColor _textColor;
    _control ctrlSetText "CLEAR ALL";
    GVAR(clearAllConfirm) = false;
};

if ((_isConfirmed)) then {
    _control ctrlSetBackgroundColor _confirmColor;
    _control ctrlSetTextColor _confirmTextColor;
    _control ctrlSetText "CONFIRM?";
    GVAR(clearAllConfirm) = true;
};
