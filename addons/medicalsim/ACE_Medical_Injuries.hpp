class ACE_Medical_Injuries{
    class damageTypes {
        class testdamage {
            thresholds[] = {{10, 10},  {0, 0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{1.5, 1}, {0, 0}};
                sizeMultiplier = 0.7;
            };
            class PunctureWound {
                weighting[] = {{1,1}};
            };
        };
    };
};
