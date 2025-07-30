#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "AFL_Item_StatusMonitor"
        };
        weapons[] = {
            "AFL_StatusMonitor"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "afl_main"
        };
        author = "flufflesamy";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "ui\uiControls.hpp"
#include "ui\RscTitles.hpp"
