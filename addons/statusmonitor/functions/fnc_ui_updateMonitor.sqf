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

// Get monitor type
_monitorType = player getVariable [QGVAR(monitorType), 1];

private _baseCG = _display displayCtrl IDC_ENTRIES_CG;

{
    _x params ["_unitName", "_unitPR", "_inRange", "_unitDistance"];

    // Exit if number of group members exceeds 8 (incl player)
    if (_forEachIndex > 7) exitWith {
        WARNING("Status monitor patients exceeds limit.");
    };

    private _entryGroup = _display ctrlCreate [QGVAR(RscEntryGroup), -1, _baseCG]; // Create control group
    _createdEntries pushBack _entryGroup; // Add control to array

    // Get controls
    private _nameCtrl = _entryGroup controlsGroupCtrl IDC_NAME;
    private _prCtrl = _entryGroup controlsGroupCtrl IDC_PR;
    private _crossCtrl = _entryGroup controlsGroupCtrl IDC_CROSS;
    private _heartCtrl = _entryGroup controlsGroupCtrl IDC_HEART;
    private _pillCtrl = _entryGroup controlsGroupCtrl IDC_PILL;
    private _barsCtrl = _entryGroup controlsGroupCtrl IDC_RANGEBARS;
    private _barsCrossCtrl = _entryGroup controlsGroupCtrl IDC_RANGEBARS_CROSS;
    private _barsOutlineCtrl = _entryGroup controlsGroupCtrl IDC_RANGEBARS_OL;
    private _distance = _entryGroup controlsGroupCtrl IDC_DISTANCE;

    // Initialize options
    private _options = createHashMapFromArray [
        ["pillColor", GVAR(normalColor)],
        ["showPR", false],
        ["showBars", false],
        ["showCross", false]
    ];

    // if unit is in range
    if (_inRange) then {
        // If unit has HR
        if (_unitPR > 0) then {
            _options set ["showPR", true]; // Show text

            if (_unitPR > 130 || _unitPR < 60) then {
                _options set ["pillColor", GVAR(abnormalColor)];
            };
        } else { // If unit has no HR
            _options set ["pillColor", GVAR(criticalColor)];

            if GVAR(showCross) then {
                _options set ["showCross", true];
            } else {
                _options set ["showPR", true]; // Show text
            };
        };
    } else { // If not in range
        // If out of range option selected
        if GVAR(showOOR) then {
            _options set ["pillColor", GVAR(oorColor)];
            _options set ["showBars", true];
        } else { // If not
            _options set ["pillColor", GVAR(criticalColor)];
            _options set ["showCross", true];
        };
    };

    // Assign options to variables
    private _pillColor = _options get "pillColor";
    private _showCross = _options get "showCross";
    private _showBars = _options get "showBars";
    private _showPR = _options get "showPR";

    // Set CG position
    _entryGroup ctrlSetPosition [0, POS_H(11 - (_forEachIndex + 1) * 1.35)];

    // Set color based on options
    _pillCtrl ctrlSetTextColor _pillColor;
    _barsOutlineCtrl ctrlSetTextColor _pillColor;

    // Set text / asset color
    _nameCtrl ctrlSetTextColor GVAR(textColor);
    _prCtrl ctrlSetTextColor GVAR(textColor);
    _crossCtrl ctrlSetTextColor GVAR(textColor);
    _heartCtrl ctrlSetTextColor GVAR(heartColor);
    _barsCtrl ctrlSetTextColor GVAR(textColor);
    _barsOutlineCtrl ctrlSetTextColor GVAR(oorColor);
    _barsCrossCtrl ctrlSetTextColor GVAR(textColor);
    _distance ctrlSetTextColor GVAR(textColor);

    // Set text
    _nameCtrl ctrlSetText _unitName;

    // Show controls based on options
    _crossCtrl ctrlShow _showCross;
    _barsCtrl ctrlShow _showBars;
    _barsOutlineCtrl ctrlShow _showBars;
    _barsCrossCtrl ctrlShow _showBars;
    _prCtrl ctrlShow _showPR;

    // Set based on monitor type
    if (_monitorType == 1) then {
        _prCtrl ctrlSetText format ["%1", floor _unitPR];
        _heartCtrl ctrlShow _showPR;
        _distance ctrlShow false;
    } else {
        _prCtrl ctrlSetText format ["%1m", floor _unitDistance];
        _distance ctrlShow _showPR;
        _heartCtrl ctrlShow false;
    };

    // Commit changes
    _crossCtrl ctrlCommit 0;
    _heartCtrl ctrlCommit 0;
    _pillCtrl ctrlCommit 0;
    _prCtrl ctrlCommit 0;
    _nameCtrl ctrlCommit 0;
    _barsCtrl ctrlCommit 0;
    _barsOutlineCtrl ctrlCommit 0;
    _barsCrossCtrl ctrlCommit 0;
    _entryGroup ctrlCommit 0;
} forEach _units;

uiNamespace setVariable [QGVAR(createdEntries), _createdEntries]; // Set controls array
