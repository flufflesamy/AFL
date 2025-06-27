#include "defaultControls.hpp"

class GVAR(RscHeaderText) : RscText {
    idc = -1;
    h = QUOTE(POS_H(1));
    x = QUOTE(0);
    y = QUOTE(0);
    w = QUOTE(MEDSIM_CG_W);
};

class GVAR(RscPropTitle) : RscText {
    idc = -1;
    style = ST_RIGHT;
    x = QUOTE(MEDSIM_CG_POS_W(2));
    w = QUOTE(MEDSIM_CG_POS_W(5));
    h = QUOTE(POS_H(1));
};

class GVAR(RscPropCombo) : RscCombo {
    x = QUOTE(MEDSIM_CG_POS_W(7.5));
    w = QUOTE(MEDSIM_CG_POS_W(9.5));
    h = QUOTE(POS_H(1));
};

class GVAR(RscPropSlider) : RscXSliderH {
    x = QUOTE(MEDSIM_CG_POS_W(7.5));
    w = QUOTE(MEDSIM_CG_POS_W(9.5));
    h = QUOTE(POS_H(1));
};

class GVAR(RscSliderValue) : RscEdit {
    x = QUOTE(MEDSIM_CG_POS_W(17.5));
    w = QUOTE(MEDSIM_CG_POS_W(2.5));
    h = QUOTE(POS_H(1));

    style = ST_NO_RECT;
    colorBackground [] = {0,0,0,0.6};
};

class GVAR(RscPropCheckbox) : RscCheckBox {
    x = QUOTE(MEDSIM_CG_POS_W(16));
    w = QUOTE(MEDSIM_CG_POS_W(1));
    h = QUOTE(POS_H(1));
};

class GVAR(RscSimMenu) {
    idd = IDD_MEDSIM_MENU;
    enableSimulation = 1;
    duration = 1e+6;
    movingEnable = 0;
    onLoad = QUOTE(_this select 0 call FUNC(ui_onMenuOpen));

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
            x = QUOTE(MEDSIM_CG_LEFT_X);
            y = QUOTE(POS_Y(1.2));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(POS_H(7));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Stretchers";
                };

                class StretchersList : RscListBox {
                    idc = IDC_STRETCHERS_LISTBOX;
                    x = QUOTE(0);
                    y = QUOTE(POS_H(1.1));
                    h = QUOTE(POS_H(5.9));
                    w = QUOTE(MEDSIM_CG_W);
                };
            };
        };

        class WoundsGroup : RscControlsGroupNoScrollbars {
            idc = IDC_WOUNDS_CG;
            x = QUOTE(MEDSIM_CG_LEFT_X);
            y = QUOTE(POS_Y(8.3));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(POS_H(7.6));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Wounds";
                };

                // Head
                class HeadText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(1.1));
                    text = "Head:";
                };

                class HeadSlider : GVAR(RscPropSlider) {
                    idc = IDC_WOUNDS_HEAD_SLIDER;
                    y = QUOTE(POS_H(1.1));
                };

                class HeadValue : GVAR(RscSliderValue) {
                    idc = IDC_WOUNDS_HEAD_VAL;
                    y = QUOTE(POS_H(1.1));
                };

                // Torso
                class TorsoText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(2.2));
                    text = "Torso:";
                };

                class TorsoSlider : GVAR(RscPropSlider) {
                    idc = IDC_WOUNDS_TORSO_SLIDER;
                    y = QUOTE(POS_H(2.2));
                };

                class TorsoValue : GVAR(RscSliderValue) {
                    idc = IDC_WOUNDS_HEAD_VAL;
                    y = QUOTE(POS_H(2.2));
                };

                // Left Arm
                class LeftArmText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(3.3));
                    text = "Left Arm:";
                };

                class LeftArmSlider : GVAR(RscPropSlider) {
                    idc = IDC_WOUNDS_LEFTARM_SLIDER;
                    y = QUOTE(POS_H(3.3));
                };

                class LeftArmValue : GVAR(RscSliderValue) {
                    idc = IDC_WOUNDS_LEFTARM_VAL;
                    y = QUOTE(POS_H(3.3));
                };

                // Right Arm
                class RightArmText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(4.4));
                    text = "Left Arm:";
                };

                class RightArmSlider : GVAR(RscPropSlider) {
                    idc = IDC_WOUNDS_RIGHTARM_SLIDER;
                    y = QUOTE(POS_H(4.4));
                };

                class RightArmValue : GVAR(RscSliderValue) {
                    idc = IDC_WOUNDS_RIGHTARM_VAL;
                    y = QUOTE(POS_H(4.4));
                };

                // Left Leg
                class LeftLegText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(5.5));
                    text = "Left Leg:";
                };

                class LeftLegSlider : GVAR(RscPropSlider) {
                    idc = IDC_WOUNDS_LEFTLEG_SLIDER;
                    y = QUOTE(POS_H(5.5));
                };

                class LeftLegValue : GVAR(RscSliderValue) {
                    idc = IDC_WOUNDS_LEFTLEG_VAL;
                    y = QUOTE(POS_H(5.5));
                };

                // Right Leg
                class RightLegText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(6.6));
                    text = "Right Leg:";
                };

                class RightLegSlider : GVAR(RscPropSlider) {
                    idc = IDC_WOUNDS_RIGHTLEG_SLIDER;
                    y = QUOTE(POS_H(6.6));
                };

                class RightLegValue : GVAR(RscSliderValue) {
                    idc = IDC_WOUNDS_RIGHTLEG_VAL;
                    y = QUOTE(POS_H(6.6));
                };
            };
        };

        class CardiacGroup : RscControlsGroupNoScrollbars {
            idc = IDC_CARDIAC_CG;
            x = QUOTE(MEDSIM_CG_LEFT_X);
            y = QUOTE(POS_Y(16));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(POS_H(2.1));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Cardiac Arrest";
                };

                class CardiacText : GVAR(RscPropTitle) {
                    text = "Arrest Type:";
                    y = QUOTE(POS_H(1.1));
                };

                class CardiacCombo : GVAR(RscPropCombo) {
                    idc = IDC_CARDIAC_COMBO;
                    y = QUOTE(POS_H(1.1));
                };
            };
        };

        class AirwayGroup : RscControlsGroupNoScrollbars {
            idc = IDC_AIRWAY_CG;
            x = QUOTE(MEDSIM_CG_LEFT_X);
            y = QUOTE(POS_Y(18.2));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(3.3);

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Airway";
                };

                // Occluded
                class OcculudedText : GVAR(RscPropTitle) {
                    text = "Occuluded:";
                    y = QUOTE(POS_H(1.1));
                };

                class OcculudedCheckbox : GVAR(RscPropCheckbox) {
                    y = QUOTE(POS_H(1.1));
                };

                // Obstructed
                class ObstructedText : GVAR(RscPropTitle) {
                    text = "Occuluded:";
                    y = QUOTE(POS_H(2.2));
                };

                class ObstructedCheckbox : GVAR(RscPropCheckbox) {
                    y = QUOTE(POS_H(2.2));
                };

                // PAO2
                class PAO2Text : GVAR(RscPropTitle) {
                    text = "PAO2:";
                    y = QUOTE(POS_H(3.3));
                };

                class PAO2Slider : GVAR(RscPropSlider) {
                    y = QUOTE(POS_H(3.3));
                };

                class PAO2Value : GVAR(RscSliderValue) {
                    y = QUOTE(POS_H(3.3));
                };
            };
        };

        class PneumothoraxGroup : RscControlsGroupNoScrollbars {

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
