#include "..\..\configs\script_macros.hpp"
#define MEDSIM_TYPE ["simple", "fracture", "pneumothorax"]
/*
	Author: Amy

	Description:
		Spawns patient for medical treatment with specific ailment.

	Parameter(s):
		0: Eden Entity to spawn at <OBJECT>
        1: Medical Sim Type <STRING>
        2: Injury Args <ARRAY>

	Returns:
		0: Patient Unit <OBJECT>

	Examples:
		[player, "LeftLeg", "Simple"] call amy_sfr_fnc_setFracture;
*/

params ["_entity", "_type", "_injuryArgs"];

private _simType = MEDSIM_TYPE find toLower _type;
private _entityPos = getPos(_entity);
private _patient = _entity getVariable [QAVAR(patient), nil];

if (_simType == -1) exitWith {nil};

// Delete patient if exists
if (!isNil _patient) then
{
	deleteVehicle _patient;
	_entity setVariable [QAVAR(patient), nil, true];
};

// spawn patient
_patient = (createGroup West) createUnit ["B_Soldier_unarmed_F", _entityPos, [], 0, "NONE"];
removeAllWeapons _patient;
removeUniform _patient;
removeVest _patient;
removeHeadgear _patient;
removeAllItems _patient;
removeAllAssignedItems _patient;
_patient disableAI "PATH";

_entity setVariable [QAVAR(patient), _patient, true];

switch (_simType) do
{
	case 0: // simple
	{
		
	};
	case 1: // fracture
	{
		[_patient, _injuryArgs select 0, _injuryArgs select 1] call AFUNC(setFracture);
	};
	case 2: //pnuemothorax
	{

	};
};