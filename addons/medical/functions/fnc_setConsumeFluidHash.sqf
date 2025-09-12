#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Sets hashtable for IV fluids with their conversion values when consumed.
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call afl_medical_fnc_setConsumeFluidHash
 *
 * Public: No
 */
TRACE_1("setFluidHash","");

private _fluids = [
    ["kat_bloodIV_O_N", ["kat_bloodIV_O_N_500", "kat_bloodIV_O_N_250"]],
    ["kat_bloodIV_O", ["kat_bloodIV_O_500", "kat_bloodIV_O_250"]],
    ["kat_bloodIV_A", ["kat_bloodIV_A_500", "kat_bloodIV_A_250"]],
    ["kat_bloodIV_A_N", ["kat_bloodIV_A_N_500", "kat_bloodIV_A_N_250"]],
    ["kat_bloodIV_B", ["kat_bloodIV_B_500", "kat_bloodIV_B_250"]],
    ["kat_bloodIV_B_N", ["kat_bloodIV_B_N_500", "kat_bloodIV_B_N_250"]],
    ["kat_bloodIV_AB", ["kat_bloodIV_AB_500", "kat_bloodIV_AB_250"]],
    ["kat_bloodIV_AB_N", ["kat_bloodIV_AB_N_500", "kat_bloodIV_AB_N_250"]],
    ["kat_bloodIV_O_500", ["kat_bloodIV_O_250"]],
    ["kat_bloodIV_O_N_500", ["kat_bloodIV_O_N_250"]],
    ["kat_bloodIV_A_500", ["kat_bloodIV_A_250"]],
    ["kat_bloodIV_A_N_500", ["kat_bloodIV_A_N_250"]],
    ["kat_bloodIV_B_500", ["kat_bloodIV_B_250"]],
    ["kat_bloodIV_B_N_500", ["kat_bloodIV_B_N_250"]],
    ["kat_bloodIV_AB_500", ["kat_bloodIV_AB_250"]],
    ["kat_bloodIV_AB_N_500", ["kat_bloodIV_AB_N_250"]],
    ["kat_bloodIV_O_250", []],
    ["kat_bloodIV_O_N_250", []],
    ["kat_bloodIV_A_250", []],
    ["kat_bloodIV_A_N_250", []],
    ["kat_bloodIV_B_250", []],
    ["kat_bloodIV_B_N_250", []],
    ["kat_bloodIV_AB_250", []],
    ["kat_bloodIV_AB_N_250", []],
    ["ACE_bloodIV", ["ACE_bloodIV_500", "ACE_bloodIV_250"]],
    ["ACE_bloodIV_500", ["ACE_bloodIV_250"]],
    ["ACE_bloodIV_250", []],
    ["ACE_salineIV", ["ACE_salineIV_500", "ACE_salineIV_250"]],
    ["ACE_salineIV_500", ["ACE_salineIV_250"]],
    ["ACE_salineIV_250", []],
    ["ACE_plasmaIV", ["ACE_plasmaIV_500", "ACE_plasmaIV_250"]],
    ["ACE_plasmaIV_500", ["ACE_plasmaIV_250"]],
    ["ACE_plasmaIV_250", []]
];

GVAR(consumeFluidHash) = [_fluids, 0] call CFUNC(hashCreate);
