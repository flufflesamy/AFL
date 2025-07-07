#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Clears patient from selected stretcher.

	Parameter(s):
		Nothing.

	Returns:
		Nothing.

	Examples:
		[] call afl_medicalsim_fnc_ui_onClearClick;
*/
private _stretcher = [] call FUNC(ui_getSelectedStretcher);
TRACE_1("ui_onClearClick",_stretcher);
if (isNil "_stretcher") exitWith {ERROR_1("Stretcher %1 cannot be nil.",_stretcher)};

_stretcher call FUNC(clearPatient);
