class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

    class AFL_StatusMonitor : CBA_MiscItem {
        author = "flufflesamy";
        scope = 2;
        displayName = CSTRING(Name);
        descriptionShort = CSTRING(Description);
        ACE_isTool = 1;
        AFL_isMonitor = 1;
        picture = QPATHTOF(data\statusmonitor_icon2.paa);

        class ItemInfo : CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
