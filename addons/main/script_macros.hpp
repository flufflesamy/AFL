#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
#include "script_debug.hpp"

// #define AFUNC(var) TRIPLES(ADDON,fnc,var)
// #define AVAR(v) DOUBLES(ADDON,v)
// #define QAVAR(v) QUOTE(AVAR(v))
// #define QDAVAR(var1, var2) DOUBLES(AVAR(var1),var2)
#define ENTVAR(var1) DOUBLES(fr,var1)
#define QENTVAR(var1) QUOTE(ENTVAR(var1))

// AFL macros
#define FRACTURE_TYPE ["none", "simple", "compound", "comminuted"]
#define PNUMO_TYPE ["initial", "tension", "hepo"]

// CBA xeh PREP override
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(function) TRIPLES(ADDON,fnc,function) = compile preprocessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,function).sqf'
#else
    #undef PREP
    #define PREP(function) ['\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,function).sqf', 'TRIPLES(ADDON,fnc,function)'] call SLX_XEH_COMPILE_NEW
#endif

// CBA macros
#define CBA_PREFIX cba
#define CBA_ADDON(component) DOUBLES(CBA_PREFIX,component)

#define CFUNC(function) TRIPLES(CBA_PREFIX,fnc,function)
#define QCFUNC(function) QUOTE(CFUNC(function))

#define CEFUNC(module,function) TRIPLES(DOUBLES(CBA_PREFIX,module),fnc,function)
#define QCEFUNC(module,function) QUOTE(CEFUNC(module,function))

// KAM macros
#define KAM_PREFIX kat

#define KAM_ADDON(component) DOUBLES(KAM_PREFIX,component)

#define KEFUNC(module,function) TRIPLES(DOUBLES(KAM_PREFIX,module),fnc,function)
#define QKEFUNC(module,function) QUOTE(KEFUNC(module,function))

#define KEGVAR(module,var) TRIPLES(KAM_PREFIX,module,var)
#define QKEGVAR(module,var) QUOTE(KEGVAR(module,var))

// BEGIN ACE3 medical reference macros (from KAM)

#define ACE_PREFIX ace

#define ACE_ADDON(component)        DOUBLES(ACE_PREFIX,component)

#define ACEGVAR(module,var)         TRIPLES(ACE_PREFIX,module,var)
#define QACEGVAR(module,var)        QUOTE(ACEGVAR(module,var))
#define QQACEGVAR(module,var)       QUOTE(QACEGVAR(module,var))

#define ACEFUNC(module,function)    TRIPLES(DOUBLES(ACE_PREFIX,module),fnc,function)
#define QACEFUNC(module,function)   QUOTE(ACEFUNC(module,function))

#define ACELSTRING(module,string)   QUOTE(TRIPLES(STR,DOUBLES(ACE_PREFIX,module),string))
#define ACELLSTRING(module,string)  localize ACELSTRING(module,string)
#define ACECSTRING(module,string)   QUOTE(TRIPLES($STR,DOUBLES(ACE_PREFIX,module),string))

#define ACEPATHTOF(component,path) \z\ace\addons\component\path
#define QACEPATHTOF(component,path) QUOTE(ACEPATHTOF(component,path))

// Macros for checking if unit is in medical vehicle or facility
// Defined mostly to make location check in canTreat more readable
#define IN_MED_VEHICLE(unit)  (unit call ACEFUNC(medical_treatment,isInMedicalVehicle))
#define IN_MED_FACILITY(unit) (unit call ACEFUNC(medical_treatment,isInMedicalFacility))

#define TREATMENT_LOCATIONS_ALL 0
#define TREATMENT_LOCATIONS_VEHICLES 1
#define TREATMENT_LOCATIONS_FACILITIES 2
#define TREATMENT_LOCATIONS_VEHICLES_AND_FACILITIES 3
#define TREATMENT_LOCATIONS_NONE 4

// medical_statemachine/script_component.hpp
#define FATAL_INJURIES_ALWAYS 0
#define FATAL_INJURIES_CRDC_ARRST 1
#define FATAL_INJURIES_NEVER 2

#undef BLOOD_LOSS_KNOCK_OUT_THRESHOLD
#define BLOOD_LOSS_KNOCK_OUT_THRESHOLD ACEGVAR(medical,const_bloodLossKnockOutThreshold)

#undef GET_BLOOD_LOSS
#define GET_BLOOD_LOSS(unit)        ([unit] call ACEFUNC(medical_status,getBloodLoss))

// Minimum leg damage required for limping
#undef LIMPING_DAMAGE_THRESHOLD
#define LIMPING_DAMAGE_THRESHOLD ACEGVAR(medical,const_limpingDamageThreshold)

