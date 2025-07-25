#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "ace_main",
            "kat_main"
        };
        author = "flufflesamy";
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@afl";
        name = "Amy Functions Library - Selkie Medical Mod";
    };
};
