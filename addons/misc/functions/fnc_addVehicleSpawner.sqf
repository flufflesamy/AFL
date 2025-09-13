#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Adds a vehicle spawner to an eden entity.
 *
 * Arguments:
 * 0: Eden Entity <OBJECT>
 * 1: Vehicle Name <STRING>
 * 2: Marker Name <STRING>
 *
 * Return Value:
 * Nothing.
 *
 * Example:
 * [fr_vehicleConsole, "OPTRE_FC_Wraith_Tank", "mkrVehClose"] call afl_misc_fnc_addVehicleSpawner
 *
 * Public: Yes
 */
params ["_entity", "_vehicleName", "_markerName"];
TRACE_3("addVehicleSpawner",_entity,_vehicleName,_markerName);

_entity addAction [
    format ["Spawn %1 on %2",_vehicleName,_markerName],
    {
        params ["_target", "_caller", "_actionId", "_args"];
        _args params ["_entity", "_vehicleName", "_markerName"];

        [_vehicleName, _markerName, _entity, _caller] call FUNC(createVehOnMarker);
        INFO_2("Spawned vehicle %1 on marker %2.",_vehicleName,_markerName);
    },
    _this,
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
