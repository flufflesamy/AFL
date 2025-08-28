#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Callback for npwt treatment start

	Parameter(s):
		0: Enable effect <BOOL>

	Returns:
		Nothing

	Examples:
		true call afl_medical_fnc_neckTourniquetVisual
*/
params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem", "_createLitter"];

// Initialize counters
_medic setVariable [QGVAR(treatmentInterval), 0, false];
_medic setVariable [QGVAR(treatmentCounter), 0, false];
