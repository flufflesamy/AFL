# Events

Event handlers in AFL are implemented through CBA's eXtended Event Handler (XEH) system.
This chapter lists the XEH events that AFL registers, the parameters they pass, and the functions that handle them.

XEH events can be raised using CBA XEH functions. For instance, the function `CBA_fnc_targetEvent` raises
a local event on the target's machine.

For more information on XEH, refer to [CBA's XEH Documentation](https://github.com/CBATeam/CBA_A3/wiki/Extended-Event-Handlers-(new)).
