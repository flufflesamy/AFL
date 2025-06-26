#include "defaultControls.hpp"

class GVAR(RscHeaderText) : RscText {
    idc = -1;
};

class GVAR(RscPropTitle) : RscText {
    idc = -1;
    style = ST_RIGHT;
    x = QUOTE(POS_X(5));
    h = QUOTE(POS_H(1));
    w = QUOTE(POS_W(6));
};

class GVAR(RscPropCombo) : RscCombo {
    x = QUOTE(POS_X(11.5));
    w = QUOTE(POS_W(8.3));
    h = QUOTE(POS_H(1));
};

class GVAR(RscSimMenu) {
    idd = IDD_MEDSIM_MENU;
    enableSimulation = 1;
    duration = 1e+6;
    movingEnable = 0;
    onLoad = QUOTE(call FUNC(onMenuOpen));

    class ControlsBackground {
        class Title : RscText {
            idc = -1;
            text = "Amy Medical Sim";
            colorText[] = GUI_TITLETEXT_COLOR;
            colorBackground[] = GUI_BCG_COLOR;
            x = QUOTE(POS_X(0));
            y = QUOTE(POS_Y(0));
            w = QUOTE(POS_W(40));
            h = QUOTE(POS_H(1));
        };
        class Background : RscText {
            idc = -1;
            colorBackground[] = {0.1, 0.1, 0.1, 0.7};
            x = QUOTE(POS_X(0));
            y = QUOTE(POS_Y(1.1));
            w = QUOTE(POS_W(40));
            h = QUOTE(POS_H(22));
        };
    };

    class Controls {
        // margins 0.1 / side
        // usable space:
        // w = 39.8
        // h = 21.8

        class StretchersGroup : RscControlsGroupNoHScrollbars {
            idc = IDC_STRETCHERS_CG;
            x = QUOTE(POS_X(0.1));
            y = QUOTE(POS_Y(1.2));
            w = QUOTE(POS_W(19.8));
            h = QUOTE(POS_H(7));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Stretchers";
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(POS_W(19.8));
                    h = QUOTE(POS_H(1));
                };

                class StretchersList : RscListBox {
                    idc = IDC_STRETCHERS_LISTBOX;
                    x = QUOTE(0);
                    y = QUOTE(POS_H(1.1));
                    w = QUOTE(POS_W(19.8));
                    h = QUOTE(POS_H(5.9));
                };
            };
        };

        class WoundsGroup : RscControlsGroupNoScrollbars {
            idc = IDC_WOUNDS_CG;
            x = QUOTE(POS_X(0.1));
            y = QUOTE(POS_Y(8.3));
            w = QUOTE(POS_W(19.8));
            h = QUOTE(POS_H(7));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Wounds";
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(POS_W(19.8));
                    h = QUOTE(POS_H(1));
                };

                class HeadText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(1.1));
                    text = "Head:";
                };

                class HeadCombo : GVAR(RscPropCombo) {
                    y = QUOTE(POS_H(1.1));
                };
            };
        };

        class SpawnButton : RscButtonMenu {
            idc = IDC_SPAWN_BUTTON;
            text = "SPAWN";
            colorBackground[] = {GUI_BCG_MENU_RGB, 0.8};
            color[] = GUI_TITLETEXT_COLOR;
            x = QUOTE(POS_X(35));
            y = QUOTE(POS_Y(23.2));
            w = QUOTE(POS_W(5));
            h = QUOTE(POS_H(1));
        };

        class CancelButton : RscButtonMenu {
            idc = 2;
            text = "CANCEL";
            x = QUOTE(POS_X(0));
            y = QUOTE(POS_Y(23.2));
            w = QUOTE(POS_W(5));
            h = QUOTE(POS_H(1));
        };

        class ClearButton : RscButtonMenu {
            idc = IDC_CLEAR_BUTTON;
            text = "CLEAR";
            x = QUOTE(POS_X(29.9));
            y = QUOTE(POS_Y(23.2));
            w = QUOTE(POS_W(5));
            h = QUOTE(POS_H(1));
        };

        class ClearAllButton : RscButtonMenu {
            idc = IDC_CLEARALL_BUTTON;
            text = "CLEAR ALL";
            x = QUOTE(POS_X(24.8));
            y = QUOTE(POS_Y(23.2));
            w = QUOTE(POS_W(5));
            h = QUOTE(POS_H(1));
        };
    };
};
