[
    QGVAR(updateInterval),
    "SLIDER",
    [LLSTRING(Setting_UpdateInterval), LLSTRING(Setting_UpdateInterval_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_ServerCategory)],
    [0, 10, 5, 0],
    1
] call CFUNC(addSetting);

[
    QGVAR(monitorRange),
    "SLIDER",
    [LLSTRING(Setting_MonitorRange), LLSTRING(Setting_MonitorRange_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_ServerCategory)],
    [0, 1000, 100, 0],
    1
] call CFUNC(addSetting);

[
    QGVAR(showCross),
    "CHECKBOX",
    [LLSTRING(Setting_showCross), LLSTRING(Setting_showCross_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_ServerCategory)],
    false,
    1
] call CFUNC(addSetting);

[
    QGVAR(showOOR),
    "CHECKBOX",
    [LLSTRING(Setting_showOOR), LLSTRING(Setting_showOOR_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_ServerCategory)],
    false,
    1
] call CFUNC(addSetting);

[
    QGVAR(textColor),
    "COLOR",
    [LLSTRING(Setting_TextColor), LLSTRING(Setting_TextColor_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_UserCategory)],
    [1, 1, 1, 1],
    2
] call CFUNC(addSetting);

[
    QGVAR(normalColor),
    "COLOR",
    [LLSTRING(Setting_NormalColor), LLSTRING(Setting_NormalColor_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_UserCategory)],
    [0.35, 0.76, 1, 1],
    2
] call CFUNC(addSetting);

[
    QGVAR(abnormalColor),
    "COLOR",
    [LLSTRING(Setting_AbnormalColor), LLSTRING(Setting_AbnormalColor_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_UserCategory)],
    [1, 0.82, 0.25, 1],
    2
] call CFUNC(addSetting);

[
    QGVAR(OORColor),
    "COLOR",
    [LLSTRING(Setting_OORColor), LLSTRING(Setting_OORColor_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_UserCategory)],
    [0.3, 0.3, 0.3, 1],
    2
] call CFUNC(addSetting);

[
    QGVAR(criticalColor),
    "COLOR",
    [LLSTRING(Setting_CriticalColor), LLSTRING(Setting_CriticalColor_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_UserCategory)],
    [1, 0.35, 0.47, 1],
    2
] call CFUNC(addSetting);

[
    QGVAR(heartColor),
    "COLOR",
    [LLSTRING(Setting_HeartColor),LLSTRING(Setting_HeartColor_Description)],
    [LLSTRING(Setting_MainCategory), LLSTRING(Setting_UserCategory)],
    [1, 0.35, 0.47, 1],
    2
] call CFUNC(addSetting);
