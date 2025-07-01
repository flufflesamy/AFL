#include "\z\afl\addons\missions\script_component.hpp"

// Initalize vehicle console
fr_vehicleConsole addAction [
    "Spawn Wraith Close",
    {
        ["OPTRE_FC_Wraith_Tank", "mkrVehClose", fr_vehicleConsole] call EFUNC(common,createVehOnMarker);
    },
    nil,
    1.5,
    true,
    true,
    "",
    "true",
    5,
    false,
    "",
    ""
];
fr_vehicleConsole addAction [
    "Spawn Wraith Medium",
    {
        ["OPTRE_FC_Wraith_Tank", "mkrVehMed", fr_vehicleConsole] call EFUNC(common,createVehOnMarker);
    },
    nil,
    1.5,
    true,
    true,
    "",
    "true",
    5,
    false,
    "",
    ""
];
fr_vehicleConsole addAction [
    "Spawn Wraith Medium-Far",
    {
        ["OPTRE_FC_Wraith_Tank", "mkrVehMedFar", fr_vehicleConsole] call EFUNC(common,createVehOnMarker);
    },
    nil,
    1.5,
    true,
    true,
    "",
    "true",
    5,
    false,
    "",
    ""
];
fr_vehicleConsole addAction [
    "Spawn Wraith Far",
    {
        ["OPTRE_FC_Wraith_Tank", "mkrVehFar", fr_vehicleConsole] call EFUNC(common,createVehOnMarker);
    },
    nil,
    1.5,
    true,
    true,
    "",
    "true",
    5,
    false,
    "",
    ""
];

// Initialize medical console

private _stretchers = [
    [fr_stretcher_0, "Stretcher 0"],
    [fr_stretcher_1, "Stretcher 1"],
    [fr_stretcher_2, "Stretcher 2"],
    [fr_stretcher_3, "Stretcher 3"],
    [fr_stretcher_4, "Stretcher 4"],
    [fr_stretcher_5, "Stretcher 5"],
    [fr_stretcher_6, "Stretcher 6"]
];

[fr_medicalConsole_0, _stretchers] call EFUNC(medicalsim,addSimMenu);
[fr_medicalConsole_1, _stretchers] call EFUNC(medicalsim,addSimMenu);
