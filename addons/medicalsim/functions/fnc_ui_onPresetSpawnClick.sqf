#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles preset spawn button click.

	Parameter(s):
		Nothing.

	Returns:
		Nothing.

	Examples:
		[] call afl_medicalsim_fnc_ui_onPresetSpawnClick;
*/

private _stretcher = [] call FUNC(ui_getSelectedStretcher);
private _presetIndex = lbCurSel IDC_PRESETS_LISTBOX;
private _presetName = lbText [IDC_PRESETS_LISTBOX, _presetIndex];

// unfocus button
ctrlSetFocus displayCtrl IDC_STRETCHERS_LISTBOX;
false call FUNC(ui_updateClearAllButton);
false call FUNC(ui_updateSpawnAllButton);

[_stretcher, _presetName] call FUNC(presetSpawn);
