//
// W.cpp
//
// Code generation for function 'W'
//

// Include files
#include "W.h"
#include "dynamic_data.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

// Function Definitions
real_T W(real_T b)
{
  real_T tmp;
  real_T y;
  covrtLogFcn(&emlrtCoverageInstance, 2, 0);
  covrtLogBasicBlock(&emlrtCoverageInstance, 2, 0);
  tmp = muDoubleScalarAbs(b);
  if (covrtLogIf(&emlrtCoverageInstance, 2, 0, 0, tmp < 0.001)) {
    covrtLogBasicBlock(&emlrtCoverageInstance, 2, 1);
    y = 0.0;
  } else if (covrtLogCond(&emlrtCoverageInstance, 2, 0, 0, tmp >= 0.001) &&
             covrtLogCond(&emlrtCoverageInstance, 2, 0, 1, tmp <= 0.01)) {
    covrtLogMcdc(&emlrtCoverageInstance, 2, 0, 0, true);
    covrtLogIf(&emlrtCoverageInstance, 2, 0, 1, true);
    covrtLogBasicBlock(&emlrtCoverageInstance, 2, 2);
    y = (tmp - 0.001) / 0.0090000000000000011;
  } else {
    covrtLogMcdc(&emlrtCoverageInstance, 2, 0, 0, false);
    covrtLogIf(&emlrtCoverageInstance, 2, 0, 1, false);
    covrtLogBasicBlock(&emlrtCoverageInstance, 2, 3);
    y = 1.0;
  }
  return y;
}

// End of code generation (W.cpp)
