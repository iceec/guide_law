//
// File: main.cpp
//
// MATLAB Coder version            : 5.4
// C/C++ source code generated on  : 20-Jan-2025 23:37:19
//

/*************************************************************************/
/* This automatically generated example C++ main file shows how to call  */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/

// Include Files
#include "main.h"
#include "dynamic.h"
#include "dynamic_terminate.h"
#include "rt_nonfinite.h"

// Function Declarations
static double argInit_real_T();

static void main_dynamic();

// Function Definitions
//
// Arguments    : void
// Return Type  : double
//
static double argInit_real_T()
{
  return 0.0;
}

//
// Arguments    : void
// Return Type  : void
//
static void main_dynamic()
{
  double Am;
  double ddelt_m;
  double ddelt_t;
  double dq;
  double dr;
  double vm_tmp;
  // Initialize function 'dynamic' input arguments.
  vm_tmp = argInit_real_T();
  // Call the entry-point 'dynamic'.
  dynamic(vm_tmp, vm_tmp, vm_tmp, vm_tmp, vm_tmp, vm_tmp, vm_tmp, &dr, &dq,
          &ddelt_m, &ddelt_t, &Am);
}

//
// Arguments    : int argc
//                char **argv
// Return Type  : int
//
int main(int, char **)
{
  // The initialize function is being called automatically from your entry-point
  // function. So, a call to initialize is not included here. Invoke the
  // entry-point functions.
  // You can call entry-point functions multiple times.
  main_dynamic();
  // Terminate the application.
  // You do not need to do this more than one time.
  dynamic_terminate();
  return 0;
}

//
// File trailer for main.cpp
//
// [EOF]
//
