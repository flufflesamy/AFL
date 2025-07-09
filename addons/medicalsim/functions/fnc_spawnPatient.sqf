#include "..\script_component.hpp"
#define MEDSIM_TYPE ["simple", "fracture", "pneumothorax"]
/*
	Author: flufflesamy

	Description:
		Spawns patient for medical treatment.

	Parameter(s):
		0: Eden Entity to spawn at <OBJECT>

	Returns:
		0: Patient Unit <OBJECT>

	Examples:
		fr_stretcher_0 call afl_common_fnc_spawnPatient;
*/

params ["_entity"];
TRACE_1("spawnPatient",_entity);

private _entityPos = getPos(_entity);
private _patient = _entity getVariable [QGVAR(simPatient), nil];
private _patientItems = [
    ["kat_IV_16", 2],
    ["kat_layrnx", 4],
    ["ACE_tourniquet", 6],
    ["kat_chestSeal", 3],
    ["ACE_packingBandage", 20],
    ["ACE_splint", 4],
    ["kat_plate", 4],
    ["kat_naloxone", 4],
    ["ACE_morphine", 4],
    ["kat_Painkiller", 3],
    ["ACE_epinephrine", 3],
    ["kat_etomidate", 5],
    ["kat_Carbonate", 1],
    ["kat_atropine", 1],
    ["ACE_adenosine", 1],
    ["kat_bloodIV_O_N", 2],
    ["ACE_plasmaIV", 2],
    ["ACE_salineIV", 2]
];

if (_simType == -1) exitWith {nil};

// Delete patient if exists
if (!isNil "_patient") then
{
	deleteVehicle _patient;
	_entity setVariable [QGVAR(simPatient), nil, true];
};

// spawn patient
_patient = (createGroup west) createUnit ["B_Soldier_unarmed_F", _entityPos, [], 0, "CAN_COLLIDE"];
removeAllWeapons _patient;
// removeUniform _patient;
// removeVest _patient;
removeHeadgear _patient;
removeAllItems _patient;
removeAllAssignedItems _patient;
_patient disableAI "PATH";
_patient disableAI "RADIOPROTOCOL";

{
    _x params ["_itemName", "_quantity"];

    for "_i" from 1 to _quantity do {
        _patient addItem _itemName;
    };
} forEach _patientItems;

_entity setVariable [QGVAR(simPatient), _patient, true];

_patient;
