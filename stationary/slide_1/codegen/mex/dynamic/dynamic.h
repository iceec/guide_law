//
// dynamic.h
//
// Code generation for function 'dynamic'
//

#pragma once

// Include files
#include "rtwtypes.h"
#include "covrt.h"
#include "emlrt.h"
#include "mex.h"
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

// Function Declarations
void dynamic(const emlrtStack *sp, real_T vm, real_T vt, real_T q, real_T r,
             real_T yita_m, real_T yita_t, real_T t, real_T *dr, real_T *dq,
             real_T *ddelt_m, real_T *ddelt_t, real_T *Am);

// End of code generation (dynamic.h)
