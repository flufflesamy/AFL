class ACE_Medical_Treatment_Actions {
    class BasicBandage;
    class Carbonate;

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
};
