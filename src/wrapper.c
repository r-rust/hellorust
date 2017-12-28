#define R_NO_REMAP
#define STRICT_R_HEADERS
#include <Rinternals.h>

// Where you define the C headers
#include "mylib/mylib.h"

SEXP hello_wrapper(SEXP name){
  return Rf_ScalarString(Rf_mkCharCE(string_from_rust(), CE_UTF8));
}
