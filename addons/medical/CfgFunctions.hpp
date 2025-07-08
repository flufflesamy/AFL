// overwrite ace functions
class CfgFunctions {
    class Overwrite_Medical_Treatment {
        tag = "ace_medical_treatment";

        class ACE_Medical_Treatment {
            class getBandageTime {
                file = QPATHTOF(functions\fnc_getBandageTime.sqf);
            };
        };
    };
};
