#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Calculate IV flow rate based on fluid type and blood pressure

	Parameter(s):
		0: Blood Pressure in mmHg <ARRAY>
        1: Bodypart Index <NUMBER>
        2: Fluid Type <STRING>

	Returns:
		0: Volumetric flow rate in mL/s <NUMBER>

	Examples:
		[player] call afl_medical_fnc_handleNeckTourniquetEffects
*/
#define IV_MAX_FLOW (180 / 60) // 180 ml/min
#define IO_MAX_FLOW (80 / 60) // 80 ml/min
#define SALINE_COEF 1
#define PLASMA_COEF 0.85
#define BLOOD_COEF 0.5

params ["_bloodPressure", "_bodyPart", "_fluidType"];
TRACE_3("getIVFlowRate",_bloodPressure,_bodyPart,_fluidType);
_bloodPressure params ["_systolic", "_diastolic"]; // Separate BP into its components

private _map = ((2 * (_diastolic max 1) + (_systolic max 1)) / 3); // Calulate mean arterial pressure
private _coefBloodPressure = -0.01 * _map + 1.93 max 0; // Calculate blood pressure coefficient

private _coefFluidType = 0;
private _maxFlow = 0;

// Set fluid type coefficient depending on fluid
switch (true) do {
    case (_fluidType == "Saline"): {
        _coefFluidType = SALINE_COEF;
    };
    case (_fluidType == "Plasma"): {
        _coefFluidType = PLASMA_COEF;
    };
    case (_fluidType == "Blood"): {
        _coefFluidType = BLOOD_COEF;
    };
};

switch (true) do {
    case (_bodyPart == 2): {
        _maxFlow = IO_MAX_FLOW;
    };
    default {
        _maxFlow = IV_MAX_FLOW;
    };
};

private _flowRate = (_maxFlow * _coefFluidType * _coefBloodPressure) min _maxFlow;

_flowRate
