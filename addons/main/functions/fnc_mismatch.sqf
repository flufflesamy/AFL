#include "..\script_component.hpp"
/*
 * Author: flufflesamy
 * Shows error message on client's screen on CBA version mismatch.
 *
 * Arguments:
 * 0: Remote Version <ARRAY>
 *  [MAJOR, MINOR, PATCH, BUILD]
 * 1: Local Version <ARRAY>
 *  [MAJOR, MINOR, PATCH, BUILD]
 * 2: Unit (unused) <OBJECT>
 * 3: Level (unused) <NUMBER>
 *
 * Return Value:
 * Nothing.
 *
 * Example:
 * [[0, 7, 0, 1], [0, 6, 8, 9], player, 2] call afl_main_fnc_mismatch;
 *
 * Public: No
 */
params ["_remoteVersion", "_localVersion", "", ""];

// Explode version arrays into its constituent parts
EXPLODE_4(_remoteVersion,_remoteMajor,_remoteMinor,_remotePatch,_remoteBuild);
EXPLODE_4(_localVersion,_localMajor,_localMinor,_localPatch,_localBuild);

// Get nice human readable strings out of version numbers
private _remoteVersionString = format ["%1.%2.%3.%4",_remoteMajor,_remoteMinor,_remotePatch,_remoteBuild];
private _localVersionString = format ["%1.%2.%3.%4",_localMajor,_localMinor,_localPatch,_localBuild];

// If true, then server is outdated
private _localOutdated = false;
switch (true) do {
    case (_remoteMajor > _localMajor): {
        _localOutdated = true;
    };
    case ((_remoteMajor == _localMajor) && (_remoteMinor > _localMinor)): {
        _localOutdated = true;
    };
    case ((_remoteMajor == _localMajor) && (_remoteMinor == _localMinor) && (_remotePatch > _localPatch)): {
        _localOutdated = true;
    };
    case ((_remoteMajor == _localMajor) && (_remoteMinor == _localMinor) && (_remotePatch == _localPatch) && (_remoteBuild > _localBuild)): {
        _localOutdated = true;
    }
};

if (_localOutdated) then {
    ERROR_MSG_2("Client AFL Version Outdated!\nLocal version %2 does not match remote version %1.\nPlease update AFL by repairing your mod in the launcher or by downloading a new version on GitHub.\nFor more information, please refer to https://flufflesamy.github.io/AFL/guide/install",_remoteVersionString,_localVersionString);
} else {
    ERROR_MSG_2("Server AFL Version Outdated!\nLocal version %2 does not match remote version %1.\nPlease ask your server operator to update AFL.",_remoteVersionString,_localVersionString);
};

