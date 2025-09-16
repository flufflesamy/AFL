# Medical Settings

Settings for the AFL Medical component.

## Contents

<!-- toc -->

## Bandaging

Settings for adjusting bandage time.

### Base Bandage Time (S)

Time in seconds for bandaging small wounds.

**Type:** Slider

**Range:** 0-20s

**Default:** 4s

### Base Bandage Time (M)

Time in seconds for bandaging medium wounds.

**Type:** Slider

**Range:** 0-20s

**Default:** 6s

### Base Bandage Time (L)

Time in seconds for bandaging large wounds.

**Type:** Slider

**Range:** 0-20s

**Default:** 6s

## Dressing Vacuum (NPWT)

### Allow Self Treatment

If enabled, allows medic to use dressing vacuum on self.

**Type:** Dropdown

**Options:**

- No
- Body and Legs Only
- Yes

**Default:** No

### NPWT Bandage Time

Time in seconds for dressing vacuum to bandage wound.

**Type:** Slider

**Range:** 0-15s

**Default:** 5s

### NPWT Stitch Time

Time in seconds for dressing vacuum to stitch wound.

**Type:** Slider

**Range:** 0-15s

**Default:** 3s

### Normalize NPWT Time

When enabled, dressing vacuum treatment time takes body part damage into account.
Total time is calculated with the following equation:

\\[{t_{total}} = (1 - p)({t_{bandage}} + {t_{stitch}}) + pmd\\]

Where \\(t \\) is time in seconds, \\(p \\) is the normalize proportion (50% = 0.5), \\(m \\) is the body part damage multiplier,
and \\(d \\) is body part damage.

**Type:** Checkbox

**Default:** True

### Body Part Damage Proportion

Proportion of body part damage in percent that makes up total NPWT treatment time.

**Type:** Slider

**Range:** 0-100%

**Default:** 50%

### Body Part Damage Multiplier

Multiplier to multiply body part damage to.

**Type:** Slider

**Range:** 0-5

**Default:** 1.25

## Tourniquet

Settings for neck tourniquet behavior.

### Enable Neck Tourniquet

Enables the ability to tourniquet necks.

**Type:** Checkbox

**Default:** False

## IV

### Enable IV Fluid Blocking

When enabled, fluids have a chance to block IV lines depending on viscosity.

**Type:** Checkbox

**Default:** False

### IV Block Chance Coefficient

Where a coefficient of 1 equals 0.1% block chance per coagulation value (e.g. Plasma 1000ml has coagulation value of 20).

Type: Slider

**Range:** 0.05-10

**Default:** 1
