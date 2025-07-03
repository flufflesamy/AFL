#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles preset spawn all button click.

	Parameter(s):
		Nothing.

	Returns:
		Nothing.

	Examples:
		[] call afl_medicalsim_fnc_ui_onPresetSpawnAllClick;
*/

// unfocus button
ctrlSetFocus displayCtrl IDC_STRETCHERS_LISTBOX;
false call FUNC(ui_updateClearAllButton);

if !(GVAR(spawnAllConfirm)) exitWith {
    true call FUNC(ui_updateSpawnAllButton);
};

private _presetIndex = lbCurSel IDC_PRESETS_LISTBOX;
private _presetName = lbText [IDC_PRESETS_LISTBOX, _presetIndex];
private _stretchers = GVAR(menuTarget) getVariable[QGVAR(simStretchers), []];

{
    _x params ["_stretcher", ""];

    [_stretcher, _presetName] call FUNC(presetSpawn);
} forEach _stretchers;

false call FUNC(ui_updateSpawnAllButton);
