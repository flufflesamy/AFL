#include "..\script_component.hpp"

params ["_patient"];

//set pain
[_unit, 0.2] call ACEFUNC(medical_status,adjustPainLevel);

// add breathing sound
_unit setVariable [QKEGVAR(breathing,pneumothorax), 1, true];
_unit setVariable [QKEGVAR(breathing,deepPenetratingInjury), true, true];
_unit setVariable [QKEGVAR(breathing,activeChestSeal), false, true];

// deteriorate after delay
[_unit, 15] call KEFUNC(breathing,handlePneumothoraxDeterioration);
