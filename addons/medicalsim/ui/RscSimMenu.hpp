class RscText;
class RscCombo;
class RscXSliderH;
class RscEdit;
class RscCheckBox;
class RscControlsGroupNoScrollbars;
class RscButtonMenu;
class RscListBox;

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
    x = QUOTE(MEDSIM_CG_POS_W(0));
    w = QUOTE(MEDSIM_CG_POS_W(7));
    h = QUOTE(POS_H(1));
};

class GVAR(RscPropCombo) : RscCombo {
    x = QUOTE(MEDSIM_CG_POS_W(7.5));
    w = QUOTE(MEDSIM_CG_POS_W(9.5));
    h = QUOTE(POS_H(1));
    colorBackground[] = {0, 0, 0, 0.7};
};

class GVAR(RscFractureCombo) : GVAR(RscPropCombo) {
    class Items {
        class None {
            text = "None";
            default = 1;
        };
        class Simple {
            text = "Simple";
        };
        class Compound {
            text = "Compound";
        };
        class Comminuted {
            text = "Comminuted";
        };
    };
};

class GVAR(RscPropSlider) : RscXSliderH {
    x = QUOTE(MEDSIM_CG_POS_W(7.5));
    w = QUOTE(MEDSIM_CG_POS_W(9.5));
    h = QUOTE(POS_H(1));
};

class GVAR(RscWoundsSlider) : GVAR(RscPropSlider) {
    sliderRange[] = {0, 10};
    sliderStep = 0.5;
};

class GVAR(RscSliderValue) : RscEdit {
    x = QUOTE(MEDSIM_CG_POS_W(17.5));
    w = QUOTE(MEDSIM_CG_POS_W(2));
    h = QUOTE(POS_H(1));
    canModify = 0;

    style = ST_NO_RECT;
    colorBackground [] = {0,0,0,0.6};
};

class GVAR(RscPropCheckbox) : RscCheckBox {
    x = QUOTE(MEDSIM_CG_POS_W(7.5));
    w = QUOTE(MEDSIM_CG_POS_W(1));
    h = QUOTE(POS_H(1));
};

class GVAR(RscSimMenu) {
    idd = IDD_MEDSIM_MENU;
    enableSimulation = 1;
    duration = 1e+6;
    movingEnable = 0;
    onLoad = QUOTE(_this select 0 call FUNC(ui_onMenuOpen));
    onUnload = QUOTE(_this select 0 call FUNC(ui_onMenuClose));

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
            colorBackground[] = {0, 0, 0, 0.65};
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

        class StretchersGroup : RscControlsGroupNoScrollbars {
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
                    x = QUOTE(MEDSIM_CG_POS_W(0.2));
                    y = QUOTE(POS_H(1.1));
                    h = QUOTE(POS_H(5.9));
                    w = QUOTE(MEDSIM_CG_POS_W(19.3));

                    colorBackground[] = {0,0,0,0.65};
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

                class HeadSlider : GVAR(RscWoundsSlider) {
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

                class TorsoSlider : GVAR(RscWoundsSlider) {
                    idc = IDC_WOUNDS_TORSO_SLIDER;
                    y = QUOTE(POS_H(2.2));
                };

                class TorsoValue : GVAR(RscSliderValue) {
                    idc = IDC_WOUNDS_TORSO_VAL;
                    y = QUOTE(POS_H(2.2));
                };

                // Left Arm
                class LeftArmText : GVAR(RscPropTitle) {
                    y = QUOTE(POS_H(3.3));
                    text = "Left Arm:";
                };

                class LeftArmSlider : GVAR(RscWoundsSlider) {
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

                class RightArmSlider : GVAR(RscWoundsSlider) {
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

                class LeftLegSlider : GVAR(RscWoundsSlider) {
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

                class RightLegSlider : GVAR(RscWoundsSlider) {
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
            h = QUOTE(POS_H(3.2));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Circulation";
                };

                class CardiacText : GVAR(RscPropTitle) {
                    text = "Cardiac Arrest Type:";
                    y = QUOTE(POS_H(1.1));
                };

                class CardiacCombo : GVAR(RscPropCombo) {
                    idc = IDC_CARDIAC_COMBO;
                    y = QUOTE(POS_H(1.1));

                    class Items {
                        class None {
                            text = "None";
                            default = 1;
                        };
                        class Asystole {
                            text = "Asystole";
                        };
                        class PEA {
                            text = "PEA";
                        };
                        class VF {
                            text = "VF";
                        };
                        class VT {
                            text = "VT";
                        };
                    };
                };

