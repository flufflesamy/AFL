#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
#include "script_debug.hpp"

// UI
#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

// #define AFUNC(var) TRIPLES(ADDON,fnc,var)
// #define AVAR(v) DOUBLES(ADDON,v)
// #define QAVAR(v) QUOTE(AVAR(v))
// #define QDAVAR(var1, var2) DOUBLES(AVAR(var1),var2)
#define ENTVAR(var1) DOUBLES(fr,var1)
#define QENTVAR(var1) QUOTE(ENTVAR(var1))

// CBA xeh PREP override
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(function) TRIPLES(ADDON,fnc,function) = compile preprocessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,function).sqf'
#else
    #undef PREP
    #define PREP(function) ['\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,function).sqf', 'TRIPLES(ADDON,fnc,function)'] call SLX_XEH_COMPILE_NEW
#endif

// AFL macros
#define FRACTURE_TYPE ["none", "simple", "compound", "comminuted"]
#define PNUMO_TYPE ["none", "initial", "tension", "hemo"]
#define ARREST_TYPE ["none", "asystole", "pea", "vf", "vt"]

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

// KAT Macros
#define DEFAULT_PACO2 40
#define DEFAULT_PAO2 90
#define DEFAULT_O2SAT 0.96
#define DEFAULT_HCO3 24
#define DEFAULT_PH 7.4
#define DEFAULT_ETCO2 37
#define DEFAULT_BLOOD_GAS [DEFAULT_PACO2, DEFAULT_PAO2, DEFAULT_O2SAT, DEFAULT_HCO3, DEFAULT_PH, DEFAULT_ETCO2]
#define DEFAULT_RESPIRATORY_DEPTH       10

#define DEFAULT_ANEROBIC_EXCHANGE 0.8
#define DEFAULT_TEMPERATURE 37

#define DEFAULT_ECB 2700
#define DEFAULT_ECP 3300
#define DEFAULT_SRBC 500
#define DEFAULT_ISP 10000
#define DEFAULT_BODY_FLUID [2700, 3300, 500, 10000, 6000]

#define LITERS_TO_ML 1000
#define ML_TO_LITERS 1000

// Airway
#define OXYGEN_PERCENTAGE_CRITICAL 85
#define OXYGEN_PERCENTAGE_ARREST 80
#define OXYGEN_PERCENTAGE_FATAL 75

// Breathing
#define VAR_SURFACE_AREA                400
#define GET_KAT_SURFACE_AREA(unit)      (VAR_SURFACE_AREA - (((unit getVariable [QKEGVAR(breathing,pneumothorax), 0]) * 75)))

#define VAR_RESPIRATORY_DEPTH           QKEGVAR(vitals,respiratoryDepth)
#define GET_KAT_RESPIRATORY_DEPTH(unit)      (unit getVariable [QKEGVAR(vitals,respiratoryDepth), 10])

#define VAR_BLOOD_GAS                  QKEGVAR(circulation,bloodGas)
#define VAR_BREATHING_RATE             QKEGVAR(breathing,breathRate)

#define GET_BLOOD_GAS(unit)            (unit getVariable [VAR_BLOOD_GAS, DEFAULT_BLOOD_GAS])
#define GET_PAO2(unit)                 ((unit getVariable [VAR_BLOOD_GAS, DEFAULT_BLOOD_GAS]) select 1)
#define GET_KAT_SPO2(unit)             (((unit getVariable [VAR_BLOOD_GAS, DEFAULT_BLOOD_GAS]) select 2) * 100)
#define GET_PH(unit)                   ((unit getVariable [VAR_BLOOD_GAS, DEFAULT_BLOOD_GAS]) select 4)
#define GET_ETCO2(unit)                ((unit getVariable [VAR_BLOOD_GAS, DEFAULT_BLOOD_GAS]) select 5)
#define GET_BREATHING_RATE(unit)       (unit getVariable [VAR_BREATHING_RATE, 15])

// Circulation
#define VAR_INTERNAL_BLEEDING          QKEGVAR(circulation,internalBleeding)
#define GET_INTERNAL_BLEEDING(unit)    (unit getVariable [VAR_INTERNAL_BLEEDING, 0])

#define VAR_BODY_FLUID                 QKEGVAR(circulation,bodyFluid)
#define GET_BODY_FLUID(unit)           (unit getVariable [VAR_BODY_FLUID, DEFAULT_BODY_FLUID])

#define GET_BLOOD_VOLUME_LITERS(unit)  ((GET_BODY_FLUID(unit) select 4) / 1000)
#define GET_BLOOD_VOLUME_ML(unit)      (GET_BODY_FLUID(unit) select 4)
#define GET_SIMPLE_BLOOD_VOLUME(unit)  (unit getVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME])

#define REDUCE_TOTAL_BLOOD_VOLUME(unit,volume) (unit setVariable [VAR_BODY_FLUID, [(GET_BODY_FLUID(unit) select 0) - (volume / 2), (GET_BODY_FLUID(unit) select 1) - (volume / 2), (GET_BODY_FLUID(unit) select 2), (GET_BODY_FLUID(unit) select 3), (GET_BODY_FLUID(unit) select 4) - volume], true])

#undef GET_BLOOD_PRESSURE
#define GET_BLOOD_PRESSURE(unit)       ([unit] call KEFUNC(circulation,getBloodPressure))
#define VAR_BLOODPRESSURE_CHANGE       QKEGVAR(circulation,bloodPressureChange)
#define GET_BLOODPRESSURE_CHANGE(unit) (unit getVariable [VAR_BLOODPRESSURE_CHANGE, [0,0]])

// Pharma
#define VAR_VASOCONSTRICTION           QKEGVAR(pharma,alphaAction)
#define GET_VASOCONSTRICTION(unit)     (unit getVariable [VAR_VASOCONSTRICTION, 1])

//Surgery
#define STRING_BODY_PARTS ["head", "body", "left arm", "right arm", "left leg", "right leg"]
#define GET_REBOA_VOLUME(unit)         ([unit] call KEFUNC(surgery,reboaVolume))

//Feedback
#define VAR_PP QKEGVAR(feedback,ppEffect)
#define GET_PP(unit) (unit getVariable [VAR_PP, 0])

#define IS_AIRPOISONED(unit) (unit getVariable [QKEGVAR(chemical,airPoisoning), false])
#define IN_TEARGAS(unit) (unit getVariable [QKEGVAR(chemical,CSGas), 0])

//Ophthalmology
#define GET_DUST_INJURY(unit) ((unit getVariable [QKEGVAR(ophthalmology,dustInjuryLight), 0]) + (unit getVariable [QKEGVAR(ophthalmology,dustInjuryHeavy), 0]))
#define GET_EYE_INJURIES(unit) (unit getVariable [QKEGVAR(ophthalmology,eyeInjuries), [1,1]])

// END KAT Macros
