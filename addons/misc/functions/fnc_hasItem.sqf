#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Checks if unit has an item.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item <STRING>
 *
 * Return Value:
 * 0: Has Item <BOOL>
 *
 * Example:
 * [player, "AFL_statusMonitor"] call afl_misc_fnc_hasItem
 *
 * Public: Yes
 */
params ["_unit", "_item"];

private _unitItems = uniqueUnitItems _unit;
private _hasItem = false;

_hasItem = _item in _unitItems;

_hasItem;
