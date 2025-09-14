# Misc Functions

This chapter lists public misc functions that are available to developers.

## Contents

<!-- toc -->

## `afl_misc_fnc_addVehicleSpawner`

### Description

Creates a vehicle on a marker.

### Parameters

1. Eden Entity `\\<OBJECT>`
1. Vehicle Name `\\<STRING>`
1. Marker Name `\\<STRING>`

### Returns

Nothing.

### Usage

~~~admonish example
```sqf
[
    _vehicleConsole,
    "OPTRE_FC_Wraith_Tank",
    "mkrVehClose"
] call afl_misc_fnc_addVehicleSpawner;
```
~~~

## `afl_misc_fnc_hasItem`

### Description

Checks if unit has an item.

### Parameters

1. Unit `\\<OBJECT>`
1. Item `\\<STRING>`

### Returns

1. Has Item `\\<BOOL>`

### Usage

~~~admonish example
```sqf
[player, "AFL_statusMonitor"] call afl_misc_fnc_hasItem;
```
~~~

## `afl_misc_fnc_isDestroyed`

### Description

Checks if a vehicle is destroyed.

### Parameters

1. Vehicle `\\<OBJECT>`

### Returns

1. Is Destroyed `\\<BOOL>`

### Usage

~~~admonish example
```sqf
[_veh] call afl_misc_fnc_isDestroyed;
```
~~~
