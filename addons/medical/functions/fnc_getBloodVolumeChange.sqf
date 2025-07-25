#include "..\script_component.hpp"
/*
 * The following code is a derivative work of the code from the KAM project,
 * which is licensed under GPLv3. This code is therefore also licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Author: Glowbal, Edited by flufflesamy
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Global Sync Values (bloodbags) <BOOL>
 *
 * Return Value:
 * Blood volume change (liters per second) <NUMBER>
 *
 * Example:
 * [player, 1, true] call afl_medical_fnc_getBloodVolumeChange
 */

params ["_unit", "_deltaT", "_syncValues"];
TRACE_3("getBloodVolumeChange",_unit,_deltaT,_syncValues);

private _bloodLoss = [_unit] call ACEFUNC(medical_status,getBloodLoss);
private _internalBleeding = GET_INTERNAL_BLEEDING(_unit);
private _lossVolumeChange = (-_deltaT * ((_bloodLoss + _internalBleeding * (GET_HEART_RATE(_unit) / DEFAULT_HEART_RATE)) / GET_VASOCONSTRICTION(_unit)));
private _enableFluidShift = KEGVAR(vitals,enableFluidShift);
private _fluidVolume = GET_BODY_FLUID(_unit);
_fluidVolume params ["_ECB","_ECP","_SRBC","_ISP","_fullVolume"];

_ECP = (_ECP + (_lossVolumeChange * LITERS_TO_ML) / 2) max 100;
_ECB = (_ECB + (_lossVolumeChange * LITERS_TO_ML) / 2) max 100;

if (!isNil {_unit getVariable [QACEGVAR(medical,ivBags),[]]}) then {
    private _bloodBags = _unit getVariable [QACEGVAR(medical,ivBags), []];
    private _IVarray = _unit getVariable [QKEGVAR(pharma,IV), [0,0,0,0,0,0]];
    private _hypothermia = KEGVAR(hypothermia,hypothermiaActive);
    private _bloodPressure = GET_BLOOD_PRESSURE(_unit);

    private _incomingVolumeChange = [0,0,0,0,0,0];
    private _fluidWarmer = _unit getVariable [QKEGVAR(hypothermia,fluidWarmer), [0,0,0,0,0,0]];
    private _fluidHeat = 0;

    private _partBagArray = [0,0,0,0,0,0];

    // Gets number of IV bags per body part
    {
        _x params ["", "", "_bodyPart"];

        private _bagCount = (_partBagArray select _bodyPart) + 1;
        _partBagArray set [_bodyPart, _bagCount];
        TRACE_2("_bagCount",_bodyPart,_bagCount);
    } forEach _bloodBags;

    _bloodBags = _bloodBags apply {
        _x params ["_bagVolumeRemaining", "_type", "_bodyPart", "_treatment", "_rateCoef", "_item"];

        private _tourniquets = GET_TOURNIQUETS(_unit);

        if ((_tourniquets select _bodyPart isEqualTo 0) && (_IVarray select _bodyPart isNotEqualTo 3)) then {
            private _bagFlowRate = ([_bloodPressure, _bodyPart, _type] call FUNC(getIVFlowRate)) / (_partBagArray select _bodyPart); // normalize flow rate
            private _IVflow = _unit getVariable [QKEGVAR(pharma,IVflow), [0,0,0,0,0,0]];
            private _flowCalculation = _bagFlowRate * _deltaT * ACEGVAR(medical,ivFlowRate) * (_IVflow select _bodyPart min 1);
            private _bagChange = _flowCalculation min _bagVolumeRemaining; // absolute value of the change in miliLiters
            _bagVolumeRemaining = _bagVolumeRemaining - _bagChange;

            if (_hypothermia) then {
                // If fluid warmers are on the line, fluids are "warmed" and added to the warmer. If there is no fluid warmer on the line, the fluids stayed cooled
                if (_fluidWarmer select _bodyPart == 1) then {
                    _incomingVolumeChange set [_bodyPart, ((_incomingVolumeChange select _bodyPart) + _bagChange)];
                } else {
                    _incomingVolumeChange set [_bodyPart, ((_incomingVolumeChange select _bodyPart) - _bagChange)];
                };
            };

            // Plasma adds to ECP. Saline splits between the ECP and ISP. Blood adds to ECB
            switch (true) do {
                case(_type == "Plasma"): { _ECP = _ECP + _bagChange; _lossVolumeChange = _lossVolumeChange + (_bagChange / ML_TO_LITERS); };
                case(_type == "Saline"): {
                    if (_enableFluidShift) then {
                        _ECP = _ECP + _bagChange / 2;
                        _ISP = _ISP + _bagChange / 2;
                        _lossVolumeChange = _lossVolumeChange + (_bagChange / 2000);
                    } else {
                        _ECP = _ECP + _bagChange;
                        _lossVolumeChange = _lossVolumeChange + (_bagChange / ML_TO_LITERS);
                    };
                };
                case(_type == "Blood"): { _ECB = _ECB + _bagChange; _lossVolumeChange = _lossVolumeChange + (_bagChange / ML_TO_LITERS); };
            };
        };

        if (_bagVolumeRemaining < 0.01) then {
            []
        } else {
            [_bagVolumeRemaining, _type, _bodyPart, _treatment, _rateCoef, _item]
        };
    };

    _bloodBags = _bloodBags - [[]]; // remove empty bags

    if (_bloodBags isEqualTo []) then {
        _unit setVariable [QACEGVAR(medical,ivBags), nil, true]; // no bags left - clear variable (always globaly sync this)
    } else {
        _unit setVariable [QACEGVAR(medical,ivBags), _bloodBags, _syncValues];
    };

    // Incoming fluids impacting internal temperature
    if (_hypothermia) then {
        { _fluidHeat = _fluidHeat + _x; } forEach _incomingVolumeChange;

        if (_fluidHeat > 0) then {
            private _totalHeat = _unit getVariable [QEGVAR(hypothermia,warmingImpact), 0];
            _unit setVariable [QKEGVAR(hypothermia,warmingImpact), _totalHeat + _fluidHeat, _syncValues];
        } else {
            private _totalCooling = _unit getVariable [QEGVAR(hypothermia,warmingImpact), 0];
            _unit setVariable [QKEGVAR(hypothermia,warmingImpact), _totalCooling + _fluidHeat, _syncValues];
        };
    };
};

