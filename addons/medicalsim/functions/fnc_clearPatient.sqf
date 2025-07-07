#include "..\script_component.hpp"
/*
	Author: flufflesamy

	Description:
		Spawns patient for medical treatment with specific ailment.

	Parameter(s):
		0: Eden entity holding patient <OBJECT>

	Returns:
		Nothing

	Examples:
		fr_stretcher_0 call afl_medicalsim_fnc_clearPatient;
*/

params ["_entity"];
TRACE_1("clearPatient",_entity);

if (isNil "_entity") exitWith {ERROR_1("%1 is not a valid entity.",_entity)};

private _patient = _entity getVariable [QGVAR(simPatient), nil];

if !(isNil "_patient") then {
    deleteVehicle _patient;
    TRACE_2("Deleted patient from entity.",_patient,_entity);
} else {
    TRACE_1("Patient does not exist in entity, exiting.",_entity);
};
