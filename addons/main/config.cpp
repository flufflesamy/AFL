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
        url = CSTRING(url);
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@afl";
        name = "AFL 0.0.0";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca.paa";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = CSTRING(URL);
        description = "Issue Tracker: https://github.com/flufflesamy/AFL/issues";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSettings.hpp"
