#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		<function description>

	Parameter(s):
		0: Name of Vehicle <STRING>
		1: Name of Marker <STRING>
		2: Entity to store variable in <OBJECT>
		3: Caller (Optional, default nil) <OBJECT>

	Returns:
		0: Vehicle <OBJECT>

	Examples:
		<example>
*/

params ["_vehName", "_markerName", "_entity", ["_caller", nil]];
TRACE_3("createVehOnMarker",_vehName,_markerName,_entity);

private _pos = getMarkerPos[_markerName];

private _mkrVarName = format ["%1_%2", ADDON, _markerName];
private _veh = _entity getVariable [_mkrVarName, nil];

// If vehicle is already spawned, remove it
if (!isNil _veh) then
{
	deleteVehicle _veh;
	_entity setVariable [_mkrVarName, nil, true];
	TRACE_2("_veh exists, deleting old vehicle",_veh,_entity);
};

_veh = createVehicle[_vehName, _pos, [], 0, ""];
_veh setVariable ["BIS_enableRandomization", false];

if (_caller == player) then
{
	hint format ["Spawned %1 at %2!", _vehName, _markerName];
};


// sets variable in console for name of marker
_entity setVariable [_mkrVarName, _veh, true];

private _id = [_veh, "Dammaged", {
	params ["_unit", "_hitSelection", "_damage", "_hitPartIndex", "_hitPoint", "_shooter", "_projectile"];
	thisArgs params ["_mkrVarName", "_entity", "_caller"];

	if (_caller == player) then
	{
		hint format ["Dealt %1 damage to %2!", _damage, _hitPoint];
	};

	if (_unit call FUNC(isDestroyed)) then
	{
		if (caller == player) then{
			hint "Vehicle Destroyed!";
		};

		[{
			params ["_unit", "_thisID", "_mkrVarName"];
			deleteVehicle _unit select 0;
			_entity setVariable [_mkrVarName, nil, true];
			_unit removeEventHandler ["Dammaged", _thisID];
		}, [_unit, _thisID, _mkrVarName, _entity], 5] call CFUNC(waitAndExecute);
	};
}, [_mkrVarName, _entity, _caller]] call CFUNC(addBISEventHandler);

_veh // Return
