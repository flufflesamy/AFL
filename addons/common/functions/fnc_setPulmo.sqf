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

private _pType = PNUMO_TYPE find toLower _type;

if (_pType == -1) exitWith {false};

switch (_pType) do
{
    // initial
    case 0:
    {
        _unit setVariable [QKGVAR(pneumothorax), 1, true];
        _unit setVariable [QKGVAR(deepPenetratingInjury), true, true];
        _unit setVariable [QKGVAR(activeChestSeal), false, true];

        [_unit, 15] call KEFUNC(breathing,handlePneumothoraxDeterioration);
    };
    // tension
    case 1:
    {
        _unit setVariable [QKGVAR(tensionpneumothorax), true, true];
        _unit setVariable [QKGVAR(pneumothorax), 4, true];
        _unit setVariable [QKGVAR(deepPenetratingInjury), true, true];
        _unit setVariable [QKGVAR(activeChestSeal), false, true];
    };
    // hemo
    case 2:
    {
        _unit setVariable [QKGVAR(hemopneumothorax), true, true];
        _unit setVariable [QKGVAR(pneumothorax), 4, true];

        [_unit] call KEFUNC(circulation,updateInternalBleeding);
    };
};

// update damage effects
_unit call ACEFUNC(medical_system,updateDamageEffects);