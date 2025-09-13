# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

#### Docs

- Add contributing section to main README.

#### Project

- Rename licenses folder to external_licenses so that GitHub doesn't get confused.

## [v0.7.0] - 2025-09-13

### Added

#### Extras

- README file.

#### Main

- Add custom CBA version mismatch logic to show large error message if client attempt to connect with outdated AFL version.

#### Medical

- NPWT rewrite (Resolves [#8](https://github.com/flufflesamy/AFL/issues/8))
  - Rewrite functions to remove dependencies on ACE and KAM functions.
  - Fine-grained CBA settings to change bandage and stitch time, as well as body part damage normalization behavior.
  - Configurable ability to self-treat using NPWT.
  - Stitch and bandage functions.
  - More error checks to functions.
- Surgical kit rewrite
  - Rewrite surgical kit implementation to match NPWT.
  - Surgical kit now replaces function of clamp, retractor, and bone plate for KAM fracture surgeries.
  - Surgical kit functions.
- Fracture irrigation tweaks
  - Can now use any size saline to irrigate wounds.
  - Uses consumeFluid function to dynamically remove larger fluid bags and replace with a combination of smaller ones.
  - Irrigation start and condition functions.
- Tooltips to settings.

#### Misc

- addVehicleSpawner function.

#### Project

- CONTRIBUTING.md and CODE_OF_CONDUCT.md
- License folder with ACE and KAM licenses.
- New Selkie 2025-09-10 preset.

### Changed

#### Docs

- Flesh out documentation (Resolves [#9](https://github.com/flufflesamy/AFL/issues/9)).
- Add scripts for installing dependencies.
- Update README to reflect new contributor's guide (CONTRIBUTING.md).

#### Extras

- Update server settings file to match current Selkie settings.
- Update status monitor asset source file.

#### Medical

- NPWT
  - Remove per-frame state checking from npwtProgress function to improve performance.
  - Treatment time for trauma clearing now takes body part damage into account.
  - Make limping update run on every npwtSuccessLocal to stop issues with limping not clearing.
- Convert settings to use stringtables.
- Update function headers to show if function is part of public API.

#### Medical Sim

- Increase maximum number of wounds in simulator to 20.
- Increase variety of wounds for the testdamage damage type to include cuts and bruises.

#### Missions

- Update firing range mission mod settings to match Selkie settings.
- Update init.sqf of firing range mission to use addVehicleSpawner function.

### Fixed

#### Docs

- Deployment script caching.

#### Medical

- NPWT triage card display (Resolves [#11](https://github.com/flufflesamy/AFL/issues/11)).

#### Medical Sim

- Missing pneumothorax deteriorate stringtable entry.
- Stringtable typos.

### Removed

#### Extras

- Old logo assets.

#### Medical

- npwtStitchLocal function.

## [v0.6.8] - 2025-09-06

### Added

#### Main

- CBA versioning macros.
- Register addon with CBA versioning system.

#### Project

- Antistasi launch preset.
- Build hooks.
- Documentation website created with mdbook.
- Version bump scripts.

### Changed

#### Main

- Unified mod name in config files.

#### Medical

- NPWT
  - ACE medical log entry on NPWT treatment.
  - Timeout to npwtProgress.
  - Treatment now clears all trauma and bruises.
    - Can now use NPWT on trauma and bruises, not just open wounds.
  - Treatment time now takes trauma into account.
    - Prevents treatment times being unusually long or short.
- Unified function header style of afl_medical module with ACE.

### Fixed

#### Main

- Incorrect VERSION_CONFIG.

#### Medical

- NPWT
  - Not stitching wounds correctly.
  - Overshooting timer ([#6](https://github.com/flufflesamy/AFL/issues/6)).
- Incorrect function header documentation.

#### Project

- Incorrect .editorconfig syntax.

### Removed

#### Medical

- Unused npwtSuccess function.

## [v0.6.7] - 2025-09-03 [YANKED]

### Fixes

- More attempts to fix.

## [v0.6.6] - 2025-09-03 [YANKED]

### Fixed

- NPWT overshooting timer.

## [v0.6.5] - 2025-09-02

### Fixed

- NPWT not completing again (regression in v0.6.3).

## [v0.6.4] - 2025-09-02

### Fixed

- NPWT not completing on time.

## [v0.6.3] - 2025-09-02

### Changed

- Normalize NPWT function so treatment is not completed before timer.

### Fixed

- Fix launch.toml preset typo.

## [v0.6.2] - 2025-08-27

### Added

- Current Selkie modlist.

### Fixed

- Cross icon showing up twice in some circumstances.
- Medical menu keybinds not working as expected.

### Removed

- Redundant firing range map objects.
- Old Selkie modlists.

## [v0.6.1] - 2025-08-17

### Changed

- Convert medical sim strings to use stringtable.

### Fixed

- KAM NPWT being interrupted.
- KAM NPWT not clearing trauma.
- KAM NPWT closing medical menu after treatment.
- KAM surgery tab not accessible via hotkeys.
- "Left Arm" showing up twice in medical simulator.

## [v0.6.0] - 2025-08-16

### Added

- TL version of status monitor that shows distance to player.
- TL status monitor item.
- Status monitor out of range indicator.
- Status monitor out of range CBA option.
- New icon for status monitor uncon HR.

### Changed

- Critical color for status monitor on HR 0.
- Refactor ui_updateMonitor.
- Update changelog.
- Update README.

### Removed

- Unnecessary status monitor init call in PostInit.

## [v0.5.0] - 2025-08-06

### Added

- Preset system.
  - Default presets.
- Status monitor feature.
  - Status monitor UI.
  - Status monitor item.
  - Status monitor CBA settings.
  - Logging to functions.

### Changed

- Moved defaultControls example to extras folder.
- Updated function comments.
- Update README.md
- Update lints.
- Update build config.

### Fixed

- Invalid item names for medical sim patients.
- Status monitor not hiding when item removed.

### Removed

- Unused comments.

## [v0.4.0] - 2025-07-24

### Added

- KAM macros.
- Contributor list.
- IV block chance based on fluid coagulation factor.
- IV block chance setting.
- IV flow rate rework based on IRL values.
- Medical menu overview display for IV bags on body parts.
- Unconscious setting to medical sim.
- Changelog.

### Changed

- New logo by multicarinata.
- README to reflect contributors.
- Change mod name to "AFL - Selkie Medical Mod".
- Replaced legacy KAM airway function calls with updated ones.
- General code cleanup.
- Update modlist to Selkie latest.
- Update firing range mod settings.
- Update server settings.
- Reorder spawn comps in firing range map.

### Removed

- Unused files

## [v0.3.0] - 2025-07-14

### Added

- Confirm function to "Clear All" button in medical simulator.

### Changed

- Make neck tourniquets much more realistic. Now, neck TQs simulate the effects
of cerebral ischemia, asphyxiation, and the carotid sinus reflex.
- Update mission and server mod settings to reflect current Selkie platoon ones.
- Update mod preset to 2025-07-13.

## [v0.2.0] - 2025-07-11

### Added

- Setting to change base bandage time.
- Ability to tourniquet necks.

### Changed

- De-optrefy medical simulator mission.

## [v0.1.2] - 2025-07-01

### Fixed

- Fix loading of firing range mission.

## [v0.1.1] - 2025-07-01

### Fixed

- Fix logo.

## [v0.1.0] - 2025-07-01

### Added

- Initial release containing medical simulator and firing range.

[Unreleased]: https://github.com/flufflesamy/AFL/compare/v0.7.0...testing
[v0.7.0]: https://github.com/flufflesamy/AFL/compare/v0.6.8..v0.7.0
[v0.6.8]: https://github.com/flufflesamy/AFL/compare/v0.6.7..v0.6.8
[v0.6.7]: https://github.com/flufflesamy/AFL/compare/v0.6.6..v0.6.7
[v0.6.6]: https://github.com/flufflesamy/AFL/compare/v0.6.5..v0.6.6
[v0.6.5]: https://github.com/flufflesamy/AFL/compare/v0.6.4..v0.6.5
[v0.6.4]: https://github.com/flufflesamy/AFL/compare/v0.6.3..v0.6.4
[v0.6.3]: https://github.com/flufflesamy/AFL/compare/v0.6.2..v0.6.3
[v0.6.2]: https://github.com/flufflesamy/AFL/compare/v0.6.1..v0.6.2
[v0.6.1]: https://github.com/flufflesamy/AFL/compare/v0.6.0..v0.6.1
[v0.6.0]: https://github.com/flufflesamy/AFL/compare/v0.5.0..v0.6.0
[v0.5.0]: https://github.com/flufflesamy/AFL/compare/v0.4.0..v0.5.0
[v0.4.0]: https://github.com/flufflesamy/AFL/compare/v0.3.0..v0.4.0
[v0.3.0]: https://github.com/flufflesamy/AFL/compare/v0.2.0..v0.3.0
[v0.2.0]: https://github.com/flufflesamy/AFL/compare/v0.1.2..v0.2.0
[v0.1.2]: https://github.com/flufflesamy/AFL/compare/v0.1.1..v0.1.2
[v0.1.1]: https://github.com/flufflesamy/AFL/compare/v0.1.0.0...v0.1.1
[v0.1.0]: https://github.com/flufflesamy/AFL/compare/v0.1.0.0...v0.1.0.0
