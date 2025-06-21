#include "\x\cba\addons\main\script_macros_common.hpp"

#define AFUNC(var) TRIPLES(ADDON,fnc,var)
#define AVAR(v) DOUBLES(ADDON,v)
#define QAVAR(v) QUOTE(AVAR(v))
#define QDAVAR(var1, var2) DOUBLES(AVAR(var1),var2)
#define ENTVAR(var1) DOUBLES(fr,var1)
#define QENTVAR(var1) QUOTE(ENTVAR(var1))

// CBA functions
#define CFUNC(var) TRIPLES(CBA,fnc,var)

// ACE functions
// #define ACEFUNC(var) TRIPLES(ace,fnc,var)
#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)
#define ACEVAR(var) DOUBLES(ace,var)
#define ACEEVAR(var1,var2) TRIPLES(ace,var1,var2)
#define ACEGVAR(var1) TRIPLES(ace,medical,var1)
#define QACEGVAR(var1) QUOTE(ACEGVAR(var1))

// KAM functions
#define KFUNC(var) TRIPLES(kat,fnc,var)
#define KEFUNC(var1,var2) TRIPLES(DOUBLES(kat,var1),fnc,var2)

// KAM variables
#define KVAR(var) DOUBLES(kat,var)
#define KGVAR(var1) TRIPLES(kat,medical,var1)
#define QKVAR(var) QUOTE(KVAR(var))
#define QKGVAR(var1) QUOTE(KGVAR(var1))