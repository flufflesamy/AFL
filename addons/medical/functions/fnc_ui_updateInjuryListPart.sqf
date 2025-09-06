#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Adds visual indication of IV bags on limbs in medical menu.
 *
 * Arguments:
 * 0: Injury List <CONTROL>
 * 1: Target <OBJECT>
 * 2: Body Part <NUMBER>
 * 3: Entries <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [objectNull, player, 0, []] call afl_medical_fnc_updateInjuryListPart
 */
params ["_ctrl", "_target", "_selectionN", "_entries"];

private _bloodBags = _target getVariable [QACEGVAR(medical,ivBags), []];
private _salineN = 0;
private _saline = 0;
private _bloodN = 0;
private _blood = 0;
private _plasmaN = 0;
private _plasma = 0;

if (!isNil "_bloodBags") then {
    {
        _x params ["_bagVolumeRemaining", "_type", "_bodyPart", "_treatment", "_rateCoef", "_item"];

        if (_selectionN isEqualTo _bodyPart) then {
            switch (_type) do {
                case "Saline": {
                    INC(_salineN);
                    _saline = _saline + _bagVolumeRemaining;
                };
                case "Blood": {
                    INC(_bloodN);
                    _blood = _blood + _bagVolumeRemaining;
                };
                case "Plasma": {
                    INC(_plasmaN);
                    _plasma = _plasma + _bagVolumeRemaining;
                };
            };
        };
    } forEach _bloodBags;
};

if ((_salineN > 0) || (_bloodN > 0) || (_plasmaN > 0)) then {
    if (_salineN > 0) then {
        _entries pushBack [format [LLSTRING(recievingSalineIVBags), _salineN, floor _saline], [0.5, 0.8, 1, 1]];
    };

    if (_bloodN > 0) then {
        _entries pushBack [format [LLSTRING(recievingBloodIVBags), _bloodN, floor _blood], [1, 0.5, 0.5, 1]];
    };

    if  (_plasmaN > 0) then {
        _entries pushBack [format [LLSTRING(recievingPlasmaIVBags), _plasmaN, floor _plasma], [1, 1, 0.5, 1]];
    };
} else {
    _entries pushBack [LLSTRING(noIVBags), [1, 1, 1, 0.33]];
};
