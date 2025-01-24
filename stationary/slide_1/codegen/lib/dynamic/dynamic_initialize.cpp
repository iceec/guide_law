//
// File: dynamic_initialize.cpp
//
// MATLAB Coder version            : 5.4
// C/C++ source code generated on  : 20-Jan-2025 23:37:19
//

// Include Files
#include "dynamic_initialize.h"
#include "dynamic_data.h"
#include "eml_rand.h"
#include "eml_rand_mcg16807_stateful.h"
#include "eml_rand_mt19937ar_stateful.h"
#include "eml_rand_shr3cong_stateful.h"
#include "rt_nonfinite.h"

// Function Definitions
//
// Arguments    : void
// Return Type  : void
//
void dynamic_initialize()
{
  state_not_empty_init();
  eml_rand_init();
  eml_rand_mcg16807_stateful_init();
  eml_rand_shr3cong_stateful_init();
  isInitialized_dynamic = true;
}

//
// File trailer for dynamic_initialize.cpp
//
// [EOF]
//
