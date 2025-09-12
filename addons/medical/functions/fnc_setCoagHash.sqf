#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Sets hashtable for IV fluids along with their coagulation values.
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call afl_medical_fnc_setCoagHash
 */
TRACE_1("setCoagHash","");

// Add hashmap of blood coag values
private _coagValues = [
    ["kat_bloodIV_O", 12],
    ["kat_bloodIV_O_N", 12],
    ["kat_bloodIV_A", 12],
    ["kat_bloodIV_A_N", 12],
    ["kat_bloodIV_B", 12],
    ["kat_bloodIV_B_N", 12],
    ["kat_bloodIV_AB", 12],
    ["kat_bloodIV_AB_N", 12],
    ["kat_bloodIV_O_500", 8],
    ["kat_bloodIV_O_N_500", 8],
    ["kat_bloodIV_A_500", 8],
    ["kat_bloodIV_A_N_500", 8],
    ["kat_bloodIV_B_500", 8],
    ["kat_bloodIV_B_N_500", 8],
    ["kat_bloodIV_AB_500", 8],
    ["kat_bloodIV_AB_N_500", 8],
    ["kat_bloodIV_O_250", 4],
    ["kat_bloodIV_O_N_250", 4],
    ["kat_bloodIV_A_250", 4],
    ["kat_bloodIV_A_N_250", 4],
    ["kat_bloodIV_B_250", 4],
    ["kat_bloodIV_B_N_250", 4],
    ["kat_bloodIV_AB_250", 4],
    ["kat_bloodIV_AB_N_250", 4],
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
