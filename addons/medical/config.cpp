#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afl_main",
            "ace_medical",
            "ace_medical_damage",
            "ace_medical_treatment",
            "ace_medical_gui",
            "ace_medical_feedback",
            "ace_medical_engine",
            "kat_vitals",
            "kat_circulation",
            "kat_breathing",
            "kat_surgery",
            "kat_misc",
            "kat_gui",
            "kat_airway",
            "kat_pharma",
            "kat_vitals",
            "kat_stretcher",
            "kat_pharma"
        };
        author = "flufflesamy";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "ui\gui.hpp"
