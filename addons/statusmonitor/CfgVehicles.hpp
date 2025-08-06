class CfgVehicles {
    class Man;
    class CAManBase : Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(Show) {
                    displayName = CSTRING(Interact_Show);
                    condition = QUOTE([_player] call FUNC(canShow));
                    statement = QUOTE([] call FUNC(showMonitor));
                    showDisabled = 0;
                    icon = QPATHTOF(data\statusmonitor_icon2.paa);
                };
                class GVAR(Hide) {
                    displayName = CSTRING(Interact_Hide);
                    condition = QUOTE([_player] call FUNC(canHide));
                    statement = QUOTE([] call FUNC(hideMonitor));
                    showDisabled = 0;
                    icon = QPATHTOF(data\statusmonitor_icon2.paa);
                };
            };
        };
    };

    class Item_Base_F;
    class AFL_Item_StatusMonitor : Item_Base_F {
        author = "flufflesamy";
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Name);
        vehicleClass = "Items";

        class TransportItems {
            class AFL_StatusMonitor {
                name = "AFL_StatusMonitor";
                count = 1;
            };
        };
    };
};
