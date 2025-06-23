#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"afl_main", "cba_main", "afl_main", "afl_medicalsim", "afl_common"};
        author = "flufflesamy";
        VERSION_CONFIG;
    };
};

#include "CfgMissions.hpp"