// Minimum limb damage required for fracture
#undef FRACTURE_DAMAGE_THRESHOLD
#define FRACTURE_DAMAGE_THRESHOLD ACEGVAR(medical,const_fractureDamageThreshold)

// Minimum cardiac output
#undef CARDIAC_OUTPUT_MIN
#define CARDIAC_OUTPUT_MIN ACEGVAR(medical,const_minCardiacOutput)

//We have to undef them before redefining
#undef VAR_BLOOD_PRESS
#undef VAR_BLOOD_VOL
#undef VAR_WOUND_BLEEDING
#undef VAR_CRDC_ARRST
#undef VAR_HEART_RATE
#undef VAR_PAIN
#undef VAR_PAIN_SUPP
#undef VAR_PERIPH_RES
#undef VAR_OPEN_WOUNDS
#undef VAR_BANDAGED_WOUNDS
#undef VAR_STITCHED_WOUNDS
#undef VAR_MEDICATIONS
#undef VAR_HEMORRHAGE
#undef VAR_IN_PAIN
#undef VAR_TOURNIQUET
#undef VAR_FRACTURES
#undef GET_PAIN_PERCEIVED
#undef GET_TOURNIQUETS
#undef HAS_TOURNIQUET_APPLIED_ON
#undef PAIN_UNCONSCIOUS
#undef DEFAULT_TOURNIQUET_VALUES

// These variables get stored in object space and used across components
// Defined here for easy consistency with GETVAR/SETVAR (also a list for reference)
#define VAR_BLOOD_PRESS       QACEGVAR(medical,bloodPressure)
#define VAR_BLOOD_VOL         QACEGVAR(medical,bloodVolume)
#define VAR_WOUND_BLEEDING    QACEGVAR(medical,woundBleeding)
#define VAR_CRDC_ARRST        QACEGVAR(medical,inCardiacArrest)
#define VAR_HEART_RATE        QACEGVAR(medical,heartRate)
#define VAR_PAIN              QACEGVAR(medical,pain)
#define VAR_PAIN_SUPP         QACEGVAR(medical,painSuppress)
#define VAR_PERIPH_RES        QACEGVAR(medical,peripheralResistance)
#define VAR_OPEN_WOUNDS       QACEGVAR(medical,openWounds)
#define VAR_BANDAGED_WOUNDS   QACEGVAR(medical,bandagedWounds)
#define VAR_STITCHED_WOUNDS   QACEGVAR(medical,stitchedWounds)
// These variables track gradual adjustments (from medication, etc.)
#define VAR_MEDICATIONS       QACEGVAR(medical,medications)
// These variables track the current state of status values above
#define VAR_HEMORRHAGE        QACEGVAR(medical,hemorrhage)
#define VAR_IN_PAIN           QACEGVAR(medical,inPain)
#define VAR_TOURNIQUET        QACEGVAR(medical,tourniquets)
#define VAR_FRACTURES         QACEGVAR(medical,fractures)

// - Unit Functions ---------------------------------------------------
// Retrieval macros for common unit values
// Defined for easy consistency and speed
#undef GET_SM_STATE
#define GET_SM_STATE(_unit)         ([_unit, ACEGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState)

#undef GET_BLOOD_VOLUME

#define GET_OPIOID_FACTOR(unit)           (unit getVariable [QEGVAR(pharma,opioidFactor), 0])
#define GET_PAIN_PERCEIVED(unit)    (0 max ((GET_PAIN(unit) - GET_PAIN_SUPPRESS(unit)) min 1))

#undef GET_DAMAGE_THRESHOLD
#define GET_DAMAGE_THRESHOLD(unit)  ((unit getVariable [QACEGVAR(medical,damageThreshold), [ACEGVAR(medical,AIDamageThreshold),ACEGVAR(medical,playerDamageThreshold)] select (isPlayer unit)]) * (GET_OPIOID_FACTOR(unit) + 1))

#define DEFAULT_TOURNIQUET_VALUES   [0,0,0,0,0,0]
#define GET_TOURNIQUETS(unit)       (unit getVariable [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES])
#define GET_SURGICAL_TOURNIQUETS(unit)       (unit getVariable [QEGVAR(surgery,surgicalBlock), DEFAULT_TOURNIQUET_VALUES])
#define HAS_TOURNIQUET_APPLIED_ON(unit,index) ((GET_TOURNIQUETS(unit) select index) > 0 )
#define HAS_TOURNIQUET_ACTUAL(unit,index) (((GET_TOURNIQUETS(unit) select index) > 0) && ((GET_SURGICAL_TOURNIQUETS(unit) select index) < 1))

#define PAIN_UNCONSCIOUS ACEGVAR(medical,painUnconsciousThreshold)

// END ACE3 reference macros
