# Hot Reload

AFL supports function hot reload when using file patching. This allows developers to recompile functions without restarting
Arma 3 or even their mission, speeding up debugging considerably.

```admonish note
Hot reload **only applies to functions** that are registered with `PREP()`. Therefore, new functions added after starting
the game will require a restart.

Similarly, hot reload **does not reload config files**. Any changes to them will require a game restart.
```

## Preparing for Hot Reload

In order for hot reload to work, file patching and `DEBUG_MODE_FULL` must be enabled. When using the `[ps1] hemtt launch`
command, this will be done automatically, and no other action is required.

## Reloading Functions

In the Arma 3 debug console, run the following command:

```sqf
[] call AFL_PREP_RECOMPILE;
```

All functions in the project that are registered with `PREP()` in a component's `[txt] XEH_PREP.hpp` file will now be recompiled.
