# Medical Simulator Framework

The Medical Simulator can be added to any mission by calling the `afl_medicalsim_fnc_addSimMenu` function in a mission
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
