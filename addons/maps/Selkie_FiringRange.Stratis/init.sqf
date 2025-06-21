#include "configs\script_macros.hpp"

// Initalize vehicle console 
AVAR(vehicleConsole) addAction ["Spawn Wraith Close", 
{["OPTRE_FC_Wraith_Tank", "mkrVehClose"] call AFUNC(createVehOnMarker);}];
AVAR(vehicleConsole) addAction ["Spawn Wraith Medium", 
{["OPTRE_FC_Wraith_Tank", "mkrVehMed"] call AFUNC(createVehOnMarker);}];
AVAR(vehicleConsole) addAction ["Spawn Wraith Medium-Far", 
{["OPTRE_FC_Wraith_Tank", "mkrVehMedFar"] call AFUNC(createVehOnMarker);}];
AVAR(vehicleConsole) addAction ["Spawn Wraith Far", 
{["OPTRE_FC_Wraith_Tank", "mkrVehFar"] call AFUNC(createVehOnMarker);}];

// Initialize medical console
