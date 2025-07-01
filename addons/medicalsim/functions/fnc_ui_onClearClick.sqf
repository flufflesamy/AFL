#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles opening of medical sim menu. Called from onLoad event.

	Parameter(s):
		Nothing.

	Returns:
		Nothing.

	Examples:
		[] call afl_medicalsim_fnc_ui_onSpawnClick;
*/
private _stretcher = [] call FUNC(ui_getSelectedStretcher);
TRACE_1("ui_onClearClick",_stretcher);
if (isNil "_stretcher") exitWith {ERROR_1("Stretcher %1 cannot be nil.",_stretcher)};

_stretcher call FUNC(clearPatient);
