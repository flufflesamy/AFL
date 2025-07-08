class ACE_Medical_Treatment_Actions {
    class BasicBandage;

    class ApplyNeckTourniquet: BasicBandage {
        displayName = ACECSTRING(medical_treatment,Apply_Tourniquet);
        displayNameProgress = ACECSTRING(medical_treatment,Applying_Tourniquet);
        icon = QPATHTOF(ui\tourniquet.paa);
        allowedSelections[] = {"Head"};
        items[] = {"ACE_tourniquet"};
        treatmentTime = QACEGVAR(medical_treatment,treatmentTimeTourniquet);
        condition = QUOTE(!([ARR_2(_patient,_bodyPart)] call ACEFUNC(medical_treatment,hasTourniquetAppliedTo)) && GVAR(neckTourniquet));
        callbackSuccess = QFUNC(headTourniquet);
        litter[] = {};
    };
};
