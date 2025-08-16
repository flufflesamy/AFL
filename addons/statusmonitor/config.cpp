#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "AFL_Item_StatusMonitor",
            "AFL_Item_StatusMonitorLite"
        };
        weapons[] = {
            "AFL_StatusMonitor",
            "AFL_StatusMonitorLite"
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
