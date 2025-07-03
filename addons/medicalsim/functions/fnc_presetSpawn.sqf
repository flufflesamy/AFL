#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Spawns patient based on preset;

	Parameter(s):
		0: Stretcher <OBJECT>
        1: Preset Name <STRING>

	Returns:
		0: Patient <OBJECT>

	Examples:
		[[]] call afl_medicalsim_fnc_presetSpawn;
*/
params ["_stretcher", "_presetName"];
TRACE_2("presetSpawn",_stretcher,_presetName);

private _preset = GVAR(simPresets) get _presetName;
_preset params ["_wounds", "_circulation", "_airway", "_ptx", "_fractures", "_misc"];
TRACE_1("preset params",_preset);

// Get wounds from preset
private _woundsArray = [];
{
    private _woundsN = [_x] call FUNC(chanceArrayToValue);

    if (_woundsN > 0) then {
        private _partName = ALL_BODY_PARTS select _forEachIndex;
        _woundsArray pushBack [_woundsN, _partName];
    };
} forEach _wounds;

// Get circulation values
_circulation params ["_circulation_arrestType", "_circulation_pao2"];

private _arrestType = 0;
switch (true) do {
    case (_circulation_arrestType == 0): {};
    case (_circulation_arrestType >= 1): {
        _arrestType = _arrest;
    };
    case (_circulation_arrestType < 1): {
        if (_circulation_arrestType >= random 1) then {
            _arrestType = floor (random 4) + 1;
        };
    };
};

private _pao2 = _circulation_pao2;

// Get airway values
_airway params ["_airway_occluded", "_airway_obstructed"];

private _occluded = CHANCE_TO_BOOL(_airway_occluded);
private _obstructed = CHANCE_TO_BOOL(_airway_obstructed);

// ptx
_ptx params ["_ptx_ptxType", "_ptx_ptxStrength", "_ptx_ptxDeteriorate", "_ptx_ptxTamponade"];

private _ptxType = [_ptx_ptxType] call FUNC(chanceArrayToValue);

_ptxStrength = _ptx_ptxStrength;
private _ptxDeteriorate = CHANCE_TO_BOOL(_ptx_ptxDeteriorate);
private _ptxTamponade = CHANCE_TO_BOOL(_ptx_ptxTamponade);

// Get fractures
private _fractureArray = [];
{
    private _fractureN = [_x] call FUNC(chanceArrayToValue);
    TRACE_1("fractureN",_fractureN);

    if (_fractureN > 0) then {
        private _fracName = FRACTURE_TYPE select _fractureN;
        private _partName = ALL_BODY_PARTS select _forEachIndex;
        _fractureArray pushBack [_partName, _fracName];
    };
} forEach _fractures;

TRACE_1("fractureArray",_fractureArray);

// Get misc
_misc params ["_misc_uncon"];

private _uncon = CHANCE_TO_BOOL(_misc_uncon);
TRACE_3("uncon",_misc,_misc_uncon,_uncon);

// Spawn patient
private _patient = _stretcher call FUNC(spawnPatient);
if (isNil "_patient") exitWith {ERROR_1("Patient %1 cannot be nil",_patient)};

// Set wounds
if (count _woundsArray > 0) then {
    [_patient, _woundsArray] call FUNC(setWounds);
};

// Set Circulation / Airway
if (_arrestType > 0) then {
    private _arrestTypeText = ARREST_TYPE select _arrestType;
    [_patient, _arrestTypeText] call FUNC(setCardiacArrest);
};

[_patient, _occluded, _obstructed, _pao2] call FUNC(setAirway);

// Set PTX
if (_ptxType > 0) then {
    private _ptxTypeText = PNUMO_TYPE select _ptxType;
    [_patient, _ptxTypeText, _ptxStrength, _ptxDeteriorate, _ptxTamponade] call FUNC(setPneumothorax);
};

// Set fractures
{
    _x params ["_bodyPart", "_fracType"];

    [_patient, _bodyPart, _fracType] call FUNC(setFracture);
} forEach _fractureArray;

// Set uncon
if (_uncon) then {
    [_patient, true, 300] call KEFUNC(misc,setUnconscious);
};
