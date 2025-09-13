#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Handles CBA version mismatch logic.
 *
 * Arguments:
 * 0: Remote Version <STRING>
 * 1: Local Version <STRING>
 * 2: Unit <OBJECT>
 * 3: Level <NUMBER>
 *
 * Return Value:
 * Nothing.
 *
 * Example:
 * ["v0.7.0", "v0.6.7", player, 2] call afl_main_fnc_mismatch;
 *
 * Public: No
 */
params ["_remoteVersion", "_localVersion", "_unit", "_level"];

ERROR_MSG_2("AFL Version Mismatch!\nLocal AFL version %2 does not match server's version %1!\nPlease update your AFL version by repairing your mod in the launcher or by downloding a new version on GitHub.",_remoteVersion,_localVersion);
