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

    class Overwrite_Pharma {
        tag = "kat_pharma";

        class KAT_Pharma {
            class getBloodVolumeChange {
                file = QPATHTOF(functions\ovr_getBloodVolumeChange.sqf);
            };
        };
    };
};
