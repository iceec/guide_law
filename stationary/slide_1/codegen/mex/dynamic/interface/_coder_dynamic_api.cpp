//
// _coder_dynamic_api.cpp
//
// Code generation for function '_coder_dynamic_api'
//

// Include files
#include "_coder_dynamic_api.h"
#include "dynamic.h"
#include "dynamic_data.h"
#include "rt_nonfinite.h"

// Function Declarations
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *vm,
                               const char_T *identifier);

static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId);

static const mxArray *emlrt_marshallOut(const real_T u);

// Function Definitions
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims{0};
  real_T ret;
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 0U, (void *)&dims);
  ret = *static_cast<real_T *>(emlrtMxGetData(src));
  emlrtDestroyArray(&src);
  return ret;
}

static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *vm,
                               const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = const_cast<const char_T *>(identifier);
  thisId.fParent = nullptr;
  thisId.bParentIsCell = false;
  y = emlrt_marshallIn(sp, emlrtAlias(vm), &thisId);
  emlrtDestroyArray(&vm);
  return y;
}

static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = b_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u)
{
  const mxArray *m;
  const mxArray *y;
  y = nullptr;
  m = emlrtCreateDoubleScalar(u);
  emlrtAssign(&y, m);
  return y;
}

void dynamic_api(const mxArray *const prhs[7], int32_T nlhs,
                 const mxArray *plhs[5])
{
  emlrtStack st{
      nullptr, // site
      nullptr, // tls
      nullptr  // prev
  };
  real_T Am;
  real_T ddelt_m;
  real_T ddelt_t;
  real_T dq;
  real_T dr;
  real_T q;
  real_T r;
  real_T t;
  real_T vm;
  real_T vt;
  real_T yita_m;
  real_T yita_t;
  st.tls = emlrtRootTLSGlobal;
  // Marshall function inputs
  vm = emlrt_marshallIn(&st, emlrtAliasP(prhs[0]), "vm");
  vt = emlrt_marshallIn(&st, emlrtAliasP(prhs[1]), "vt");
  q = emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "q");
  r = emlrt_marshallIn(&st, emlrtAliasP(prhs[3]), "r");
  yita_m = emlrt_marshallIn(&st, emlrtAliasP(prhs[4]), "yita_m");
  yita_t = emlrt_marshallIn(&st, emlrtAliasP(prhs[5]), "yita_t");
  t = emlrt_marshallIn(&st, emlrtAliasP(prhs[6]), "t");
  // Invoke the target function
  dynamic(&st, vm, vt, q, r, yita_m, yita_t, t, &dr, &dq, &ddelt_m, &ddelt_t,
          &Am);
  // Marshall function outputs
  plhs[0] = emlrt_marshallOut(dr);
  if (nlhs > 1) {
    plhs[1] = emlrt_marshallOut(dq);
  }
  if (nlhs > 2) {
    plhs[2] = emlrt_marshallOut(ddelt_m);
  }
  if (nlhs > 3) {
    plhs[3] = emlrt_marshallOut(ddelt_t);
  }
  if (nlhs > 4) {
    plhs[4] = emlrt_marshallOut(Am);
  }
}

// End of code generation (_coder_dynamic_api.cpp)
