#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afl_main",
            "afl_medicalsim",
            "afl_misc",
            "A3_Structures_F_Globe",
            "A3_Props_F_Globe"
        };
        skipWhenMissingDependencies = 1;
        author = "flufflesamy";
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMissions.hpp"
