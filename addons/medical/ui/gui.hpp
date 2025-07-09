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
