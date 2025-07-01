#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Gets selected stretcher in menu.

	Parameter(s):
		Nothing.

	Returns:
		Stretcher <OBJECT>

	Examples:
		[] call afl_medicalsim_fnc_ui_getSelectedStretcher;
*/
TRACE_1("ui_getSelectedStretcher",IDC_STRETCHERS_LISTBOX);

// get selected item index in stretchers listbox
private _stretcherIndex = lbCurSel IDC_STRETCHERS_LISTBOX;
TRACE_1("Stretcher Index: %1",_stretcherIndex);
if (_stretcherIndex < 0) exitWith {WARNING_1("No stretcher is selected. Index = %1",_stretcherIndex)};

// // get stretcher name from listbox value
// private _stretcherName = lbData [IDC_STRETCHERS_LISTBOX, _stretcherIndex];
// TRACE_1("Stretcher object name: %1",_stretcherName);

private _stretcherArray = GVAR(menuTarget) getVariable [QGVAR(simStretchers), nil];

private _stretcher = (_stretcherArray select _stretcherIndex) select 0;
TRACE_1("Stretcher: %1",_stretcher);

_stretcher;
