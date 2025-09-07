#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Adds a medical sim menu to an eden entity.
 *
 * Arguments:
 * 0: Eden Entity <OBJECT>
 * 1: Stretchers <ARRAY>
 *   0: Stretcher <ARRAY>
 *     0: Stretcher Entity <OBJECT>
 *     1: Display Name <STRING>
 *
 * Return Value:
 * Nothing.
 *
 * Example:
 * [fr_medicalConsole, [[fr_stretcher_0, "Stretcher A"], [fr_stretcher_1, "Stretcher B"]] call afl_medicalsim_fnc_addSimMenu;
 */
params ["_entity", "_stretchers"];
TRACE_2("addSimMenu",_entity,_stretchers);

_entity setVariable [QGVAR(simStretchers), _stretchers, true];

_entity addAction [
    "Open Simulator Menu",
    {
        _this select 3 call FUNC(openSimMenu);
    },
    _entity,
    1.5,
    true,
    true,
    "",
    "true",
    5,
    false,
    "",
    ""
];
