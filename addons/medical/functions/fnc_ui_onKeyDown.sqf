#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * The following code is a derivative work of the code from the ACE project,
 * which is licensed under GPLv2 or later. This code is therefore licensed
 * under the terms of the GNU Public License, version 3.
 *
 * Author: AmsteadRayle, flufflesamy
 * Handles keyboard inputs in medical menu.
 *
 * Arguments:
 * 1: Args <ARRAY>
 * - 0: Menu display <DISPLAY>
 * - 1: Key being pressed <NUMBER>
 * - 2: Shift state <BOOL>
 * - 3: Ctrl state <BOOL>
 * - 4: Alt state <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["", [displayNull, 5, false, false, false]] call afl_medical_fnc_ui_onKeyDown
 *
 * Public: No
 */
#define NUMBER_KEYS [DIK_1, DIK_2, DIK_3, DIK_4, DIK_5, DIK_6, DIK_7, DIK_8, DIK_9, DIK_0]
#define ALL_CATEGORIES ["triage", "examine", "bandage", "medication", "airway", "advanced", "surgery", "drag", "toggle"]
#define CATEGORY_IDC [1300, 1310, 1320, 1330, 1340, 1350, 1385, 1360, 1370]

params ["", "_args"];
_args params ["", "_keyPressed", "", "", ""];

private _return = true; // Override existing keybinds for keys used here

// Use hashmap as a shortcut to "zip" two arrays together
// Use categories as keys in hashmap because there are fewer,
// otherwise the hashmap is padded with nil
private _keyCategoryPairs = ALL_CATEGORIES createHashMapFromArray NUMBER_KEYS;
private _idcCategoryPairs = ALL_CATEGORIES createHashMapFromArray CATEGORY_IDC;

private _category = "";
private _idc = 0;

switch (true) do {
// Dynamically assign number keys to visible categories
    {
        _category = _x; // _x does not exist inside case code
        _idc = _idcCategoryPairs get _x;
        case (_keyPressed == _y && {ACEGVAR(medical_gui,selectedCategory) != _category}): {
            if (ctrlEnabled _idc) then {
                if (_category == "toggle") then {
                    call ACEFUNC(medical_gui,handleToggle);
                } else {
                    ACEGVAR(medical_gui,selectedCategory) = _category;
                };
            } else {
                _return = false;
            };
        };
    } forEach _keyCategoryPairs;

// Select body part through similar keyboard layout:
//     w
//   a s d
//    z x
    case (_keyPressed == DIK_W && {ACEGVAR(medical_gui,selectedBodyPart) != 0}): {
        ACEGVAR(medical_gui,selectedBodyPart) = 0;
    };
    case (_keyPressed == DIK_S && {ACEGVAR(medical_gui,selectedBodyPart != 1)}): {
        ACEGVAR(medical_gui,selectedBodyPart) = 1;
    };
    case (_keyPressed == DIK_D && {ACEGVAR(medical_gui,selectedBodyPart) != 2}): {
        ACEGVAR(medical_gui,selectedBodyPart) = 2;
    };
    case (_keyPressed == DIK_A && {ACEGVAR(medical_gui,selectedBodyPart) != 3}): {
        ACEGVAR(medical_gui,selectedBodyPart) = 3;
    };
    case (_keyPressed == DIK_X && {ACEGVAR(medical_gui,selectedBodyPart) != 4}): {
        ACEGVAR(medical_gui,selectedBodyPart) = 4;
    };
    case (_keyPressed == DIK_Z && {ACEGVAR(medical_gui,selectedBodyPart) != 5}): {
        ACEGVAR(medical_gui,selectedBodyPart) = 5;
    };

    default {
        _return = false; // Do not override existing keybinds for keys not used here
    };
};

if (_return) then {
    playSound ["SoundClick", true]
};

_return
