class ACE_Medical_Injuries{
    class damageTypes {
        class testdamage {
            thresholds[] = {{20, 20},  {0, 0}};
            selectionSpecific = 0;
            class Avulsion {
                weighting[] = {{1.5, 1}, {1.1, 0}};
            };
            class PunctureWound {
                weighting[] = {{1,1}};
            };
            class Cut {
                weighting[] = {{0.7, 0}, {0.35, 1}, {0.35, 0}};
            };
            class Contusion {
                weighting[] = {{0.5, 0}, {0.35, 1}};
                sizeMultiplier = 2;
                painMultiplier = 0.9;
            };
        };
    };
};
