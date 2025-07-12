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

// add eventhandlers for sliders
{
    _x params ["_idc_slider", "_idc_val"];
    TRACE_2("forEach _sliderArray",_idc_slider,_idc_val);

    private _slider = _display displayCtrl _idc_slider;
    private _val = _display displayCtrl _idc_val;

    _val ctrlSetText ((sliderPosition _slider) toFixed 0);

    _slider ctrlAddEventHandler ["SliderPosChanged", {
        [_this select 0, _this select 1] call FUNC(ui_onSliderPosChanged);
    }];
} forEach _sliderArray;

// Init clear button variable
GVAR(clearAllConfirm) = false;
