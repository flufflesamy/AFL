#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Consumes fluid and gives unit lower fluid value. If lowest value, delete item.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fluid <STRING>
 *
 * Return Value:
 * 0: Success <BOOL>
 *
 * Example:
 * [player, cursorTarget, "leftarm"] call afl_medical_fnc_irrigateCan
 */
params ["_unit", "_fluid"];
TRACE_2("consumeFluid",_unit,_fluid);

// Error Handling //

// Locality check
if (!local _unit) exitWith {
    ERROR_1("consumeFluid: Unit %1 must be local.",_unit);
    false;
};

// Fluid check
if !([GVAR(consumeFluidHash), _fluid] call CFUNC(hashHasKey)) exitWith {
    ERROR_1("consumeFluid: %1 must be a valid fluid.",_fluid);
    false;
};

// Item exists in inventory check
if !([_unit, _fluid] call EFUNC(misc,hasItem)) exitWith {
    ERROR_2("consumeFluid: Unit %1 must have fluid %2.",_unit,_fluid);
    false;
};

// Function Logic //

private _success = false;
private _resultItemArray = [GVAR(consumeFluidHash), _fluid] call CFUNC(hashGet);

// Remove original item
private _removed = [_unit, _fluid] call CFUNC(removeItem);
// Check if removed
if (!_removed) exitWith {
    ERROR_2("consumeFluid: Fluid %1 cannot be removed from unit %2.",_fluid,_unit);
    false;
};

private _err = false;
// Add lower quantity fluids
if (_resultItemArray isNotEqualTo []) then {
    {
        private _added = [_unit, _x, true] call CFUNC(addItem);
        if (!_added) exitWith { _err = true };
    } forEach _resultItemArray;
};

if (_err) exitWith {
    ERROR_2("consumeFluid: Fluid %1 cannot be added to unit %2.",_resultItemArray,_unit);
    false;
};

true;
