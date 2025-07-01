#define COMPONENT medicalsim
#define COMPONENT_BEAUTIFIED Medical Simulator

#include "\z\afl\addons\main\script_mod.hpp"
#include "\z\afl\addons\main\script_macros.hpp"

// AFL macros
#define FRACTURE_TYPE ["none", "simple", "compound", "comminuted"]
#define PNUMO_TYPE ["none", "initial", "tension", "hemo"]
#define ARREST_TYPE ["none", "asystole", "pea", "vf", "vt"]

// idd/idc definitions for UI
#define IDD_MEDSIM_MENU                 324467

#define IDC_SPAWN_BUTTON                11601
#define IDC_CLEAR_BUTTON                11602
#define IDC_CLEARALL_BUTTON             11603

#define IDC_STRETCHERS_CG               11501
#define IDC_WOUNDS_CG                   11502
#define IDC_CARDIAC_CG                  11503
#define IDC_FRACTURES_CG                11504
#define IDC_PTX_CG                      11505
#define IDC_AIRWAY_CG                   11506

#define IDC_STRETCHERS_LISTBOX          1501

#define IDC_WOUNDS_HEAD_SLIDER          14301
#define IDC_WOUNDS_TORSO_SLIDER         14302
#define IDC_WOUNDS_LEFTARM_SLIDER       14303
#define IDC_WOUNDS_RIGHTARM_SLIDER      14304
#define IDC_WOUNDS_LEFTLEG_SLIDER       14305
#define IDC_WOUNDS_RIGHTLEG_SLIDER      14306
#define IDC_AIRWAY_PAO2_SLIDER          14307
#define IDC_PTX_STRENGTH_SLIDER         14308

#define IDC_CARDIAC_COMBO               1401
#define IDC_PTX_TYPE_COMBO              1402
#define IDC_FRACTURES_LEFTARM_COMBO     1403
#define IDC_FRACTURES_RIGHTARM_COMBO    1404
#define IDC_FRACTURES_LEFTLEG_COMBO     1405
#define IDC_FRACTURES_RIGHTLEG_COMBO    1406

#define IDC_WOUNDS_HEAD_VAL             1201
#define IDC_WOUNDS_TORSO_VAL            1202
#define IDC_WOUNDS_LEFTARM_VAL          1203
#define IDC_WOUNDS_RIGHTARM_VAL         1204
#define IDC_WOUNDS_LEFTLEG_VAL          1205
#define IDC_WOUNDS_RIGHTLEG_VAL         1206
#define IDC_AIRWAY_PAO2_VAL             1207
#define IDC_PTX_STRENGTH_VAL            1208

#define IDC_AIRWAY_OCCLUDED_CHECKBOX    17701
#define IDC_AIRWAY_OBSTRUCTED_CHECKBOX  17702
#define IDC_PTX_DETERIORATE_CHECKBOX    17703
#define IDC_PTX_TAMPONADE_CHECKBOX      17704

#define MEDSIM_SLIDER_ARRAY [\
[IDC_WOUNDS_HEAD_SLIDER, IDC_WOUNDS_HEAD_VAL], \
[IDC_WOUNDS_TORSO_SLIDER, IDC_WOUNDS_TORSO_VAL], \
[IDC_WOUNDS_LEFTARM_SLIDER, IDC_WOUNDS_LEFTARM_VAL], \
[IDC_WOUNDS_RIGHTARM_SLIDER, IDC_WOUNDS_RIGHTARM_VAL], \
[IDC_WOUNDS_LEFTLEG_SLIDER, IDC_WOUNDS_LEFTLEG_VAL], \
[IDC_WOUNDS_RIGHTLEG_SLIDER, IDC_WOUNDS_RIGHTLEG_VAL], \
[IDC_AIRWAY_PAO2_SLIDER, IDC_AIRWAY_PAO2_VAL], \
[IDC_PTX_STRENGTH_SLIDER, IDC_PTX_STRENGTH_VAL]\
]

// UI dimensions
#define MEDSIM_BACKGROUND_UW            40
#define MEDSIM_BACKGROUND_UH            22
#define MEDSIM_BACKGROUND_H             POS_H(MEDSIM_BACKGROUND_UH)
#define MEDSIM_BACKGROUND_W             POS_W(MEDSIM_BACKGROUND_UW)
#define MEDSIM_CONTROLS_UH              (MEDSIM_BACKGROUND_UH - 0.2)
#define MEDSIM_CONTROLS_UW              (MEDSIM_BACKGROUND_UW - 0.2)
#define MEDSIM_CG_UW                    ((MEDSIM_CONTROLS_UW / 2) - 0.1)
#define MEDSIM_CG_W                     POS_W(MEDSIM_CG_UW)
#define MEDSIM_CG_LEFT_UX               0.1
#define MEDSIM_CG_LEFT_X                POS_X(MEDSIM_CG_LEFT_UX)
#define MEDSIM_CG_RIGHT_UX              (MEDSIM_CG_LEFT_UX + MEDSIM_CG_UW + 0.2)
#define MEDSIM_CG_RIGHT_X               POS_X(MEDSIM_CG_RIGHT_UX)
#define MEDSIM_CG_GRID_W                (MEDSIM_CG_UW / 20)
#define MEDSIM_CG_POS_W(N)              POS_W(N * MEDSIM_CG_GRID_W)
#define MEDSIM_CG_GRID_H                (MEDSIM_CONTROLS_UH / 22)
#define MEDSIM_CG_POS_H(N)              POS_X(N##.##N)
