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

_control = displayCtrl IDC_PRESET_SPAWNALL_BUTTON;

// If button has not been pressed once already
if (!(_isConfirmed)) then {
    _control ctrlSetBackgroundColor COLOR_BUTTON_BKGD;
    _control ctrlSetTextColor COLOR_BUTTON_TEXT;
    _control ctrlSetText "SPAWN ALL";
    GVAR(spawnAllConfirm) = false;
};

if ((_isConfirmed)) then {
    _control ctrlSetBackgroundColor GVAR(confirmColor);
    _control ctrlSetTextColor GVAR(confirmTextColor);
    _control ctrlSetText "CONFIRM?";
    GVAR(spawnAllConfirm) = true;
};
