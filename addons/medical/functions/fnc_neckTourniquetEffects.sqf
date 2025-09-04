#include "..\script_component.hpp"
/*
* Author: flufflesamy
* Creates PFH that handles neck tourniquet effects.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* Nothing
*
* Example:
* [player] call afl_medical_fnc_neckTourniquetEffects
*/
params ["_unit"];
TRACE_1("neckTourniquetEffects",_unit);

if(KEGVAR(breathing,enable)) then {
    LOG("Advanced Breathing");
    GVAR(neckTqCounter) = 0;
    GVAR(tqUnconTime) = random [7, 12, 17];
    GVAR(tqDeathTime) = (random [150, 225, 300]);
};

// Adds per-frame handler
private _tourniquetPFH = [{
    params ["_args", "_idPFH"];
    _args params ["_unit"];

    private _neckTourniquets = ([ARR_2(_unit,"Head")] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo));
    private _isAwake = _unit call ACEFUNC(common,isAwake);

    // If no neck TQ or unit is dead, exit and remove per-frame handler
    if (!(_neckTourniquets) || !(alive _unit)) exitWith {
        TRACE_2("Remove neck TQ effects",_neckTourniquets,_unit);

        if(KEGVAR(breathing,enable)) then {
            // reset counter
             GVAR(neckTqCounter) = 0;

            // remove bradycardia
            _unit call KEFUNC(pharma,treatmentAdvanced_AtropineLocal);

            // remove visual effect
            if (isPlayer _unit) then {
                [QGVAR(neckTourniquetVisual), false, _unit] call FUNC(targetEvent);
            };
        };

        // remove PFH
        _unit setVariable [QGVAR(tourniquetPFH), -1];
        _idPFH call CFUNC(removePerFrameHandler);
    };

    if (KEGVAR(breathing,enable)) then {
        private _airwayItem = _unit getVariable [QKEGVAR(airway,airway_item), nil];
        private _recovery = _unit getVariable [QKEGVAR(airway,recovery), false];
        private _overstretch = _unit getVariable [QKEGVAR(airway,overstretch), false];
        private _hasBradycardia = _unit call FUNC(hasBradycardia);
        private _occluded = _unit getVariable [QKEGVAR(airway,occluded), false];
        private _inArrest = IN_CRDC_ARRST(_unit);
        private _forceSync = false;
        // TRACE_1("Has Bradycardia",_hasBradycardia);

        // Increment neck TQ counter
        INC(GVAR(neckTqCounter));

        // Remove airway items
        if (_airwayItem != "") then {
            TRACE_1("Remove airway item",_airwayItem);
            [_unit, _unit] call KEFUNC(airway,treatmentAdvanced_RemoveAirwayItem);
        };

        // Unset recovery position
        if (_recovery || _overstretch) then {
            TRACE_2("Unset recovery position",_recovery,_overstretch);
            [_unit, _unit] call KEFUNC(airway,treatmentAdvanced_CancelRecoveryPosition);
        };

        // Show low spo2 effect if awake
        if (isPlayer _unit) then {
            LOG("Show low spo2 effect");
            [QGVAR(neckTourniquetVisual), _isAwake, _unit] call CFUNC(targetEvent);
        };

        // Set airway to occluded
        if (!_occluded) then {
            _unit setVariable [QKEGVAR(airway,occluded), true, true];
            LOG("Set airway to occluded");
        };

        // Do if patient is awake
        if (_isAwake) then {
            // Increase pain
            [_unit, 0.05] call ACEFUNC(medical,adjustPainlevel);

            // Set unconciousness due to cerebral ischemia
            if (GVAR(neckTqCounter) >= GVAR(tqUnconTime)) then {
                TRACE_2("Set Uncon",GVAR(neckTqCounter),GVAR(tqUnconTime));
                [_unit, true, 300] call KEFUNC(misc,setUnconscious);
            };
        };

        // Do if patient is uncon
        if (!_isAwake) then {
            // Brain death due to cerebral ischemia after tqDeathTime
            if (GVAR(neckTqCounter) >= GVAR(tqDeathTime)) then {
                TRACE_2("Brain Death",GVAR(neckTqCounter),GVAR(tqDeathTime));
                [_unit, "Cerebral_Ischemia"] call ACEFUNC(medical_status,setDead);
            };

            // Set bradycardia due to carotid sinus reflex
            if ((!_inArrest) && (!_hasBradycardia)) then {
                LOG("Set bradycardia");

                [_unit, "BRADYCARDIA", 60, 1200, -200, 0, 0] call ACEFUNC(medical_status,addMedicationAdjustment);
                _forceSync = true;
            };
        };

        // Force handleUnitVitals to sync over network
        if (_forceSync) then {
            LOG("Force Sync");
            _unit setVariable [QACEGVAR(medical_vitals,lastTimeUpdated), 0];
            _unit setVariable [QACEGVAR(medical_vitals,lastMomentValuesSynced), 0];
        };

        // Update unit vitals
        _unit call ACEFUNC(medical_vitals,handleUnitVitals);
    } else {
        LOG("Simple Breathing");

        private _airwayStatus = _unit getVariable [QKEGVAR(breathing,airwayStatus), 100];
        private _output = 0;
        private _multiplierPositive = 0;
        _multiplierPositive = KEGVAR(breathing,SpO2_MultiplyPositive);
        TRACE_1("multiplierpositive",_multiplierPositive);

        // If awake, reduce spo2 + conscious breathing rate
        if (_isAwake) then {
            _output = (-1 - (0.5 * _multiplierPositive));
        };

        // reduced spo2 loss when uncon.
        if !(_isAwake) then {
            _output = -0.1;
        };

        TRACE_1("tq airway output",_output);

        private _finalOutput = _airwayStatus + _output;

        if (_finalOutput > 100) then {_finalOutput = 100;};
        if (_finalOutput < 1) then {_finalOutput = 1};

        TRACE_2("Applying neck tq airway effects",_airwayStatus,_finalOutput);
        _unit setVariable [QKEGVAR(breathing,airwayStatus), _finalOutput, true];
        _unit call KEFUNC(breathing,handleBreathing);
    };
}, 1, _unit] call CFUNC(addPerFrameHandler);

_unit setVariable [QGVAR(tourniquetPFH), _tourniquetPFH];
