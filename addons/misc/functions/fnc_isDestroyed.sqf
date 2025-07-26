#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Gets if a vehicle is destroyed.

	Parameter(s):
		0: Vehicle <OBJECT>

	Returns:
		0: Is destroyed <BOOL>

	Examples:
		[myVeh] call afl_misc_fnc_isDestroyed
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
