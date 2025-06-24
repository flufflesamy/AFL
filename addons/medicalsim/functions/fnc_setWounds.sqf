#include "..\script_component.hpp"
/*
	Author: Amy

	Description:
		Applies wounds to body parts. Gives avulsions only.

	Parameter(s):
		0: Unit to apply wound to <OBJECT>
        1: Damage done to each body part <ARRAY>

	Returns:
		Nothing

	Examples:
		{_player, [[2, "LeftLeg"]]} call afl_common_fnc_setPneumothorax;
*/

params ["_unit", "_allDamages"];

[_unit, _allDamages, "testdamage"] call ACEFUNC(medical_damage,woundsHandlerBase);
