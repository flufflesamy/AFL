# Medical Simulator Functions

This chapter lists public medical simulator functions that are available to developers.

## Contents

<!-- toc -->

## `afl_medicalsim_fnc_addSimMenu`

### Description

Adds a medical sim menu to an eden entity.

### Parameters

1. Eden entity `\\<OBJECT>`
1. Stretchers `\\<ARRAY>`
    1. Stretcher `\\<ARRAY>`
        1. Stretcher Entity `\\<OBJECT>`
        1. Display Name `\\<STRING>`

### Returns

Nothing.

### Usage

~~~admonish example
```sqf
[
    _console,
    [
      [_stretcher, "Stretcher 1"],
      [_stretcher, "Stretcher 2"]
    ]
] call afl_medicalsim_fnc_addSimMenu;
```
~~~
