class AFL_Medicalsim_Presets {
    // Base preset. Comments use interval notation.
    class Base {
        // Wounds
        // {N} for number of wounds per bodyPart: [0,10]
        // {L, M, H} for range random chance: [0,10], [0,10], [0,10]
        wounds[] = {
            {0}, // Head
            {0}, // Torso
            {0}, // Left Arm
            {0}, // Right Arm
            {0}, // Left Leg
            {0} // Right Leg
        };

        // Circulation
        // ARREST_TYPE ["none", "asystole", "pea", "vf", "vt"]
        arrestType = 0; // Chance: [0,1); Type: [1..4]
        PAO2 = 97; // PAO2: [0..100]

        // Airway
        occluded = 0; // Chance: [0,1]
        obstructed = 0; // Chance: [0,1]

        // Pneumothroax
        // PNUMO_TYPE ["none", "initial", "tension", "hemo"]
        ptxType[] = {0}; // {Type}: [0..3]; {Chance, Adv Chance}: [0,1], [0,1]
        ptxStrength = 1; // Strength: [1..4]
        ptxDeteriorate = 0; // Chance: [0,1]
        ptxTamponade = 0; // Chance: [0,1]

        // Fractures
        // {N} for fracture type: [0..3]
        // {Chance, Advanced fracture chance}: [0,1], [0,1]
        // FRACTURE_TYPE ["none", "simple", "compound", "comminuted"]
        fractures[] = {
            {0}, // Head (Unused)
            {0}, // Torso (Unused)
            {0}, // Left Arm
            {0}, // Right Arm
            {0}, // Left Leg
            {0} // Right Leg
        };

        // Misc
        uncon = 0; // Chance: [0,1]
    };

    class Riflemaid : Base {
        wounds[] = {
            {0},
            {0},
            {0, 2, 5},
            {0, 2, 5},
            {0, 2, 5},
            {0, 2, 5}
        };
    };

    class Easy : Base {
        wounds[] = {
            {0},
            {0},
            {1, 2, 5},
            {1, 2, 5},
            {1, 2, 5},
            {1, 2, 5}
        };

        uncon = 0.5;
    };

    class Medium : Easy {
        uncon = 1;
        obstructed = 0.5;
        occluded = 0.5;
    };

    class Hard : Base {
        wounds[] = {
            {0, 2, 5},
            {0, 2, 5},
            {0, 2, 5},
            {0, 2, 5},
            {0, 2, 5},
            {0, 2, 5}
        };
        fractures[] = {
            {0},
            {0},
            {0.5, 0.25},
            {0.5, 0.25},
            {0.5, 0.25},
            {0.5, 0.25},
        };
        obstructed = 0.5;
        occluded = 0.5;
        arrestType = 0.5;
        ptxType[] = {0.5, 0.5};
        ptxDeteriorate = 0.5;

        uncon = 1;
    };

    class Very_Hard : Hard {
        wounds[] = {
            {0, 2, 5},
            {0, 2, 5},
            {0, 5, 10},
            {0, 5, 10},
            {0, 5, 10},
            {0, 5, 10}
        };
        fractures[] = {
            {0}, // Head (Unused)
            {0}, // Torso (Unused)
            {0.5, 0.5},
            {0.5, 0.5},
            {0.5, 0.5},
            {0.5, 0.5},
        };
        ptxTamponade = 0.1;
    };

    class Fractures : Base {
        fractures[] = {
            {0}, // Head (Unused)
            {0}, // Torso (Unused)
            {1, 0.5},
            {1, 0.5},
            {1, 0.5},
            {1, 0.5},
        };
    };
};
