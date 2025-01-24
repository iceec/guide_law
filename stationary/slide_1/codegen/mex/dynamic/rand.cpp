//
// rand.cpp
//
// Code generation for function 'rand'
//

// Include files
#include "rand.h"
#include "dynamic_data.h"
#include "rt_nonfinite.h"

// Function Definitions
namespace coder {
real_T b_rand()
{
  real_T r;
  emlrtRandu(&r, 1);
  return r;
}

} // namespace coder

// End of code generation (rand.cpp)
