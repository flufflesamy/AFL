#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles ace_medical_treatment_ivBagLocal event. Enables flushing IV lines with saline.

	Parameter(s):
		0: Patient <UNIT>
        1: Body part <STRING>
        2: Treatment <STRING>
        3: Medic <UNIT>
        4: Item User <UNIT>
        5: Item <STRING>

	Returns:
		Nothing

	Examples:
		[player] call afl_medical_fnc_salineFlush
*/
params ["_patient", "_bodyPart", "_treatment", "_medic", "_itemUser", "_item"];
TRACE_6("salineFlush",_patient,_bodyPart,_treatment,_medic,_itemUser,_item);

private _isEnabled = GVAR(enableFluidBlock) || (KEGVAR(pharma,blockChance) > 0);
if (!_isEnabled) exitWith {
    TRACE_1("salineFlush exiting",_isEnabled);
};

private _saline = ["SalineIV_250", "SalineIV_500", "SalineIV"];
private _isSaline = _treatment in _saline;

// Exit if IV is not saline
if (!_isSaline) exitWith {
    TRACE_1("Treatment not saline, exiting",_treatment);
};

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
private _ivArray = _patient getVariable [QKEGVAR(pharma,IV), [0,0,0,0,0,0]];
private _ivActual = _ivArray select _partIndex;

if (_ivActual == 3) then {
    TRACE_1("Flushing",_ivActual);
    [_medic, _patient, _bodyPart] call KEFUNC(pharma,treatmentAdvanced_FlushLocal);
};
