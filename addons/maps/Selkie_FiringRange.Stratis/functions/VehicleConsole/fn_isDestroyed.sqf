params ["_veh"];

_destroyed = false;
_hitPoints = ["hitHull", "hitBody"];

{
    if (_veh getHitPointDamage _x >= 0.85) then {
        _destroyed = true;
    };
} forEach _hitPoints;

_destroyed;