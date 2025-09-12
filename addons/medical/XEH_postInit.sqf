#include "script_component.hpp"

// Register Events
[QGVAR(neckTourniquetLocal), LINKFUNC(neckTourniquetLocal)] call CFUNC(addEventHandler);
[QGVAR(neckTourniquetLocal), LINKFUNC(neckTourniquetEffects)] call CFUNC(addEventHandler);
[QGVAR(neckTourniquetLocal), KEFUNC(misc,setTourniquetTime)] call CFUNC(addEventHandler);

[QACEGVAR(medical_gui,updateBodyImage), LINKFUNC(ui_updateBodyImage)] call CFUNC(addEventHandler);

[QACEGVAR(medical_treatment,ivBagLocal), LINKFUNC(fluidBlock)] call CFUNC(addEventHandler);
[QACEGVAR(medical_treatment,ivBagLocal), LINKFUNC(salineFlush)] call CFUNC(addEventHandler);

[QGVAR(neckTourniquetVisual), LINKFUNC(neckTourniquetVisual)] call CFUNC(addEventHandler);

[QACEGVAR(medical_gui,updateInjuryListPart), LINKFUNC(ui_updateInjuryListPart)] call CFUNC(addEventHandler);

[QGVAR(npwtSuccessLocal), LINKFUNC(npwtSuccessLocal)] call CFUNC(addEventHandler);
[QGVAR(npwtProgressLocal), LINKFUNC(npwtProgressLocal)] call CFUNC(addEventHandler);

[QGVAR(surgicalKitProgressLocal), LINKFUNC(surgicalKitProgressLocal)] call CFUNC(addEventHandler);

// set coag hash
[] call FUNC(setCoagHash);

// set downgrade fluid hash
[] call FUNC(setConsumeFluidHash);
