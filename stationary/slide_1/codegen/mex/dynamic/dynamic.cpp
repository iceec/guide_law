//
// dynamic.cpp
//
// Code generation for function 'dynamic'
//

// Include files
#include "dynamic.h"
#include "W.h"
#include "dynamic_data.h"
#include "nthroot.h"
#include "rand.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"

// Function Definitions
void dynamic(const emlrtStack *, real_T vm, real_T vt, real_T q, real_T r,
             real_T yita_m, real_T yita_t, real_T t, real_T *dr, real_T *dq,
             real_T *ddelt_m, real_T *ddelt_t, real_T *Am)
{
  real_T A2a;
  real_T A2b;
  real_T a;
  real_T b;
  real_T dr_tmp;
  real_T s;
  real_T y;
  covrtLogFcn(&emlrtCoverageInstance, 0, 0);
  covrtLogBasicBlock(&emlrtCoverageInstance, 0, 0);
  //  前置角的表达方式是原来的负数
  //  固定参数设定
  dr_tmp = muDoubleScalarCos(yita_m);
  *dr = vt * muDoubleScalarCos(yita_t) - vm * dr_tmp;
  *dq = (vt * muDoubleScalarSin(yita_t) - vm * muDoubleScalarSin(yita_m)) / r;
  //  求解角度滑模面
  a = coder::nthroot(*dq);
  s = (q - (0.0 - muDoubleScalarAtan2(0.86602540378443871,
                                      -0.49999999999999978 - vt / vm))) +
      5.0 * muDoubleScalarPower(a, 9.0);
  // 求解a1
  a = coder::nthroot(*dq);
  covrtLogFcn(&emlrtCoverageInstance, 1, 0);
  covrtLogBasicBlock(&emlrtCoverageInstance, 1, 0);
  if (covrtLogIf(&emlrtCoverageInstance, 1, 0, 0, muDoubleScalarAbs(s) < 0.5)) {
    covrtLogBasicBlock(&emlrtCoverageInstance, 1, 1);
    y = 2.0 * (1.0 / (muDoubleScalarExp(-20.0 * s) + 1.0) - 0.5);
  } else {
    covrtLogBasicBlock(&emlrtCoverageInstance, 1, 2);
    y = muDoubleScalarSign(s);
  }
  //  求解时间滑膜面 参数t 表示已经过了的时间
  A2b = r / vm;
  A2a = ((yita_m * yita_m +
          (-2.0943951023931953 - q) * (-2.0943951023931953 - q)) /
             15.0 +
         1.0) -
        yita_m * (-2.0943951023931953 - q) / 30.0;
  s = (80.0 - t) - A2b * A2a;
  // 求解a2
  b = -r / (vm * vm) *
      (0.13333333333333333 * yita_m -
       0.033333333333333333 * (-2.0943951023931953 - q));
  A2a = W(b) *
        ((A2b * (0.13333333333333333 * (-2.0943951023931953 - q) * -*dq -
                 0.033333333333333333 * yita_m * -*dq) +
          *dr / vm * A2a) +
         1.0) /
        b;
  covrtLogFcn(&emlrtCoverageInstance, 1, 0);
  covrtLogBasicBlock(&emlrtCoverageInstance, 1, 0);
  if (covrtLogIf(&emlrtCoverageInstance, 1, 0, 0, muDoubleScalarAbs(s) < 0.5)) {
    covrtLogBasicBlock(&emlrtCoverageInstance, 1, 1);
    A2b = 2.0 * (1.0 / (muDoubleScalarExp(-20.0 * s) + 1.0) - 0.5);
  } else {
    covrtLogBasicBlock(&emlrtCoverageInstance, 1, 2);
    A2b = muDoubleScalarSign(s);
  }
  A2b *= W(b) * -5.0 / b;
  *Am = ((r / dr_tmp *
              (-2.0 * *dr * *dq / r +
               0.15555555555555556 * muDoubleScalarPower(a, 5.0)) +
          100.0 * muDoubleScalarSign(dr_tmp) * y) +
         (A2a + A2b)) +
        coder::b_rand();
  if (covrtLogIf(&emlrtCoverageInstance, 0, 0, 0,
                 muDoubleScalarAbs(*Am) > 100.0)) {
    covrtLogBasicBlock(&emlrtCoverageInstance, 0, 1);
    *Am = 100.0 * muDoubleScalarSign(*Am);
  }
  covrtLogBasicBlock(&emlrtCoverageInstance, 0, 2);
  *ddelt_m = *Am / vm;
  *ddelt_t = 0.0;
}

// End of code generation (dynamic.cpp)
