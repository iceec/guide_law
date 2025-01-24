//
// File: _coder_dynamic_mex.h
//
// MATLAB Coder version            : 5.4
// C/C++ source code generated on  : 20-Jan-2025 23:37:19
//

#ifndef _CODER_DYNAMIC_MEX_H
#define _CODER_DYNAMIC_MEX_H

// Include Files
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"

// Function Declarations
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS();

void unsafe_dynamic_mexFunction(int32_T nlhs, mxArray *plhs[5], int32_T nrhs,
                                const mxArray *prhs[7]);

#endif
//
// File trailer for _coder_dynamic_mex.h
//
// [EOF]
//
