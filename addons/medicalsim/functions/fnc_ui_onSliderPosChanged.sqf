#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles slider position changes and updates editbox value.

	Parameter(s):
		0: Slider <CONTROL>
        1: New value of slider <NUMBER>

	Returns:
		Nothing.

	Examples:
		[slider1, 10] call afl_medicalsim_fnc_ui_onSliderPosChanged;
*/

params ["_slider", "_newValue"];
TRACE_2("onSliderPosChanged",_slider,_newValue);

private _idc_slider = ctrlIDC _slider;
private _idc_val = GVAR(sliderMap) get _idc_slider;
private _val = displayCtrl _idc_val;

_val ctrlSetText (_newValue toFixed 0);

_slider;
