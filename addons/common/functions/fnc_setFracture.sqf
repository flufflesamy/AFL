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
		[player, "LeftLeg", "Simple"] call amy_sfr_fnc_setFracture;
*/

params ["_unit", "_bodyPart", "_fracType"];
TRACE_3("setFracture",_unit,_bodyPart,_fracType);

// set body part to fractured
private _fractureArray = [0,0,0,0,0,0];
private _part = ALL_BODY_PARTS find toLower _bodyPart;
_fractureArray set [_part, 1];

// set type of fracture for body part
private _kamfractureArray = [0,0,0,0,0,0];
private _type = FRACTURE_TYPE find toLower _fracType;
_kamfractureArray set [_part, _type];

// set fracture variables for unit
_unit setVariable [QKGVAR(fractures), _kamfractureArray, true];
_unit setVariable [QACEGVAR(medical,fractures), _fractureArray, true];

// play fracture sound
[QACEGVAR(medical,fracture), [_unit, _part], _unit] call CFUNC(targetEvent);

// update damage effects
_unit call ACEFUNC(medical_system,updateDamageEffects);
