#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Checks if a vehicle is destroyed.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * 0: Is Destroyed <BOOL>
 *
 * Example:
 * [_veh] call afl_misc_fnc_isDestroyed
 *
 * Public: Yes
 */
params ["_veh"];
TRACE_1("isDestroyed",_veh);

_destroyed = false;
_hitPoints = ["hitHull", "hitBody"];

{
    if (_veh getHitPointDamage _x >= 0.85) then {
        _destroyed = true;
    };
} forEach _hitPoints;

_destroyed;
