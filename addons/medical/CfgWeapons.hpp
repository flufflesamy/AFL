class CfgWeapons {
    class ACE_ItemCore;

    class ACE_surgicalKit : ACE_ItemCore {
        scope = 2;
        author = "ACE Team, flufflesamy";
        ACE_isMedicalItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };
};
