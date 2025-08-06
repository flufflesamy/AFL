class RscControlsGroupNoScrollbars;
class RscText;
class RscPictureKeepAspect;

class GVAR(RscEntries) : RscControlsGroupNoScrollbars {
    idc = IDC_ENTRIES_CG;
    x = QUOTE(IGUI_GRID_CUSTOMINFOLEFT_XDef);
    y = QUOTE(IGUI_GRID_CUSTOMINFOLEFT_YDef);
    w = QUOTE(IGUI_GRID_CUSTOMINFO_WDef);
    h = QUOTE(IGUI_GRID_CUSTOMINFO_HDef);
    left = 1;
};

class GVAR(RscEntryGroup) : RscControlsGroupNoScrollbars {
    w = QUOTE(IGUI_GRID_CUSTOMINFO_WDef);
    h = QUOTE(POS_H(1.25));

    class Controls {
        class Pill : RscPictureKeepAspect {
            idc = IDC_PILL;
            x = 0;
            y = 0;
            h = QUOTE(POS_H(1.25));
            w = QUOTE(POS_W(2.5));
            text = QPATHTOF(data\statusmonitor_pill2.paa);
            colorText[] = {0.35, 0.76, 1, 1};
        };

        class Heart : RscPictureKeepAspect {
            idc = IDC_HEART;
            x = 0;
            y = 0;
            h = QUOTE(POS_H(1.25));
            w = QUOTE(POS_W(2.5));
            text = QPATHTOF(data\statusmonitor_heart2.paa);
            colorText[] = {1, 0.35, 0.47, 1};
        };

        class Cross : RscPictureKeepAspect {
            idc = IDC_CROSS;
            x = 0;
            y = 0;
            h = QUOTE(POS_H(1.25));
            w = QUOTE(POS_W(2.5));
            text = QPATHTOF(data\statusmonitor_cross2.paa);
            colorText[] = {1, 1, 1, 1};
            show = 0;
        };

        class PR : RscText {
            idc = IDC_PR;
            x = QUOTE(POS_W(0.8));
            y = 0;
            h = QUOTE(POS_H(1.25));
            w = QUOTE(POS_W(1.5));
            sizeEx = QUOTE(POS_H(0.8));
            shadow = 0;
            font = "EtelkaMonospaceProBold";
            text = "999";
            style = ST_CENTER;
            colorText[] = {1, 1, 1, 1};
        };

        class Name : RscText {
            idc = IDC_NAME;
            x = QUOTE(POS_W(2.4));
            y = QUOTE(POS_H(-0.06));
            h = QUOTE(POS_H(1.25));
            w = QUOTE(POS_W(7.5));
            sizeEx = QUOTE(POS_H(1));
            font = "PuristaMedium";
            text = "Player";
            shadow = 1;
            style = ST_LEFT;
            colorText[] = {1, 1, 1, 1};
        };
    };
};
