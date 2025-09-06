#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Dummy function for overriding kat_pharma_fnc_getBloodVolumeChange.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Global Sync Values (bloodbags) <BOOL>
 *
 * Return Value:
 * Blood volume change (liters per second) <NUMBER>
 *
 * Example:
 * [player, 1, true] call kat_pharma_fnc_getBloodVolumeChange
 */

_this call FUNC(getBloodVolumeChange);
