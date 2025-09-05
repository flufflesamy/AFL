# Medical Events

The following are events registered by `afl_medical`.

<!-- toc -->

## Events List

### `afl_medical_neckTourniquetLocal`

#### Parameters

0. Patient (OBJECT)
1. Body Part (STRING)

#### Usage

~~~admonish example
```sqf
[
    "afl_medical_neckTourniquetLocal",
    [player, "leftarm"],
    player
] call CBA_fnc_targetEvent;
```
~~~
