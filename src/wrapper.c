#include <Rinternals.h>

// Import C headers for rust API
#include "myrustlib/api.h"

// Actual Wrappers
SEXP hello_wrapper(void){
  char* hello_rust = string_from_rust();
  SEXP hello_world_string = PROTECT(Rf_mkCharCE(hello_rust, CE_UTF8));
  free_string_from_rust(hello_rust);
  UNPROTECT(1);
  return Rf_ScalarString(hello_world_string);
}

SEXP random_wrapper(void){
  return Rf_ScalarInteger(random_number());
}

SEXP threads_wapper(void){
  run_threads();
  return R_NilValue;
}

// Standard R package stuff
static const R_CallMethodDef CallEntries[] = {
  {"hello_wrapper", (DL_FUNC) &hello_wrapper, 0},
  {"random_wrapper", (DL_FUNC) &random_wrapper, 0},
  {"threads_wapper", (DL_FUNC) &threads_wapper, 0},
  {NULL, NULL, 0}
};

void R_init_hellorust(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
