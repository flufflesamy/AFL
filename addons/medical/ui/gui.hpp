class RscControlsGroupNoScrollbars;

class ACEGVAR(medical_gui,BodyImage) : RscControlsGroupNoScrollbars {
    class Controls {
        class ArmLeftT;

        class HeadT : ArmLeftT {
            idc = IDC_BODY_HEAD_T;
            text = QPATHTOF(data\body_image\head_t.paa);
        };
    };
};

class ACE_Medical_Menu {
    onKeyDown = QUOTE([ARR_3('onKeyDown',_this,QQACEGVAR(medical_gui,display))] call FUNC(ui_onKeyDown));
};
