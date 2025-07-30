#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Get unit status based on distance.

	Parameter(s):
        0: Units <ARRAY>
            0: Unit Name <STRING>
            1: Unit PR <NUMBER>
            2: In Range <BOOL>

	Returns:
        Nothing

	Examples:
		[] call afl_statusmonitor_fnc_canShow
*/
params ["_display", "_units"];
TRACE_2("ui_updateMonitor",_display,_units);

private _createdEntries = uiNamespace getVariable [QGVAR(createdEntries), []];

// Delete old controls
_createdEntries apply {
    ctrlDelete _x;
};

// Initialize array of controls
_createdEntries = [];

private _baseCG = _display displayCtrl IDC_ENTRIES_CG;

{
    _x params ["_unitName", "_unitPR", "_inRange"];

    // Exit if number of group members exceeds 8 (incl player)
    if (_forEachIndex > 7) exitWith {
        WARNING("Status monitor patients exceeds limit.");
    };

    private _entryGroup = _display ctrlCreate [QGVAR(RscEntryGroup), -1, _baseCG]; // Create control group
    _createdEntries pushBack _entryGroup; // Add control to array

    private _nameCtrl = _entryGroup controlsGroupCtrl IDC_NAME;
    private _prCtrl = _entryGroup controlsGroupCtrl IDC_PR;
    private _crossCtrl = _entryGroup controlsGroupCtrl IDC_CROSS;
    private _heartCtrl = _entryGroup controlsGroupCtrl IDC_HEART;
    private _pillCtrl = _entryGroup controlsGroupCtrl IDC_PILL;

    _entryGroup ctrlSetPosition [0, POS_H(11 - (_forEachIndex + 1) * 1.35)]; // Set CG position

    // Set text
    _nameCtrl ctrlSetText _unitName;
    _prCtrl ctrlSetText format ["%1", floor _unitPR];

    // Set text / asset color
    _nameCtrl ctrlSetTextColor GVAR(textColor);
    _prCtrl ctrlSetTextColor GVAR(textColor);
    _crossCtrl ctrlSetTextColor GVAR(textColor);
    _heartCtrl ctrlSetTextColor GVAR(heartColor);

    // if unit is in range
    if (_inRange) then {
        _crossCtrl ctrlShow false; // Hide cross
        _heartCtrl ctrlShow true; // Show heart
        _prCtrl ctrlShow true; // Show PR

        if (_unitPR > 130 || _unitPR < 60) then {
            _pillCtrl ctrlSetTextColor GVAR(abnormalColor); // Set abnormal color
        } else {
            _pillCtrl ctrlSetTextColor GVAR(normalColor); // Set normal color
        }
    };

    // Show cross on PR 0 if option checked or out of range
    if ((GVAR(showCross) && _unitPR == 0) || !_inRange) then {
        _pillCtrl ctrlSetTextColor GVAR(criticalColor); // Set critical color
        _crossCtrl ctrlShow true; // Show cross
        _heartCtrl ctrlShow false; // Hide heart
        _prCtrl ctrlShow false; // Hide PR
    };

    // Commit changes
    _crossCtrl ctrlCommit 0;
    _heartCtrl ctrlCommit 0;
    _pillCtrl ctrlCommit 0;
    _prCtrl ctrlCommit 0;
    _nameCtrl ctrlCommit 0;
    _entryGroup ctrlCommit 0;
} forEach _units;

uiNamespace setVariable [QGVAR(createdEntries), _createdEntries]; // Set controls array