                // PAO2
                class PAO2Text : GVAR(RscPropTitle) {
                    text = "PAO2:";
                    y = QUOTE(POS_H(2.2));
                };

                class PAO2Slider : GVAR(RscPropSlider) {
                    idc = IDC_AIRWAY_PAO2_SLIDER;
                    y = QUOTE(POS_H(2.2));
                    sliderRange[] = {0, 100};
                    sliderStep = 1;
                    sliderPosition = 100;
                };

                class PAO2Value : GVAR(RscSliderValue) {
                    idc = IDC_AIRWAY_PAO2_VAL;
                    y = QUOTE(POS_H(2.2));
                };
            };
        };

        class AirwayGroup : RscControlsGroupNoScrollbars {
            idc = IDC_AIRWAY_CG;
            x = QUOTE(MEDSIM_CG_LEFT_X);
            y = QUOTE(POS_Y(19.3));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(3.2);

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
                    idc = IDC_AIRWAY_OCCLUDED_CHECKBOX;
                    y = QUOTE(POS_H(1.1));
                };

                // Obstructed
                class ObstructedText : GVAR(RscPropTitle) {
                    text = "Obstructed:";
                    y = QUOTE(POS_H(2.2));
                };

                class ObstructedCheckbox : GVAR(RscPropCheckbox) {
                    idc = IDC_AIRWAY_OBSTRUCTED_CHECKBOX;
                    y = QUOTE(POS_H(2.2));
                };
            };
        };

        class PresetsGroup : RscControlsGroupNoScrollbars {
            idc = IDC_PRESETS_CG;
            x = QUOTE(MEDSIM_CG_RIGHT_X);
            y = QUOTE(POS_Y(1.2));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(POS_H(7));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Presets";
                };

                class PresetListBox : RscListBox {
                    idc = IDC_PRESETS_LISTBOX;
                    x = QUOTE(MEDSIM_CG_POS_W(0.2));
                    y = QUOTE(POS_H(1.1));
                    h = QUOTE(POS_H(4.8));
                    w = QUOTE(MEDSIM_CG_POS_W(19.3));

                    colorBackground[] = {0,0,0,0.65};
                };

                class PresetSpawnButton : RscButtonMenu {
                    idc = IDC_PRESET_SPAWN_BUTTON;
                    text = "SPAWN";
                    x = QUOTE(MEDSIM_CG_POS_W(14.5));
                    y = QUOTE(POS_H(6));
                    h = QUOTE(POS_H(1));
                    w = QUOTE(MEDSIM_CG_POS_W(5));

                    onButtonClick = QUOTE(call FUNC(ui_onPresetSpawnClick));
                };

                class PresetSpawnAllButton : RscButtonMenu {
                    idc = IDC_PRESET_SPAWNALL_BUTTON;
                    text = "SPAWN ALL";
                    x = QUOTE(MEDSIM_CG_POS_W(9.4));
                    y = QUOTE(POS_H(6));
                    h = QUOTE(POS_H(1));
                    w = QUOTE(MEDSIM_CG_POS_W(5));

