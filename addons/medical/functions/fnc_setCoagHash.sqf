#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Sets hashtable for IV fluids along with their coagulation values.

	Parameter(s):
		Nothing

	Returns:
		Nothing

	Examples:
		[] call afl_medical_fnc_setCoagHash
*/
TRACE_1("setCoagHash","");

// Add hashmap of blood coag values
private _coagValues = [
    ["kat_BloodIV_O_N", 12],
    ["kat_BloodIV_O", 12],
    ["kat_BloodIV_A", 12],
    ["kat_BloodIV_A_N", 12],
    ["kat_BloodIV_B", 12],
    ["kat_BloodIV_B_N", 12],
    ["kat_BloodIV_AB", 12],
    ["kat_BloodIV_AB_N", 12],
    ["kat_BloodIV_O_500", 8],
    ["kat_BloodIV_O_N_500", 8],
    ["kat_BloodIV_A_500", 8],
    ["kat_BloodIV_A_N_500", 8],
    ["kat_BloodIV_B_500", 8],
    ["kat_BloodIV_B_N_500", 8],
    ["kat_BloodIV_AB_500", 8],
    ["kat_BloodIV_AB_N_500", 8],
    ["kat_BloodIV_O_250", 4],
    ["kat_BloodIV_O_N_250", 4],
    ["kat_BloodIV_A_250", 4],
    ["kat_BloodIV_A_N_250", 4],
    ["kat_BloodIV_B_250", 4],
    ["kat_BloodIV_B_N_250", 4],
    ["kat_BloodIV_AB_250", 4],
    ["kat_BloodIV_AB_N_250", 4],
    ["ACE_bloodIV", 12],
    ["ACE_bloodIV_500", 8],
    ["ACE_bloodIV_250", 4],
    ["ACE_salineIV", 0],
    ["ACE_salineIV_500", 0],
    ["ACE_salineIV_250", 0],
    ["ACE_plasmaIV", 20],
    ["ACE_plasmaIV_500", 10],
    ["ACE_plasmaIV_250", 5]
];

GVAR(coagHash) = [_coagValues, 0] call CFUNC(hashCreate);
LOG(GVAR(coagHash));
