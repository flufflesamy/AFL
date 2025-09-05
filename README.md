# AFL - Selkie Medical Mod

[GitHub](https://github.com/flufflesamy/AFL) |
[Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3513989482) |
[Changelog](https://github.com/flufflesamy/AFL/blob/testing/CHANGELOG.md)

## Overview

AFL - Selkie Medical Mod (AFL) is an Arma 3 addon that aims to add medical functionality to ACE and KAM medical systems,
with the aim to enhance and fix both addons.

This mod was created for the Selkie Platoon, a Halo ODST Arma 3 unit, however it does not have any dependencies on OPTRE or
unit specific mods.

## Features

### Medical Tweaks

AFL modifies the behavior of ACE Medical and KAT Advanced Medical. Currently contains the following functions:

- Add setting for base bandage time.
- Re-add ability to tourniquet necks.
- Normalize IV flow rates based on IRL data.
- Add IV clog chance based on coagulation factor.
- Fix KAM dressing vacuum.

### Medical Simulator

AFL includes a medical simulator interface for practicing KAT Advanced Medical. Includes the following functions:

- Spawn and apply medical conditions to patients:
  - Wounds.
  - Airway.
  - Cardiac arrest.
  - Pneumothorax.
  - Fractures.
- Preset system.

### Firing Range Mission

AFL adds `Selkie_FiringRange.Stratis`, a firing range map that includes targets, a medical simulator, and a vehicle spawner.

### Status Monitor

AFL adds a status monitor item that adds HUD overlay showing heart rate of units in player's group. Includes TL variant that shows distance instead of heart rate.

## Dependencies

- [CBA](https://github.com/CBATeam/CBA_A3)
- [ace](https://github.com/acemod/ACE3)
- [KAM](https://github.com/KAT-Advanced-Medical/KAM)
- [O&T Expansion Eden](https://steamcommunity.com/workshop/filedetails/?id=1923321700) (Firing Range Only)

## Build Instructions

This repo uses HEMTT for building and packaging. See [the docs](https://hemtt.dev/) for more instructions.

To build and launch, run:

```sh
hemtt dev
```

## License

Copyright (C) 2025 flufflesamy and AFL Contributors

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program also includes modified code from other projects. Unless stated otherwise, modified code is also licensed under GPLv3. Please see copyright disclaimers in individual files for more information.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
