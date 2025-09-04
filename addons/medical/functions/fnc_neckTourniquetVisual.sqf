#include "..\script_component.hpp"
/*
* Author: flufflesamy
* Shows low SpO2 visual to player.
*
* Arguments:
* 0: Enable Effect <BOOL>
*
* Return Value:
* Nothing
*
* Example:
* [true] call afl_medical_fnc_neckTourniquetVisual
*/
params ["_enable"];
TRACE_1("neckTourniquetVisual",_enable);

if (!_isLocal)  exitWith {ERROR_1("%1 not Local!",_this)};

[_enable, 1] call KEFUNC(feedback,effectLowSpO2);
