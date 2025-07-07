#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Sets a unit to be in cardiac arrest

	Parameter(s):
		0: Unit <OBJECT>
        1: Cardiac arrest type ["None", "Asystole", "PEA", "VF", "VT"] <STRING>

	Returns:
		Nothing

	Examples:
		[player, "VF"] call afl_common_fnc_setCardiacArrest;
*/

params["_unit", "_type"];
TRACE_2("setCardiacArrest",_unit,_type);

private _aType = ARREST_TYPE find toLower _type;
private _currentState = _unit getVariable [QKEGVAR(circulation,cardiacArrestType), 0];

if (_aType == -1) exitWith {ERROR_1("%1 is not a valid cardiac arrest type.",_type)};

_unit setVariable [QKEGVAR(circulation,cardiacArrestType), _aType, true];

if (_aType > 0 && _currentState == 0) then {
    [QACEGVAR(medical,FatalVitals), [_unit], _unit] call CFUNC(targetEvent);
} else {
    [QACEGVAR(medical,CPRSucceeded), [_unit], _unit] call CFUNC(targetEvent);
};