// Movement and recovery of interstital fluid and SRBC collection
private _SRBCChange = 0;

if (_enableFluidShift) then {
    private _shiftValue = 0;
    private _defaultShift = false;

    _SRBCChange = [0, 0.5] select ((_SRBC > 0) && (_ECB < DEFAULT_ECB));
    _ECB = _ECB + (_SRBCChange * _deltaT);
    _SRBC = _SRBC - (_SRBCChange * _deltaT);

    switch (true) do {
        case (((_ECB + _ECP) > (_ISP * 0.6)) && ((_ECB + _ECP) > 4500)): {
            // Negative shifts only happen above 4500ml of blood volume, to prevent patients from falling back into arrest/unconsciousness
            _shiftValue = (1 min ((_ECP + _ECB) - (_ISP * 0.6))) * _deltaT;

            _ECP = _ECP - _shiftValue;
            _ISP = _ISP + _shiftValue;
        };
        case ((_ECB + _ECP) < (_ISP * 0.6)): {
            _shiftValue = (1 min ((_ISP * 0.6) - (_ECP + _ECB))) *_deltaT;

            if (_shiftValue < 0.1) exitWith { _defaultShift = true; };

            _ECP = _ECP + _shiftValue;
            _ISP = _ISP - _shiftValue;
        };
        default {
            _defaultShift = true;
        };
    };

    if (_defaultShift) then {
        _ISP = _ISP + ((((DEFAULT_ISP - _ISP) max -2) min 2) *_deltaT);
        _SRBC = _SRBC + ((((DEFAULT_SRBC - _SRBC) max -1) min 1) * _deltaT);
    };
};

_unit setVariable [QKEGVAR(circulation,bodyFluid), [_ECB, _ECP, _SRBC, _ISP, (_ECP + _ECB)], _syncValues];

((_lossVolumeChange + GET_BLOOD_VOLUME_LITERS(_unit)) max 0.01)
