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
    QGVAR(npwtSelfTreatment),
    "LIST",
    [LLSTRING(Setting_NPWTSelfTreatment), LLSTRING(Setting_NPWTSelfTreatment_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_NPWT)],
    [
        [0, 1, 2],
        [
            LLSTRING(Setting_NPWTSelfTreatment_No),
            LLSTRING(Setting_NPWTSelfTreatment_BodyAndLegs),
            LLSTRING(Setting_NPWTSelfTreatment_Yes)
        ],
        0 // Default is No
    ],
    true
] call CFUNC(addSetting);

[
    QGVAR(npwtBandageTime),
    "SLIDER",
    [LLSTRING(Setting_NPWTBandageTime), LLSTRING(Setting_NPWTBandageTime_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_NPWT)],
    [0, 10, 3, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(npwtStitchTime),
    "SLIDER",
    [LLSTRING(Setting_NPWTStitchTime), LLSTRING(Setting_NPWTStitchTime_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_NPWT)],
    [0, 10, 2, 1],
    true
] call CFUNC(addSetting);

[
    QGVAR(npwtNormalize),
    "CHECKBOX",
    [LLSTRING(Setting_NPWTNormalize), LLSTRING(Setting_NPWTNormalize_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_NPWT)],
    [true],
    true
] call CFUNC(addSetting);

[
    QGVAR(npwtNormalizeProp),
    "SLIDER",
    [LLSTRING(Setting_NPWTNormalizeProp), LLSTRING(Setting_NPWTNormalizeProp_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_NPWT)],
    [0, 1, 0.50, 2, true],
    true
] call CFUNC(addSetting);

[
    QGVAR(npwtNormalizeCoef),
    "SLIDER",
    [LLSTRING(Setting_NPWTNormalizeCoef), LLSTRING(Setting_NPWTNormalizeCoef_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_NPWT)],
    [0, 5, 1.00, 2],
    true
] call CFUNC(addSetting);

[
    QGVAR(neckTourniquet),
    "CHECKBOX",
    [LLSTRING(Setting_NeckTourniquet), LLSTRING(Setting_NeckTourniquet_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_Bandaging)],
    [false],
    true
] call CFUNC(addSetting);

[
    QGVAR(enableFluidBlock),
    "CHECKBOX",
    [LLSTRING(Setting_IV_BlockEnable), LLSTRING(Setting_IV_BlockEnable_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_IV)],
    [false],
    true
] call CFUNC(addSetting);

[
    QGVAR(fluidBlockCoef),
    "SLIDER",
    [LLSTRING(Setting_IV_BlockCoef), LLSTRING(Setting_IV_BlockCoef_Description)],
    [LLSTRING(Setting_Category), LLSTRING(Setting_IV)],
    [0.05, 10.00, 1.00, 2, false],
    true
] call CFUNC(addSetting);
