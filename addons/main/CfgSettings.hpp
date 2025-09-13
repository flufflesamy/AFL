class CfgSettings {
    class CBA {
        class Versioning {
            class PREFIX {
                // Custom handler function triggered upon version mismatch
                handler = QFUNC(mismatch);

                class Dependencies {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "true"};
                    ACE[] = {"ace_main", REQUIRED_ACE_VERSION, "true"};
                    KAT[] = {"kat_main", REQUIRED_KAM_VERSION, "true"};
                };
            };
        };
    };
};
