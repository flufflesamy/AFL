#include "script_component.hpp"

[QGVAR(neckTourniquetLocal), LINKFUNC(neckTourniquetLocal)] call CFUNC(addEventHandler);
[QGVAR(neckTourniquetLocal), LINKFUNC(neckTourniquetEffects)] call CFUNC(addEventHandler);
[QGVAR(neckTourniquetLocal), KEFUNC(misc,setTourniquetTime)] call CFUNC(addEventHandler);
[QACEGVAR(medical_treatment,tourniquetRemove), KEFUNC(misc,removeTourniquetTime)] call CFUNC(addEventHandler);

[QACEGVAR(medical_gui,updateBodyImage), LINKFUNC(ui_updateBodyImage)] call CFUNC(addEventHandler);

[QGVAR(neckTourniquetVisual), LINKFUNC(neckTourniquetVisual)] call CFUNC(addEventHandler);
