#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afl_main",
            "cba_main",
            "ace_main",
            "ace_medical",
            "ace_medical_damage",
            "kat_main",
            "kat_vitals",
            "kat_circulation",
            "kat_breathing",
            "kat_surgery"
        };
        author = "flufflesamy";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
