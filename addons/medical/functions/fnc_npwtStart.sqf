#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Callback for npwt treatment start

	Parameter(s):
		0: Medic <OBJECT>

	Returns:
		Nothing

	Examples:
		player call afl_medical_fnc_npwtStart
*/
params ["_medic", "_patient", "_bodyPart"];
TRACE_3("npwtStart",_medic,_patient,_bodyPart);

// Get total number of bandaged and open wounds
private _initialBandagedWounds = (GET_BANDAGED_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
private _initialOpenWounds = (GET_OPEN_WOUNDS(_patient)) getOrDefault [_bodyPart, []];
TRACE_1("initialOpenWounds",_initialOpenWounds);

// Remove non-bleeding wounds and stitched wounds from array
{
    _x params ["_woundID","_openAmount","_bleedingCoef","_woundDamage"];

    if (_bleedingCoef == 0 || _openAmount == 0) then {
        _initialOpenWounds deleteAt _forEachIndex;
    };
} forEachReversed _initialOpenWounds;

private _initialWoundsCount = (count _initialBandagedWounds) + (count _initialOpenWounds);
TRACE_3("npwtStartGet",_initialBandagedWounds,_initialOpenWounds,_initialWoundsCount);

// Initialize variables
_medic setVariable [QGVAR(treatmentCounter), 0, false];
_medic setVariable [QGVAR(initialWoundsCount), _initialWoundsCount, false];
