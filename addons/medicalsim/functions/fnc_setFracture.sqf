#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		Adds KAM fracture to bodypart for a unit.

	Parameter(s):
		0: Unit <OBJECT>
        1: Body Part <STRING>
        2: Fracture Type <STRING>

	Returns:
		Nothing

	Examples:
		[player, "LeftLeg", "Simple"] call afl_common_fnc_setFracture;
*/

params ["_unit", "_bodyPart", "_fracType"];
TRACE_3("setFracture",_unit,_bodyPart,_fracType);

// set body part to fractured
private _fractureArray = _unit getVariable [QACEGVAR(medical,fractures), [0,0,0,0,0,0]];
private _part = ALL_BODY_PARTS find toLower _bodyPart;
if (_part == -1) exitWith {ERROR_1("Invalid fracture location %1!",_fracType)};
_fractureArray set [_part, 1];

// set type of fracture for body part
private _kamfractureArray = _unit getVariable [QKEGVAR(surgery,fractures), [0,0,0,0,0,0]];
private _type = FRACTURE_TYPE find toLower _fracType;
if (_type == -1) exitWith {ERROR_1("Invalid fracture type %1!",_fracType)};
_kamfractureArray set [_part, _type];

// set fracture variables for unit
_unit setVariable [QKEGVAR(surgery,fractures), _kamfractureArray, true];
_unit setVariable [QACEGVAR(medical,fractures), _fractureArray, true];
TRACE_2("Set limb fractures.",_fractureArray,_kamfractureArray);

// play fracture sound
[QACEGVAR(medical,fracture), [_unit, _part], _unit] call CFUNC(targetEvent);

// adjust pain
[_unit, 0.5] call ACEFUNC(medical_status,adjustPainLevel);

// update fracture damage effects
[QACEGVAR(medical_engine,updateDamageEffects), _unit, _unit] call CFUNC(targetEvent);
TRACE_1("Update damage effects.",_unit);
