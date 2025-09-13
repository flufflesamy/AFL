#include "\z\afl\addons\missions\script_component.hpp"

// Initalize vehicle console
[fr_vehicleConsole, "OPTRE_FC_Wraith_Tank", "mkrVehClose"] call EFUNC(misc,addVehicleSpawner);
[fr_vehicleConsole, "OPTRE_FC_Wraith_Tank", "mkrVehMed"] call EFUNC(misc,addVehicleSpawner);
[fr_vehicleConsole, "OPTRE_FC_Wraith_Tank", "mkrVehMedFar"] call EFUNC(misc,addVehicleSpawner);
[fr_vehicleConsole, "OPTRE_FC_Wraith_Tank", "mkrVehFar"] call EFUNC(misc,addVehicleSpawner);

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
