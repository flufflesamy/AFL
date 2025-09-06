#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Callback for ace_medical_treatment_ivBagLocal event. Adds IV block chance based on coagulation factor.
 *
 * Arguments:
 * 0: Patient <UNIT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 * 3: Medic <OBJECT>
 * 4: Item User <OBJECT>
 * 5: Item <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call afl_medical_fnc_fluidBlock
 */
params ["_patient", "_bodyPart", "_treatment", "_medic", "_itemUser", "_item"];
TRACE_6("fluidBlockLocal",_patient,_bodyPart,_treatment,_medic,_itemUser,_item);

private _isEnabled = GVAR(enableFluidBlock);
private _bloodVolume = GET_SIMPLE_BLOOD_VOLUME(_patient);

// Exit if function is not enabled or patient already has full fluids
if (!_isEnabled || _bloodVolume >= DEFAULT_BLOOD_VOLUME) exitWith {
    LOG("IV Clogging disabled or no IV needed, exiting.")
};

private _blockCoef = GVAR(fluidBlockCoef);
private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
private _ivArray = _patient getVariable [QKEGVAR(pharma,IV), [0,0,0,0,0,0]];
private _ivActual = _ivArray select _partIndex;
private _coagVal = [GVAR(coagHash), _item, 0] call CFUNC(hashGet);
TRACE_3("before randomization",_ivArray,_ivActual,_coagVal);

if (_ivActual > 1 && _ivActual < 4 && _coagVal > 0) then {
    private _randomNumber = floor random 1000;
    private _coagActual = _coagVal * _blockCoef;
    TRACE_2("fluidBlock random",_randomNumber,_coagActual);
    if (_randomNumber <= _coagActual) then {
        private _waitTime = random [30,90,120];
        [{
            params ["_patient", "_ivArray", "_partIndex", "_ivActual"];
            TRACE_4("IV Clogging Now",_patient,_ivArray,_partIndex,_ivActual);

            _ivArray set [_partIndex, 3];
            _patient setVariable [QKEGVAR(pharma,IV), _ivArray, true];
        },
        [_patient, _ivArray, _partIndex, _ivActual], _waitTime] call CFUNC(waitAndExecute);
        TRACE_1("IV clogged, wait time:",_waitTime);
    };
};
