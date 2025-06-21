#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		<function description>

	Parameter(s):
		0: Name of Vehicle <STRING>
		1: Name of Marker <STRING>

	Returns:
		0: Vehicle <OBJECT>

	Examples:
		<example>
*/

params ["_vehName", "_markerName"];

private _pos = getMarkerPos[_markerName];

private _mkrVarName = format ["%1_%2", str(ADDON), _markerName];
private _veh = AVAR(VehicleConsole) getVariable [_mkrVarName, nil];

// If vehicle is already spawned, remove it
if (!isNil _veh) then
{
	deleteVehicle _veh;
	AVAR(VehicleConsole) setVariable [_mkrVarName, nil, true];
};

_veh = createVehicle[_vehName, _pos, [], 0, ""];
_veh setVariable ["BIS_enableRandomization", false];
hint format ["Spawned %1 at %2!", _vehName, _markerName];

// sets variable in console for name of marker
AVAR(VehicleConsole) setVariable [_mkrVarName, _veh, true];

private _id = [_veh, "Dammaged", {
	params ["_unit", "_hitSelection", "_damage", "_hitPartIndex", "_hitPoint", "_shooter", "_projectile"];
	thisArgs params ["_mkrVarName"];

	hint format ["Dealt %1 damage to %2!", _damage, _hitPoint];

	if (_unit call AFUNC(isDestroyed)) then
	{
		hint "Vehicle Destroyed!";
		[{
			params ["_unit", "_thisID", "_mkrVarName"];
			deleteVehicle _unit select 0;
			AVAR(VehicleConsole) setVariable [_mkrVarName, nil, true];
			_unit removeEventHandler ["Dammaged", _thisID];
		}, [_unit, _thisID, _mkrVarName], 5] call CFUNC(waitAndExecute);
	};
}, [_mkrVarName]] call CFUNC(addBISEventHandler);

_veh // Return