// // Enable checkbox
// [
//     QGVAR(enable),
//     "CHECKBOX",
//     "Enable:",
//     ["AFL Medical"],
//     [true],
//     true
// ] call CFUNC(addSetting);

[
    QGVAR(bandageTimeS),
    "SLIDER",
    "Base Bandage Time (S)",
    ["AFL Medical", "Bandaging"],
    [0, 20, 4, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(bandageTimeM),
    "SLIDER",
    "Base Bandage Time (M)",
    ["AFL Medical", "Bandaging"],
    [0, 20, 6, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(bandageTimeL),
    "SLIDER",
    "Base Bandage Time (L)",
    ["AFL Medical", "Bandaging"],
    [0, 20, 8, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(neckTourniquet),
    "CHECKBOX",
    "Enable Neck Tourniquet",
    ["AFL Medical", "Tourniquet"],
    [false],
    true
] call CFUNC(addSetting);
