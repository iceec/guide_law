//
// File: dynamic.cpp
//
// MATLAB Coder version            : 5.4
// C/C++ source code generated on  : 20-Jan-2025 23:37:19
//

// Include Files
#include "dynamic.h"
#include "dynamic_data.h"
#include "dynamic_initialize.h"
#include "rand.h"
#include "rt_nonfinite.h"
#include "rt_defines.h"
#include <cmath>

// Function Declarations
static double rt_atan2d_snf(double u0, double u1);

static double rt_powd_snf(double u0, double u1);

// Function Definitions
//
// Arguments    : double u0
//                double u1
// Return Type  : double
//
static double rt_atan2d_snf(double u0, double u1)
{
  double y;
  if (std::isnan(u0) || std::isnan(u1)) {
    y = rtNaN;
  } else if (std::isinf(u0) && std::isinf(u1)) {
    int b_u0;
    int b_u1;
    if (u0 > 0.0) {
      b_u0 = 1;
    } else {
      b_u0 = -1;
    }
    if (u1 > 0.0) {
      b_u1 = 1;
    } else {
      b_u1 = -1;
    }
    y = std::atan2(static_cast<double>(b_u0), static_cast<double>(b_u1));
  } else if (u1 == 0.0) {
    if (u0 > 0.0) {
      y = RT_PI / 2.0;
    } else if (u0 < 0.0) {
      y = -(RT_PI / 2.0);
    } else {
      y = 0.0;
    }
  } else {
    y = std::atan2(u0, u1);
  }
  return y;
}

//
// Arguments    : double u0
//                double u1
// Return Type  : double
//
static double rt_powd_snf(double u0, double u1)
{
  double y;
  if (std::isnan(u0) || std::isnan(u1)) {
    y = rtNaN;
  } else {
    double d;
    double d1;
    d = std::abs(u0);
    d1 = std::abs(u1);
    if (std::isinf(u1)) {
      if (d == 1.0) {
        y = 1.0;
      } else if (d > 1.0) {
        if (u1 > 0.0) {
          y = rtInf;
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = rtInf;
      }
    } else if (d1 == 0.0) {
      y = 1.0;
    } else if (d1 == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = std::sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > std::floor(u1))) {
      y = rtNaN;
    } else {
      y = std::pow(u0, u1);
    }
  }
  return y;
}

//
// 固定参数设定
//
// Arguments    : double vm
//                double vt
//                double q
//                double r
//                double yita_m
//                double yita_t
//                double t
//                double *dr
//                double *dq
//                double *ddelt_m
//                double *ddelt_t
//                double *Am
// Return Type  : void
//
void dynamic(double vm, double vt, double q, double r, double yita_m,
             double yita_t, double t, double *dr, double *dq, double *ddelt_m,
             double *ddelt_t, double *Am)
{
  double a_tmp;
  double b;
  double b_s_tmp;
  double d;
  double dr_tmp;
  double s;
  double s_tmp;
  double x;
  double y2n;
  if (!isInitialized_dynamic) {
    dynamic_initialize();
  }
  //  前置角的表达方式是原来的负数
  dr_tmp = std::cos(yita_m);
  *dr = vt * std::cos(yita_t) - vm * dr_tmp;
  *dq = (vt * std::sin(yita_t) - vm * std::sin(yita_m)) / r;
  //  求解角度滑模面
  if (*dq < 0.0) {
    a_tmp = -rt_powd_snf(-*dq, 0.14285714285714285);
  } else {
    a_tmp = rt_powd_snf(*dq, 0.14285714285714285);
  }
  if ((!std::isinf(a_tmp)) && (!std::isnan(a_tmp)) && (*dq != 0.0)) {
    y2n = rt_powd_snf(a_tmp, 7.0);
    d = y2n - *dq;
    if (d != 0.0) {
      a_tmp -= d / (7.0 * (y2n / a_tmp));
    }
  }
  d = (q - (0.0 - rt_atan2d_snf(0.86602540378443871,
                                -0.49999999999999978 - vt / vm))) +
      5.0 * rt_powd_snf(a_tmp, 9.0);
  // 求解a1
  x = dr_tmp;
  if (std::abs(d) < 0.5) {
    d = 2.0 * (1.0 / (std::exp(-20.0 * d) + 1.0) - 0.5);
  } else if (!std::isnan(d)) {
    if (d < 0.0) {
      d = -1.0;
    } else {
      d = (d > 0.0);
    }
  }
  if (!std::isnan(dr_tmp)) {
    if (dr_tmp < 0.0) {
      x = -1.0;
    } else {
      x = (dr_tmp > 0.0);
    }
  }
  //  求解时间滑膜面 参数t 表示已经过了的时间
  s_tmp = r / vm;
  b_s_tmp = ((yita_m * yita_m +
              (-2.0943951023931953 - q) * (-2.0943951023931953 - q)) /
                 15.0 +
             1.0) -
            yita_m * (-2.0943951023931953 - q) / 30.0;
  s = (80.0 - t) - s_tmp * b_s_tmp;
  // 求解a2
  b = -r / (vm * vm) *
      (0.13333333333333333 * yita_m -
       0.033333333333333333 * (-2.0943951023931953 - q));
  y2n = std::abs(b);
  if (y2n < 0.001) {
    y2n = 0.0;
  } else if ((y2n >= 0.001) && (y2n <= 0.01)) {
    y2n = (y2n - 0.001) / 0.0090000000000000011;
  } else {
    y2n = 1.0;
  }
  if (std::abs(s) < 0.5) {
    s = 2.0 * (1.0 / (std::exp(-20.0 * s) + 1.0) - 0.5);
  } else if (!std::isnan(s)) {
    if (s < 0.0) {
      s = -1.0;
    } else {
      s = (s > 0.0);
    }
  }
  *Am =
      ((r / dr_tmp *
            (-2.0 * *dr * *dq / r +
             0.15555555555555556 * rt_powd_snf(a_tmp, 5.0)) +
        100.0 * x * d) +
       (y2n *
            ((s_tmp * (0.13333333333333333 * (-2.0943951023931953 - q) * -*dq -
                       0.033333333333333333 * yita_m * -*dq) +
              *dr / vm * b_s_tmp) +
             1.0) /
            b +
        y2n * -5.0 / b * s)) +
      coder::b_rand();
  if (std::abs(*Am) > 100.0) {
    if (!std::isnan(*Am)) {
      if (*Am < 0.0) {
        *Am = -1.0;
      } else {
        *Am = (*Am > 0.0);
      }
    }
    *Am *= 100.0;
  }
  *ddelt_m = *Am / vm;
  *ddelt_t = 0.0;
}

//
// File trailer for dynamic.cpp
//
// [EOF]
//
