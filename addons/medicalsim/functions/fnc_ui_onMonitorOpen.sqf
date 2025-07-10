#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles opening of patient monitor. Called from onLoad event.

	Parameter(s):
		0: Medical sim display <DISPLAY>

	Returns:
		Nothing.

	Examples:
		[DISPLAY] call afl_medicalsim_fnc_ui_onMenuOpen;
*/

params ["_display"];

private _monitor = GVAR(monitorTarget);
if (isNil "_monitor") exitWith {ERROR_1("onMonitorOpen: monitor %1 cannot be nil",_monitor)};

private _stretcher = _monitor getVariable [QGVAR(monitorStretcher), nil];
if (isNil "_stretcher") exitWith {ERROR_1("onMonitorOpen: stretcher %1 cannot be nil",_stretcher)};

private _patient = _stretcher getVariable [QGVAR(simPatient), nil];

private _monitorPFH = [{
    params ["_args", "_idPFH"];
    _args params ["_patient"];

    // Patient vitals
    private _HR = 0;
    private _SpO2 = 0;
    private _cardiac = "None";
    private _pneumo = "None";
    private _bleeding = 0;
    private _bloodVol = 0;
    private _arrestTimer = 0;
    private _systolic = 0;
    private _diastolic = 0;
    private _isAlive = true;

    if (isNil "_patient") exitWith {
        // TODO: Show Empty Stretcher.
    };

    if !(isAlive) exitWith {
        // TODO: Show patient dead;
    };


}, 1, _patient] call CFUNC(addPerFrameHandler);

_monitor setVariable [QGVAR(monitorPFH), _monitorPFH, true];
