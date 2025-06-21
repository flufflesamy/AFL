#include "..\script_component.hpp"

// Initalize vehicle console 
fr_vehicleConsole addAction ["Spawn Wraith Close", 
{["OPTRE_FC_Wraith_Tank", "mkrVehClose"] call EFUNC(common,createVehOnMarker);}];
fr_vehicleConsole addAction ["Spawn Wraith Medium", 
{["OPTRE_FC_Wraith_Tank", "mkrVehMed"] call EFUNC(common,createVehOnMarker);}];
fr_vehicleConsole addAction ["Spawn Wraith Medium-Far", 
{["OPTRE_FC_Wraith_Tank", "mkrVehMedFar"] call EFUNC(common,createVehOnMarker);}];
fr_vehicleConsole addAction ["Spawn Wraith Far", 
{["OPTRE_FC_Wraith_Tank", "mkrVehFar"] call EFUNC(common,createVehOnMarker);}];

// Initialize medical console
