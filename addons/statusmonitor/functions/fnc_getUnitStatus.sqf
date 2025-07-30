#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Get unit status based on distance.

	Parameter(s):
		0: Unit <OBJECT>

	Returns:
		0: Unit Name <STRING>
        1: Unit PR <NUMBER>
        2: In Range <BOOL>

	Examples:
		[] call afl_statusmonitor_fnc_canShow
*/
params ["_unit"];

if (isNil "_unit") exitWith { ERROR_1("%1 cannot be nil",_unit) };

private _unitName = name _unit;
private _playerDistance = player distance2D _unit;
private _inRange = _playerDistance <= GVAR(monitorRange);
private _unitPR = 0;

if (_inRange) then {
    _unitPR = GET_HEART_RATE(_unit);
};

[_unitName, _unitPR, _inRange];
