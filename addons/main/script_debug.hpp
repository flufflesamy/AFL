/**
Fast Recompiling via function
**/
#define DISABLE_COMPILE_CACHE
// To Use: [] call AFL_PREP_RECOMPILE;

#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {call FUNC(x)}
    #define PREP_RECOMPILE_START    if (isNil "AFL_PREP_RECOMPILE") then {AFL_RECOMPILES = []; AFL_PREP_RECOMPILE = {{call _x} forEach AFL_RECOMPILES;}}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp; AFL_RECOMPILES pushBack _recomp;
#else
    #define LINKFUNC(x) FUNC(x)
    #define PREP_RECOMPILE_START ; /* disabled */
    #define PREP_RECOMPILE_END ; /* disabled */
#endif
