# Medical Settings

Settings for the AFL Medical component.

## Contents

<!-- toc -->

## Bandaging

Settings for adjusting bandage time.

### Base Bandage Time (S)

Time in seconds for bandaging small wounds.

Type: Slider

Range: 0-20s

Default Value: 4s

### Base Bandage Time (M)

Time in seconds for bandaging medium wounds.

Type: Slider

Range: 0-20s

Default Value: 6s

### Base Bandage Time (L)

Time in seconds for bandaging large wounds.

Type: Slider

Range: 0-20s

Default Value: 6s

## Tourniquet

Settings for neck tourniquet behavior.

### Enable Neck Tourniquet

Enables the ability to tourniquet necks.

Type: Checkbox

Default Value: False

## IV

### Enable IV Fluid Blocking

When enabled, fluids have a chance to block IV lines depending on viscosity.

Type: Checkbox

Default Value: False

### IV Block Chance Coefficient

Where a coefficient of 1 equals 0.1% block chance per coagulation value (e.g. Plasma 1000ml has coagulation value of 20).

Type: Slider

Range: 0.05-10

Default Value: 1
