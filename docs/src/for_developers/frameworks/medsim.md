# Medical Simulator Framework

While the firing range mission provides a medical simulator, mission makers may still want to add their own medical simulator
in their missions.

Mod makers can also add custom presets to the medical simulator.

## Adding a Simulator Console

The Medical Simulator can be added to any mission by calling the
[`afl_medicalsim_fnc_addSimMenu`](../functions/medicalsim.html#afl_medicalsim_fnc_addsimmenu) function in a mission
or an eden object's init function.

~~~admonish example
The following code adds medical simulator functionality to an eden editor object.

```sqf
// File: init.sqf

// Initialize medical simulator

// Define list of stretchers to spawn patients on
// [object, "Display Name"]
private _stretchers = [
    [stretcher_1, "Stretcher 1"]
    // ...
];

// Create medical simulator console
[console_1, _stretchers] call afl_medicalsim_fnc_addSimMenu;
```
~~~

## Adding a Preset

Mod makers can add custom presets to the AFL Medical Simulator by adding entries to the `[cpp] AFL_Medicalsim_Presets` class
in the `[txt] config.cpp` file of their mod. The preset will then be automatically parsed by the medical simulator and shown
in the "Presets" section.

~~~admonish example
Presets are written in the following format, where the ranges given are written in [interval notation](https://math.libretexts.org/Bookshelves/Algebra/Elementary_Algebra_(LibreTexts)/02%3A_Linear_Equations_and_Inequalities/2.07%3A_Introduction_to_Inequalities_and_Interval_Notation).

```cpp
// File: AFL_MedicalSim_Presets.hpp

class AFL_MedicalSim_Presets {
  // Presets should inherit from this class
  class Base;

  class My_Preset : Base {
      // Wounds
      // {N} for number of wounds per bodyPart: [0,10]
      // {L, M, H} for range random chance: [0,10], [0,10], [0,10]
      wounds[] = {
          {1}, // Head
          {2}, // Torso
          {3}, // Left Arm
          {1, 5, 10}, // Right Arm
          {2, 7, 14}, // Left Leg
          {1, 2, 3} // Right Leg
      };

      // Circulation
      // ARREST_TYPE ["none", "asystole", "pea", "vf", "vt"]
      arrestType = 0.5; // Chance: [0,1); Type: [1..4]
      PAO2 = 97; // PAO2: [0..100]

      // Airway
      occluded = 0; // Chance: [0,1]
      obstructed = 1; // Chance: [0,1]

      // Pneumothroax
      // PNUMO_TYPE ["none", "initial", "tension", "hemo"]
      ptxType[] = {0.7, 0.5}; // {Type}: [0..3]; {Chance, Adv Chance}: [0,1], [0,1]
      ptxStrength = 1; // Strength: [1..4]
      ptxDeteriorate = 0.3; // Chance: [0,1]
      ptxTamponade = 0.8; // Chance: [0,1]

      // Fractures
      // {N} for fracture type: [0..3]
      // {Chance, Advanced fracture chance}: [0,1], [0,1]
      // FRACTURE_TYPE ["none", "simple", "compound", "comminuted"]
      fractures[] = {
          {0}, // Head (Unused)
          {0}, // Torso (Unused)
          {1}, // Left Arm
          {2}, // Right Arm
          {3}, // Left Leg
          {1, 0.6} // Right Leg
      };

      // Misc
      uncon = 0.75; // Chance: [0,1]
  };

  // Presets can also be partial
  class My_Partial_Preset : Base {
      arrestType = 4; // VT
      uncon = 1; // 100% chance of uncon
  };
};
```
~~~
