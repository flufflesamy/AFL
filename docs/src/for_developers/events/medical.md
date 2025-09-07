# Medical Events

The following are events registered by `afl_medical`.

## Contents

<!-- toc -->

## `afl_medical_neckTourniquetLocal`

### Parameters

0. Patient (OBJECT)
1. Body Part (STRING)

### Usage

~~~admonish example collapsible=true
The following code raises the event to be handled by AFL.

```sqf
[
    "afl_medical_neckTourniquetLocal",
    [player, "leftarm"],
    player
] call CBA_fnc_targetEvent;
```

The following code registers the event to be listened.

```sqf
// File: XEH_postInit.sqf

[
    "afl_medical_neckTourniquetLocal",
    LINKFUNC(myFunction)
] call CBA_fnc_addEventHandler;
```
~~~
