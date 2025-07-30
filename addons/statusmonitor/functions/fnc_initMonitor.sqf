#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Initializes monitor.

	Parameter(s):
        Nothing

	Returns:
        Nothing

	Examples:
		[] call afl_statusmonitor_fnc_canShow
*/
params ["_display"];

private _entriesGroup = _display displayCtrl IDC_ENTRIES_CG;

// Set dimensions
_entriesGroup ctrlSetPosition [IGUI_GRID_CUSTOMINFOLEFT_X, IGUI_GRID_CUSTOMINFOLEFT_Y, IGUI_GRID_CUSTOMINFO_WAbs, (IGUI_GRID_CUSTOMINFO_HAbs + POS_H(1))];

// Commit changes
_entriesGroup ctrlCommit 0;
