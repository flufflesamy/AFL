#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		<function description>

	Parameter(s):
		0: Vehicle <OBJECT>

	Returns:
		0: <BOOL>

	Examples:
		<example>
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
