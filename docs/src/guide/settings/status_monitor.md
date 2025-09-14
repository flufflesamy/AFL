# Status Monitor Settings

Settings for the Status Monitor component.

## Contents

<!-- toc -->

## Server Settings

### Update Interval (s)

Interval in seconds of how often status monitor updates.

**Type:** Slider

**Range:** 0-10s

**Default:** 5s

### Range (m)

Distance between player and unit in meters before monitor shows as out of range.

**Type:** Slider

**Range:** 0-1000m

**Default:** 100m

### X on PR 0

Show X if unit is in cardiac arrest.

**Type:** Checkbox

**Default:** False

### Out-of-Range

Show OOR indicator if unit is out of range.

**Type:** Checkbox

**Default:** False

## Client Settings

### Text Color

Color of text, including unit name, PR, and icons.

### Normal Color

Color when unit heart rate is in normal range.

### Abnormal Color

Color when unit heart rate is not in normal range.

### Out-of-Range Color

Color when unit is out-of-range.

### Critical Color

Color when unit has a heart rate of 0 or out of range.

### Heart Color

Color of heart icon.
