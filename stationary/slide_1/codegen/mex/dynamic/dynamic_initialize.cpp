//
// dynamic_initialize.cpp
//
// Code generation for function 'dynamic_initialize'
//

// Include files
#include "dynamic_initialize.h"
#include "_coder_dynamic_mex.h"
#include "dynamic_data.h"
#include "rt_nonfinite.h"

// Function Declarations
static void dynamic_once();

// Function Definitions
static void dynamic_once()
{
  const int32_T postfix_exprs_2_0[3]{0, 1, -3};
  const int32_T cond_ends_2_0[2]{107, 123};
  const int32_T cond_starts_2_0[2]{95, 111};
  mex_InitInfAndNan();
  // Allocate instance data
  covrtAllocateInstanceData(&emlrtCoverageInstance);
  // Initialize Coverage Information
  covrtScriptInit(&emlrtCoverageInstance,
                  "D:\\MatLab\\MissleGuide\\stationary\\slide_1\\dynamic.m", 0U,
                  1U, 3U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U);
  // Initialize Function Information
  covrtFcnInit(&emlrtCoverageInstance, 0U, 0U, "dynamic", 18, -1, 1164);
  // Initialize Basic Block Information
  covrtBasicBlockInit(&emlrtCoverageInstance, 0U, 2U, 1124, -1, 1156);
  covrtBasicBlockInit(&emlrtCoverageInstance, 0U, 1U, 1096, -1, 1118);
  covrtBasicBlockInit(&emlrtCoverageInstance, 0U, 0U, 100, -1, 1070);
  // Initialize If Information
  covrtIfInit(&emlrtCoverageInstance, 0U, 0U, 1073, 1091, -1, 1122);
  // Initialize MCDC Information
  // Initialize For Information
  // Initialize While Information
  // Initialize Switch Information
  // Start callback for coverage engine
  covrtScriptStart(&emlrtCoverageInstance, 0U);
  // Allocate instance data
  covrtAllocateInstanceData(&emlrtCoverageInstance);
  // Initialize Coverage Information
  covrtScriptInit(&emlrtCoverageInstance,
                  "D:\\MatLab\\MissleGuide\\stationary\\slide_1\\sgmf.m", 1U,
                  1U, 3U, 1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U);
  // Initialize Function Information
  covrtFcnInit(&emlrtCoverageInstance, 1U, 0U, "sgmf", 0, -1, 125);
  // Initialize Basic Block Information
  covrtBasicBlockInit(&emlrtCoverageInstance, 1U, 2U, 104, -1, 116);
  covrtBasicBlockInit(&emlrtCoverageInstance, 1U, 1U, 54, -1, 94);
  covrtBasicBlockInit(&emlrtCoverageInstance, 1U, 0U, 21, -1, 32);
  // Initialize If Information
  covrtIfInit(&emlrtCoverageInstance, 1U, 0U, 33, 49, 95, 120);
  // Initialize MCDC Information
  // Initialize For Information
  // Initialize While Information
  // Initialize Switch Information
  // Start callback for coverage engine
  covrtScriptStart(&emlrtCoverageInstance, 1U);
  // Allocate instance data
  covrtAllocateInstanceData(&emlrtCoverageInstance);
  // Initialize Coverage Information
  covrtScriptInit(&emlrtCoverageInstance,
                  "D:\\MatLab\\MissleGuide\\stationary\\slide_1\\W.m", 2U, 1U,
                  4U, 2U, 0U, 0U, 0U, 0U, 0U, 2U, 1U);
  // Initialize Function Information
  covrtFcnInit(&emlrtCoverageInstance, 2U, 0U, "W", 0, -1, 184);
  // Initialize Basic Block Information
  covrtBasicBlockInit(&emlrtCoverageInstance, 2U, 3U, 174, -1, 180);
  covrtBasicBlockInit(&emlrtCoverageInstance, 2U, 2U, 128, -1, 164);
  covrtBasicBlockInit(&emlrtCoverageInstance, 2U, 1U, 81, -1, 87);
  covrtBasicBlockInit(&emlrtCoverageInstance, 2U, 0U, 18, -1, 60);
  // Initialize If Information
  covrtIfInit(&emlrtCoverageInstance, 2U, 0U, 62, 76, 88, 184);
  covrtIfInit(&emlrtCoverageInstance, 2U, 1U, 88, 123, 165, 184);
  // Initialize MCDC Information
  covrtMcdcInit(&emlrtCoverageInstance, 2U, 0U, 95, 123, 2, 0,
                *(int32_T(*)[2]) & cond_starts_2_0[0],
                *(int32_T(*)[2]) & cond_ends_2_0[0], 3,
                *(int32_T(*)[3]) & postfix_exprs_2_0[0]);
  // Initialize For Information
  // Initialize While Information
  // Initialize Switch Information
  // Start callback for coverage engine
  covrtScriptStart(&emlrtCoverageInstance, 2U);
}

void dynamic_initialize()
{
  static const volatile char_T *emlrtBreakCheckR2012bFlagVar{nullptr};
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, nullptr);
  emlrtEnterRtStackR2012b(&st);
  if (emlrtFirstTimeR2012b(emlrtRootTLSGlobal)) {
    dynamic_once();
  }
}

// End of code generation (dynamic_initialize.cpp)
