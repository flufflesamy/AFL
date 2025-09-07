[
    QGVAR(bandageTimeS),
    "SLIDER",
    [LLSTRING(Setting_BandageTimeS), LLSTRING(Setting_BandageTimeS_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_Bandaging)],
    [0, 20, 4, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(bandageTimeM),
    "SLIDER",
    [LLSTRING(Setting_BandageTimeM), LLSTRING(Setting_BandageTimeM_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_Bandaging)],
    [0, 20, 6, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(bandageTimeL),
    "SLIDER",
    [LLSTRING(Setting_BandageTimeL), LLSTRING(Setting_BandageTimeL_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_Bandaging)],
    [0, 20, 8, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(neckTourniquet),
    "CHECKBOX",
    [LLSTRING(STR_AFL_Medical_Setting_NeckTourniquet), LLSTRING(STR_AFL_Medical_Setting_NeckTourniquet_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_Bandaging)],
    [false],
    true
] call CFUNC(addSetting);

[
    QGVAR(enableFluidBlock),
    "CHECKBOX",
    [LLSTRING(STR_AFL_Medical_Setting_IV_BlockEnable), LLSTRING(STR_AFL_Medical_Setting_IV_BlockEnable_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_IV)],
    [false],
    true
] call CFUNC(addSetting);

[
    QGVAR(fluidBlockCoef),
    "SLIDER",
    [LLSTRING(STR_AFL_Medical_Setting_IV_BlockCoef), LLSTRING(STR_AFL_Medical_Setting_IV_BlockCoef_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_IV)],
    [0.05, 10.00, 1.00, 2, false],
    true
] call CFUNC(addSetting);
