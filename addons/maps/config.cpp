#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"afl_main", "cba_main"};
        author = "flufflesamy";
        VERSION_CONFIG;
    };
};