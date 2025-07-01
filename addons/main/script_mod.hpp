#define MAINPREFIX z
#define PREFIX afl
#define SUBPREFIX addons

// #define DEBUG_MODE_FULL

#ifdef DEBUG_MODE_FULL
    #define DISABLE_COMPILE_CACHE
#endif

#include "script_version.hpp"

#define REQUIRED_VERSION 2.20

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Amy Functions Library - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(Amy Functions Library - COMPONENT)
#endif
