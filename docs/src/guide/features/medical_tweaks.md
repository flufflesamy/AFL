# Medical Tweaks

AFL modifies the behavior of ACE Medical and KAT Advanced Medical. This page lists some of the important tweaks and fixes.

## Dressing Vacuum (NPWT)

The NPWT has always been broken in KAM. Where it would often not bandage and stitch the patient in one
go, and would kick the medic out of the medical menu as well. AFL completely rewrites the NPWT functions to address these
issues.

The NPWT now bandages and stitches the patient's wounds fully. It also returns the medic back to the medical menu
on completion. The NPWT now can be used on bruises and body part trauma, not just when there are open or bandaged wounds.

## Neck Tourniquets

Whereas the original neck tourniquet feature was an April Fools joke by the KAM developers[^1], AFL turns this joke feature
into a real feature.

Medics can now apply a tourniquet to a patient's neck. This stops bleeding, but stops breathing, causes pain,
increases then decreases heart rate, and eventually causes cardiac arrest.

## IV Enhancements

### Bag Type Display

ACE Medical Menu body part overview now shows the amount and types of IV bags on a body part and their progress.

![](../../images/bag_display.png)

### Clog Chance

AFL adds an option (disabled by default) for IV lines to clog based on fluid coagulation factor. Clearing blocked lines
now only requires pushing saline though the line and does not require a separate action.

### Flow Rate Rework

```admonish note
As maximum flow rate is capped by catheter diameter, reworked flow rates may be unacceptably slow (e.g. a 16g IV is capped
at 180ml/min). If that is the case, server operators can increase the "IV Transfusion Flow Rate" setting in the ACE Medical
CBA settings. A flow rate multiplier of 4-5 is recommended for most groups.
```

AFL changes the behavior IV flow rates. The flow rate of IV lines now depends on blood pressure and fluid viscosity
and is capped by the flow rate of the respective catheters (e.g. 16g IV and FAST IO).
Flow rate is calculated using the following equation:

\\[Q = \min((Q_{max}K_{\eta}K_{BP}),Q_{max})\\]

Where \\(Q\\) is the volumetric flow rate in ml/s, \\(Q_{max}\\) is the maximum flow rate of a catheter
(3ml/s for 16g IV, 1.33ml/s for IO), \\(K_{\eta}\\) is the fluid viscosity coefficient
(1 for saline, 0.85 for plasma, 0.5 for blood. Based on relative viscosities for each fluid.[^2]),
and \\(K_{BP}\\) is the blood pressure coefficient.

\\(K_{BP}\\) is extrapolated from flow rate data by Kim et al.[^3] and is calculated using the following equation:

\\[K_{bp} = -0.01 P_{MAP} + 1.93\\]

Where \\(P_{MAP}\\) is the patient's mean arterial pressure.

\\(P_{MAP}\\) is calculated using the following equation:

\\[P_{MAP} = \frac{1}{3} P_{SBP} + \frac{2}{3} P_{DBP} \\]

Where \\(P_{SBP}\\) is systolic blood pressure in mmHg and \\(P_{DBP}\\) is diastolic blood pressure in mmHg.

[^1]: [Removed](https://github.com/KAT-Advanced-Medical/KAM/pull/567) on Jul 31, 2024.

[^2]: ‘12.4: Viscosity and Laminar Flow; Poiseuille’s Law’, Physics LibreTexts, 1 November 2015, sec. 12.4.1, <https://phys.libretexts.org/Bookshelves/College_Physics/College_Physics_1e_(OpenStax)/12%3A_Fluid_Dynamics_and_Its_Biological_and_Medical_Applications/12.04%3A_Viscosity_and_Laminar_Flow_Poiseuilles_Law>.

[^3]: Nayoung Kim, Hanna Lee, and Jeongwon Han, ‘Comparison of Fluid Flow Rates by Fluid Height and Catheter Size in Normal and Hypertensive Blood-Pressure Scenarios’, Healthcare 12, no. 23 (December 2024): 2445, <https://doi.org/10.3390/healthcare12232445>.
