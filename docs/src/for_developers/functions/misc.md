# Misc Functions

This chapter lists public misc functions that are available to developers.

## Contents

<!-- toc -->

## `afl_misc_fnc_createVehOnMarker`

### Description

Creates a vehicle on a marker.

### Parameters

1. Vehicle Class Name `\\<STRING>`
1. Name of Marker `\\<STRING>`
1. Vehicle Console Entity `\\<OBJECT>`
1. Caller `\\<OBJECT>`
    - Default: `nil`

### Returns

1. Vehicle `\\<OBJECT>`

### Usage

~~~admonish example
```sqf
[
    "OPTRE_FC_Wraith_Tan",
    "myMkr", vehicleConsole,
    nil
] call afl_misc_fnc_createVehOnMarker
```
~~~
