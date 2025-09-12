class ACE_Medical_Treatment_Actions {
    class BasicBandage;
    class Carbonate;
    class FieldDressing;
    class CheckFracture;

    class ApplyNeckTourniquet: BasicBandage {
        displayName = ACECSTRING(medical_treatment,Apply_Tourniquet);
        displayNameProgress = ACECSTRING(medical_treatment,Applying_Tourniquet);
        icon = QPATHTOF(ui\tourniquet.paa);
        allowedSelections[] = {"Head"};
        items[] = {"ACE_tourniquet"};
        treatmentTime = QACEGVAR(medical_treatment,treatmentTimeTourniquet);
        condition = QUOTE(!([ARR_2(_patient,_bodyPart)] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo)) && GVAR(neckTourniquet));
        callbackSuccess = QFUNC(neckTourniquet);
        litter[] = {};
        allowedUnderwater = 1;
    };

    class RemoveNeckTourniquet : ApplyNeckTourniquet {
        displayName = ACECSTRING(medical_treatment,Actions_RemoveTourniquet);
        displayNameProgress = ACECSTRING(medical_treatment,RemovingTourniquet);
        items[] = {};
        condition = QUOTE(([ARR_2(_patient,_bodyPart)] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo)) && GVAR(neckTourniquet));
        callbackSuccess = QACEFUNC(medical_treatment,tourniquetRemove);
        allowedUnderwater = 1;
    };

    // Make KAM inspect cathether and saline flush respect med level settings
    class Inspect : Carbonate {
        medicRequired = QKEGVAR(pharma,medLvl_ApplyIV);
    };

    class NPWT: BasicBandage {
        callbackProgress = QFUNC(npwtProgress);
        callbackStart = QFUNC(npwtStart);
        callbackSuccess = QFUNC(npwtSuccess);
        callbackFailure = "";
        treatmentTime = QFUNC(npwtTime);
        condition = QFUNC(npwtCan);
        allowSelfTreatment = 1;
    };

    class SurgicalKit: FieldDressing {
        allowSelfTreatment = 1;
        callbackFailure = "";
        callBackProgress =  QFUNC(surgicalKitProgress);
        callBackStart = QFUNC(surgicalKitStart);
        callbackSuccess = QFUNC(surgicalKitSuccess);
        condition = QFUNC(surgicalKitCan);
        consumeItem = 0;
        treatmentTime = QFUNC(surgicalKitTime);
    };

    class OpenReduction: CheckFracture {
        items[] = {"ACE_surgicalKit"};
        consumeItem = 0;
    };

    class Expose: BasicBandage {
        items[] = {"ACE_surgicalKit"};
        consumeItem = 0;
    };

    class Incision: BasicBandage {
        consumeItem = 0;
        items[] = {"ACE_surgicalKit"};
    };

    class Clamp: BasicBandage {
        items[] = {"ACE_surgicalKit"};
        consumeItem = 0;
    };

    class Irrigate: BasicBandage {
        displayName = CSTRING(Irrigate_Use);
        displayNameProgress = CSTRING(Irrigate_Action);
        category = "surgery";
        treatmentLocations = QGVAR(surgicalLocation);
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
        allowSelfTreatment = 0;
        medicRequired = QGVAR(surgicalAction_MedLevel);
        treatmentTime = QGVAR(intermediateTime);
        items[] = {"ACE_salineIV_250"};
        condition = QUOTE([ARR_4(_medic,_patient,_bodyPart,2.3)] call FUNC(openReductionCheck));
        callbackSuccess = QUOTE([ARR_4(_medic,_patient,_bodyPart,2.3)] call FUNC(openReductionProgress));
    };

    class ResetSurgery: CheckFracture {
        items[] = {"ACE_surgicalKit"};
        consumeItem = 0;
    };
};