                    onButtonClick = QUOTE(call FUNC(ui_onPresetSpawnAllClick));
                };
            };
        };

        class PneumothoraxGroup : RscControlsGroupNoScrollbars {
            idc = IDC_PTX_CG;
            x = QUOTE(MEDSIM_CG_RIGHT_X);
            y = QUOTE(POS_Y(8.3));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(POS_H(5.4));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Pneumothorax";
                };

                // Type
                class TypeText : GVAR(RscPropTitle) {
                    text = "Type:";
                    y = QUOTE(POS_H(1.1));
                };

                class TypeCombo : GVAR(RscPropCombo) {
                    idc = IDC_PTX_TYPE_COMBO;
                    y = QUOTE(POS_H(1.1));

                    class Items {
                        class None {
                            text = "None";
                            default = 1;
                        };
                        class Initial {
                            text = "Initial";
                        };
                        class Tension {
                            text = "Tension";
                        };
                        class Hemo {
                            text = "Hemo";
                        };
                    };
                };

                // Strength
                class StrengthText : GVAR(RscPropTitle) {
                    text = "Strength:";
                    y = QUOTE(POS_H(2.2));
                };

                class StrengthSlider : GVAR(RscPropSlider) {
                    idc = IDC_PTX_STRENGTH_SLIDER;
                    y = QUOTE(POS_H(2.2));
                    sliderPosition = 1;
                    sliderRange[] = {1, 4};
                    sliderStep = 1;
                };

                class StrengthValue : GVAR(RscSliderValue) {
                    idc = IDC_PTX_STRENGTH_VAL;
                    y = QUOTE(POS_H(2.2));
                };

                // Deteriorate
                class DeteriorateText : GVAR(RscPropTitle) {
                    text = "Deteriorate:";
                    y = QUOTE(POS_H(3.3));
                };

                class DeteriorateCheckbox : GVAR(RscPropCheckbox) {
                    idc = IDC_PTX_DETERIORATE_CHECKBOX;
                    y = QUOTE(POS_H(3.3));
                };

                // Tamponade
                class TamponadeText : GVAR(RscPropTitle) {
                    text = "Tamponade:";
                    y = QUOTE(POS_H(4.4));
                };

                class TamponandeCheckbox : GVAR(RscPropCheckbox) {
                    idc = IDC_PTX_TAMPONADE_CHECKBOX;
                    y = QUOTE(POS_H(4.4));
                };
            };
        };

        class FracturesGroup : RscControlsGroupNoScrollbars {
            idc = IDC_FRACTURES_CG;
            x = QUOTE(MEDSIM_CG_RIGHT_X);
            y = QUOTE(POS_Y(13.8));
            w = QUOTE(MEDSIM_CG_W);
            h = QUOTE(POS_H(5.4));

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Fractures";
                };

                // Left Arm
                class LeftArmText : GVAR(RscPropTitle) {
                    text = "Left Arm:";
                    y = QUOTE(POS_H(1.1));
                };

                class LeftArmCombo : GVAR(RscFractureCombo) {
                    idc = IDC_FRACTURES_LEFTARM_COMBO;
                    y = QUOTE(POS_H(1.1));
                };

                // Right Arm
                class RightArmText : GVAR(RscPropTitle) {
                    text = "Right Arm:";
                    y = QUOTE(POS_H(2.2));
                };

                class RightArmCombo : GVAR(RscFractureCombo) {
                    idc = IDC_FRACTURES_RIGHTARM_COMBO;
                    y = QUOTE(POS_H(2.2));
                };

                // Left Leg
                class LeftLegText : GVAR(RscPropTitle) {
                    text = "Left Leg:";
                    y = QUOTE(POS_H(3.3));
                };

                class LeftLegCombo : GVAR(RscFractureCombo) {
                    idc = IDC_FRACTURES_LEFTLEG_COMBO;
                    y = QUOTE(POS_H(3.3));
                };

                // Right Leg
                class RightLegText : GVAR(RscPropTitle) {
                    text = "Right Leg:";
                    y = QUOTE(POS_H(4.4));
                };

                class RightLegCombo : GVAR(RscFractureCombo) {
                    idc = IDC_FRACTURES_RIGHTLEG_COMBO;
                    y = QUOTE(POS_H(4.4));
                };
            };
        };

        class MiscGroup : RscControlsGroupNoScrollbars {
            idc = IDC_MISC_CG;
            x = QUOTE(MEDSIM_CG_RIGHT_X);
            y = QUOTE(POS_Y(19.3));
            w = QUOTE(MEDSIM_CG_W);
            h = 2.1;

            class Controls {
                class Header : GVAR(RscHeaderText) {
                    text = "Misc";
                };

                // Uncon
                class UnconText : GVAR(RscPropTitle) {
                    text = "Unconscious:";
                    y = QUOTE(POS_H(1.1));
                };

                class UnconCheckbox : GVAR(RscPropCheckbox) {
                    idc = IDC_MISC_UNCON_CHECKBOX;
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
            onButtonClick = QUOTE(call FUNC(ui_onSpawnClick));
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
            onButtonClick = QUOTE(call FUNC(ui_onClearClick));
        };

        class ClearAllButton : RscButtonMenu {
            idc = IDC_CLEARALL_BUTTON;
            text = "CLEAR ALL";
            x = QUOTE(POS_X(24.8));
            y = QUOTE(POS_Y(23.2));
            w = QUOTE(POS_W(5));
            h = QUOTE(POS_H(1));
            onButtonClick = QUOTE(call FUNC(ui_onClearAllClick));
        };
    };
};
