//
// nthroot.cpp
//
// Code generation for function 'nthroot'
//

// Include files
#include "nthroot.h"
#include "dynamic_data.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

// Function Definitions
namespace coder {
real_T nthroot(real_T x)
{
  real_T y;
  if (x < 0.0) {
    y = -muDoubleScalarPower(-x, 0.14285714285714285);
  } else {
    y = muDoubleScalarPower(x, 0.14285714285714285);
  }
  if ((!muDoubleScalarIsInf(y)) && (!muDoubleScalarIsNaN(y)) && (x != 0.0)) {
    real_T d;
    real_T y2n;
    y2n = muDoubleScalarPower(y, 7.0);
    d = y2n - x;
    if (d != 0.0) {
      y -= d / (7.0 * (y2n / y));
    }
  }
  return y;
}

} // namespace coder

// End of code generation (nthroot.cpp)
