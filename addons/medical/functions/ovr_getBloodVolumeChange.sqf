#include "..\script_component.hpp"
/*
    Author: flufflesamy

	Description:
		Dummy function for overriding kat_pharma_fnc_getBloodVolumeChange

	Parameter(s):
        0: The Unit <OBJECT>
        1: Time since last update <NUMBER>
        2: Global Sync Values (bloodbags) <BOOL>

	Returns:
		Blood volume change (liters per second) <NUMBER>

	Examples:
		[player, 1, true] call kat_pharma_fnc_getBloodVolumeChange
*/
_this call FUNC(getBloodVolumeChange);
