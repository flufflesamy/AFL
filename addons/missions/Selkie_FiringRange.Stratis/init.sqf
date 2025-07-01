#include "..\script_component.hpp"

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

[fr_medicalConsole,
[[fr_stretcher_0, "Stretcher A"],
[fr_stretcher_1, "Stretcher B"],
[fr_stretcher_2, "Stretcher C"]]] call EFUNC(medicalsim,addSimMenu);
