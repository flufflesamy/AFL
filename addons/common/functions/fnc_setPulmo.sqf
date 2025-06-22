#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		Adds pneumothorax for a unit.

	Parameter(s):
		0: Unit <OBJECT>
        1: Pnumothorax type <STRING>

	Returns:
		<BOOL>

	Examples:
		[player, "tension"] call amy_firingRange_fnc_setPulmo;
*/

params ["_unit", "_type"];
TRACE_2("setPulmo",_unit,_type);

private _pType = PNUMO_TYPE find toLower _type;

if (_pType == -1) exitWith {
    ERROR_1("Invalid pneumothorax type %1",_type);
    false;
};

switch (_pType) do
{
    // initial
    case 0:
    {
        //set pain
        [_unit, 0.2] call ACEFUNC(medical_status,adjustPainLevel);

        // add breathing sound
        _unit setVariable [QKEGVAR(breathing,pneumothorax), 1, true];
        _unit setVariable [QKEGVAR(breathing,deepPenetratingInjury), true, true];
        _unit setVariable [QKEGVAR(breathing,activeChestSeal), false, true];

        // deteriorate after delay
        [_unit, 0] call KEFUNC(breathing,handlePneumothoraxDeterioration);
    };
    // tension
    case 1:
    {
        _unit setVariable [QKEGVAR(breathing,tensionpneumothorax), true, true];
        _unit setVariable [QKEGVAR(breathing,pneumothorax), 4, true];
        _unit setVariable [QKEGVAR(breathing,deepPenetratingInjury), true, true];
        _unit setVariable [QKEGVAR(breathing,activeChestSeal), false, true];

        [_unit, 0] call KEFUNC(breathing,handlePneumothoraxDeterioration);
    };
    // hemo
    case 2:
    {
        _unit setVariable [QKEGVAR(breathing,hemopneumothorax), true, true];
        _unit setVariable [QKEGVAR(breathing,pneumothorax), 4, true];

        [_unit] call KEFUNC(circulation,updateInternalBleeding);
    };
};
