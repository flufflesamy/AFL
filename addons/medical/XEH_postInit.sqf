#include "script_component.hpp"

// ["CBA_settingsInitialized", {

// }] call CFUNC(addEventHandler);

[QGVAR(neckTourniquetLocal), LINKFUNC(neckTourniquetLocal)] call CFUNC(addEventHandler);
[QGVAR(neckTourniquetLocal), LINKFUNC(handleNeckTourniquetEffects)] call CFUNC(addEventHandler);
[QGVAR(neckTourniquetLocal), KEFUNC(misc,setTourniquetTime)] call CFUNC(addEventHandler);
[QACEGVAR(medical_treatment,tourniquetRemove), KEFUNC(misc,removeTourniquetTime)] call CFUNC(addEventHandler);

[QACEGVAR(medical_gui,updateBodyImage), LINKFUNC(ui_updateBodyImage)] call CFUNC(addEventHandler);
