#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles opening of medical sim menu. Called from onLoad event.

	Parameter(s):
		0: Medical sim display <DISPLAY>

	Returns:
		Nothing.

	Examples:
		[DISPLAY] call afl_medicalsim_fnc_ui_onMenuOpen;
*/

params ["_display"];
TRACE_1("ui_onMenuOpen",_display);

private _sliderArray = MEDSIM_SLIDER_ARRAY;
GVAR(sliderMap) = createHashMapFromArray _sliderArray;

uiNamespace setVariable [QGVAR(RscSimMenu), _display];

// populate listbox
private _stretchersArray = GVAR(menuTarget) getVariable [QGVAR(simStretchers), []];
private _stretchersListBox = _display displayCtrl IDC_STRETCHERS_LISTBOX;

{
    _x params ["_stretcher", "_displayName"];

    private _index = _stretchersListBox lbAdd _displayName;
    _stretchersListBox lbSetData [_index, QUOTE(_stretcher)];
} forEach _stretchersArray;

_stretchersListBox lbSetCurSel 0;
ctrlSetFocus displayCtrl IDC_SPAWN_BUTTON;

// Populate presets
private _presetArray = GVAR(simPresetNames);
private _presetListBox = _display displayCtrl IDC_PRESETS_LISTBOX;
_presetListBox lbSetCurSel 0;

{
    _presetListBox lbAdd _x;
} forEach _presetArray;

// add eventhandlers for sliders
{
    _x params ["_idc_slider", "_idc_val"];

    private _slider = _display displayCtrl _idc_slider;
    private _val = _display displayCtrl _idc_val;

    _val ctrlSetText ((sliderPosition _slider) toFixed 0);

    _slider ctrlAddEventHandler ["SliderPosChanged", {
        [_this select 0, _this select 1] call FUNC(ui_onSliderPosChanged);
    }];
} forEach _sliderArray;

// Set button colors
GVAR(confirmColor) = [
    (profileNamespace getVariable ["GUI_BCG_RGB_R",0.13]),
    (profileNamespace getVariable ["GUI_BCG_RGB_G",0.54]),
    (profileNamespace getVariable ["GUI_BCG_RGB_B",0.21]),
    (profileNamespace getVariable ["GUI_BCG_RGB_A",0.8])
];

GVAR(confirmTextColor) = [
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_R",1.0]),
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_G",1.0]),
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_B",1.0]),
    (profileNamespace getVariable ["GUI_TITLETEXT_RGB_A",0.6])
];

// Init clear button variable
GVAR(clearAllConfirm) = false;
GVAR(spawnAllConfirm) = false;
