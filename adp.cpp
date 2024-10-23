#include <iostream>

#include <vector>

#include <functional>

#include <math.h>

using std::vector;

constexpr double h = 0.01;

struct ADP {

  ADP(int time)
      : time_(time), size_(static_cast<long>(time / h)), mis_info(size_),
        tar_info(size_) {}

  void regist_func(vector<double> &w,
                   vector<std::function<double(double)>> &func) {
    W = w;
    active_func = func;
  }

  void step() {

    double xm, ym, delta_m, yita_m, xt, yt, delta_t, yita_t;

    auto &info = mis_info.back();

    xm = info[0];
    ym = info[1];
    delta_m = info[2];
    yita_m = info[3];

    auto &t_info = tar_info.back();

    xt = info[0];
    yt = info[1];
    delta_t = info[2];
    yita_t = info[3];

    double cx = (xm - xt);
    double cy = (ym - yt);
  }

  int time_;

  long size_;
  // xm ym delt_m yita_m am
  vector<vector<double>> mis_info;

  vector<vector<double>> tar_info;

  // w权值
  vector<double> W{};
  // 激活函数
  vector<std::function<double(double)>> active_func{};
};

int main() {}