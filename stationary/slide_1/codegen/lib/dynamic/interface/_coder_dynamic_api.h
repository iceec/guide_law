//
// File: _coder_dynamic_api.h
//
// MATLAB Coder version            : 5.4
// C/C++ source code generated on  : 20-Jan-2025 23:37:19
//

#ifndef _CODER_DYNAMIC_API_H
#define _CODER_DYNAMIC_API_H

// Include Files
#include "emlrt.h"
#include "tmwtypes.h"
#include <algorithm>
#include <cstring>

// Variable Declarations
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

// Function Declarations
void dynamic(real_T vm, real_T vt, real_T q, real_T r, real_T yita_m,
             real_T yita_t, real_T t, real_T *dr, real_T *dq, real_T *ddelt_m,
             real_T *ddelt_t, real_T *Am);

void dynamic_api(const mxArray *const prhs[7], int32_T nlhs,
                 const mxArray *plhs[5]);

void dynamic_atexit();

void dynamic_initialize();

void dynamic_terminate();

void dynamic_xil_shutdown();

void dynamic_xil_terminate();

#endif
//
// File trailer for _coder_dynamic_api.h
//
// [EOF]
//
