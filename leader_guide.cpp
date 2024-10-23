#include <iostream>

#include <assert.h>
#include <fstream>
#include <iomanip>
#include <math.h>
#include <string>
#include <vector>

using std::cout;
using std::endl;
using std::vector;
double rad(double n) { return n * 3.14 / 180; }

double compute_q(double x, double y) {
  assert(!(x == 0 && y == 0));
  if (x == 0)
    return y > 0 ? rad(-90) : rad(90);

  if (y == 0)
    return x > 0 ? rad(180) : rad(0);

  double tmp_angle = atan(abs(y) / abs(x));
  if (x > 0 && y > 0) {
    return tmp_angle - rad(180);
  } else if (x > 0 && y < 0) {
    return rad(180) - tmp_angle;
  } else if (x < 0 && y > 0) {
    return -tmp_angle;
  } else if (x < 0 && y < 0) {
    return tmp_angle;
  }

  assert(false);
  return -1;
}
struct Leader_Guide {

  Leader_Guide() = default;

  Leader_Guide(int end_time) : end_time_(end_time) {

    int size = static_cast<int>(end_time / step);
    size_ = size;

    leader_info_.reserve(size);
    employee_info_.reserve(size);

    std::ifstream fin("./leader_init_info.txt");
    assert(fin);

    double x, y, delt;
    fin >> x >> y >> delt;
    delt = rad(delt);

    double r = sqrt(x * x + y * y);
    double q = compute_q(x, y);
    double yita = q - delt;

    leader_info_.push_back(vector<double>{x, y, r, q, delt, yita});
  }

  vector<double> runge_leader(const vector<double> &info) {

    double r = info[2];
    double delt = info[4];
    double yita = info[5];

    double dr = -v * cos(yita);
    double dq = (v * sin(yita)) / r;

    // a = N * v * dq
    double ddelt = N * dq;

    double dx = v * cos(delt);
    double dy = v * sin(delt);
    double dyita = dq - ddelt;

    return vector<double>{dx, dy, dr, dq, ddelt, dyita};
  }

  void leader_step() {
    auto d_info = runge_leader(leader_info_.back());

    vector<double> next_info = leader_info_.back();

    for (int i = 0; i < next_info.size(); ++i) {
      next_info[i] += d_info[i] * step;
    }
    leader_info_.push_back(std::move(next_info));
  }

  void simulate(double end_r) {
    double now_r = leader_info_.back().at(2);

    cout << now_r << endl;
    while (now_r > end_r && leader_info_.size() < size_) {
      leader_step();
      now_r = leader_info_.back().at(2);
      cout << now_r << endl;
    }
  }
  void show_leader_info(const std::string_view str) {
    show(leader_info_[2], "leader r");
  }

  void show(const vector<double> &nums, const std::string_view str) {

    cout << "**** " << str << " begin ****" << endl;
    for (int i = 0; i < nums.size(); ++i) {
      if (i > 0 && i % 10 == 0)
        cout << endl;
      cout << nums[i] << " ";
    }

    cout << "\n**** " << str << " end ****" << endl;
  }

  /**
   * x 0
   * y 1
   * r 2
   * q 3
   * delt 4
   * yita 5
   */
  vector<vector<double>> leader_info_;

  vector<vector<double>> employee_info_;
  static const double step;

  static const int N = 3;

  int end_time_;
  int size_{};

  int v{300};
};

const double Leader_Guide::step = 0.01;

int main() {
  cout << std::setiosflags(std::ios::fixed);
  cout.precision(6);
  Leader_Guide sim(40);
  sim.simulate(2);
  // sim.show_leader_info("r");
}
