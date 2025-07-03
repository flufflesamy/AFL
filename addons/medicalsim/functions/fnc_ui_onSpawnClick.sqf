#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Handles onClick event of the Spawn button.

	Parameter(s):
		Nothing.

	Returns:
		Nothing.

	Examples:
		[] call afl_medicalsim_fnc_ui_onSpawnClick;
*/

private _stretcher = [] call FUNC(ui_getSelectedStretcher);
TRACE_1("Stretcher: %1",_stretcher);

// unfocus button
ctrlSetFocus displayCtrl IDC_STRETCHERS_LISTBOX;
false call FUNC(ui_updateClearAllButton);
false call FUNC(ui_updateSpawnAllButton);

// spawn patient
private _patient = _stretcher call FUNC(spawnPatient);
TRACE_1("Patient: %1",_patient);
if (isNil "_patient") exitWith {ERROR_1("Patient %1 cannot be nil",_patient)};

// set uncon
private _uncon = cbChecked displayCtrl IDC_MISC_UNCON_CHECKBOX;

if (_uncon) then {
    [_patient, true, 300] call KEFUNC(misc,setUnconscious);
};

// set wounds
private _damageArray = [];
_damageArray pushBack [sliderPosition IDC_WOUNDS_HEAD_SLIDER, "Head"];
_damageArray pushBack [sliderPosition IDC_WOUNDS_TORSO_SLIDER, "Body"];
_damageArray pushBack [sliderPosition IDC_WOUNDS_LEFTARM_SLIDER, "LeftArm"];
_damageArray pushBack [sliderPosition IDC_WOUNDS_RIGHTARM_SLIDER, "RightArm"];
_damageArray pushBack [sliderPosition IDC_WOUNDS_LEFTLEG_SLIDER, "LeftLeg"];
_damageArray pushBack [sliderPosition IDC_WOUNDS_RIGHTLEG_SLIDER, "RightLeg"];

[_patient, _damageArray] call FUNC(setWounds);

// set cardiac arrest
private _cardiacIndex = lbCurSel IDC_CARDIAC_COMBO;
private _cardiacText = lbText [IDC_CARDIAC_COMBO, _cardiacIndex];

if (_cardiacIndex > 0) then {
    [_patient, _cardiacText] call FUNC(setCardiacArrest);
    TRACE_2("Set cardiac arrest",_patient,_cardiacText);
};

// set airway
private _occluded = cbChecked displayCtrl IDC_AIRWAY_OCCLUDED_CHECKBOX;
private _obstructed = cbChecked displayCtrl IDC_AIRWAY_OBSTRUCTED_CHECKBOX;
private _pao2 = sliderPosition IDC_AIRWAY_PAO2_SLIDER;

if (_occluded || _obstructed || _pao2 < 100) then {
    [_patient, _occluded, _obstructed, _pao2] call FUNC(setAirway);
    TRACE_4("Set airway",_patient,_occluded,_obstructed,_pao2);
};

// set ptx
private _ptxTypeIndex = lbCurSel IDC_PTX_TYPE_COMBO;
private _ptxTypeText = lbText [IDC_PTX_TYPE_COMBO, _ptxTypeIndex];
private _ptxStrength = sliderPosition IDC_PTX_STRENGTH_SLIDER;
private _ptxDeteriorate = cbChecked displayCtrl IDC_PTX_DETERIORATE_CHECKBOX;
private _ptxTamponade = cbChecked displayCtrl IDC_PTX_TAMPONADE_CHECKBOX;

if (_ptxTypeIndex > 0) then {
    [_patient, _ptxTypeText, _ptxStrength, _ptxDeteriorate, _ptxTamponade] call FUNC(setPneumothorax);
    TRACE_5("Pneumothorax",_patient,_ptxTypeText,_ptxStrength,_ptxDeteriorate,_ptxTamponade);
};

// set fractures
private _fracLArmIndex = lbCurSel IDC_FRACTURES_LEFTARM_COMBO;
private _fracLArmText = lbText [IDC_FRACTURES_LEFTARM_COMBO, _fracLArmIndex];
private _fracRArmIndex = lbCurSel IDC_FRACTURES_RIGHTARM_COMBO;
private _fracRArmText = lbText [IDC_FRACTURES_RIGHTARM_COMBO, _fracRArmIndex];
private _fracLLegIndex = lbCurSel IDC_FRACTURES_LEFTLEG_COMBO;
private _fracLLegText = lbText [IDC_FRACTURES_LEFTLEG_COMBO, _fracLLegIndex];
private _fracRLegIndex = lbCurSel IDC_FRACTURES_RIGHTLEG_COMBO;
private _fracRLegText = lbText [IDC_FRACTURES_RIGHTLEG_COMBO, _fracRLegIndex];

if (_fracLArmIndex > 0) then {
    [_patient, "LeftArm", _fracLArmText] call FUNC(setFracture);
    TRACE_3("LeftArm Fracture",_patient,_fracLArmIndex,_fracLArmText);
};

if (_fracRArmIndex > 0) then {
    [_patient, "RightArm", _fracRArmText] call FUNC(setFracture);
    TRACE_3("RightArm Fracture",_patient,_fracRArmIndex,_fracRArmText);
};


if (_fracLLegIndex > 0) then {
    [_patient, "LeftLeg", _fracLLegText] call FUNC(setFracture);
    TRACE_3("LeftLeg Fracture",_patient,_fracLLegIndex,_fracLLegText);
};

if (_fracRLegIndex > 0) then {
    [_patient, "RightLeg", _fracRLegText] call FUNC(setFracture);
    TRACE_3("RightLeg Fracture",_patient,_fracRLegIndex,_fracRLegText);
};

