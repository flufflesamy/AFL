#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles neck tourniquet effects.

	Parameter(s):
		0: Unit <OBJECT>

	Returns:
		Nothing

	Examples:
		[player] call afl_medical_fnc_handleNeckTourniquetEffects
*/

params ["_unit"];
TRACE_1("handleNeckTourniquetEffects",_unit);

// Adds per-frame handler
private _tourniquetPFH = [{
    params ["_args", "_idPFH"];
    _args params ["_unit"];
    TRACE_2("tourniquetPFH",_unit,_idPFH);

    private _neckTourniquets = ([ARR_2(_unit,"Head")] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo));

    private _airwayStatus = _unit getVariable [QKEGVAR(breathing,airwayStatus), 100];
    private _output = 0;
    private _multiplierPositive = 0;
    _multiplierPositive = KEGVAR(breathing,SpO2_MultiplyPositive);
    TRACE_1("multiplierpositive",_multiplierPositive);

    private _isAwake = _unit call ACEFUNC(common,isAwake);
    TRACE_1("isAwake",_isAwake);

    // If no neck TQ or unit is dead, exit and remove per-frame handler
    if (!(_neckTourniquets) || !(alive _unit)) exitWith {
        TRACE_2("Remove neck TQ effects",_neckTourniquets,_unit);
        _unit setVariable [QGVAR(tourniquetPFH), -1];
        _idPFH call CFUNC(removePerFrameHandler);
    };

    // If awake, reduce spo2 + conscious breathing rate
    if (_isAwake) then {
        _output = (-1 - (0.5 * _multiplierPositive));
    };

    // reduced spo2 loss when uncon.
    if !(_isAwake) then {
        _output = -0.1;
    };

    TRACE_1("tq airway output",_output);

    private _finalOutput = _airwayStatus + _output;

    if (_finalOutput > 100) then {_finalOutput = 100;};
    if (_finalOutput < 1) then {_finalOutput = 1};

    TRACE_2("Applying neck tq airway effects",_airwayStatus,_finalOutput);
    _unit setVariable [QKEGVAR(breathing,airwayStatus), _finalOutput, true];
    // [KEGVAR(breathing,handleBreathing), [_unit], _unit] call CFUNC(targetEvent);
    _unit call KEFUNC(breathing,handleBreathing);
}, 1, _unit] call CFUNC(addPerFrameHandler);

_unit setVariable [QGVAR(tourniquetPFH), _tourniquetPFH];
