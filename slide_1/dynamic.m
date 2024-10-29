
% 前置角的表达方式是原来的负数
function [dr,dq,ddelt_m,ddelt_t,Am]=dynamic(vm,vt,q,r,yita_m,yita_t,t)

% 固定参数设定
alpha = 9/7;
beta = 5;
M = 100;
delt_tf = 0 / 180 * pi;
delt_mf = 90 / 180 * pi;
theta_d = delt_tf - delt_mf;
td = 80;
K = 5;
a_max = 100;

dr = vt * cos(yita_t) - vm * cos(yita_m);
dq = (vt * sin(yita_t) - vm * sin(yita_m))/r;

% 求解角度滑模面
qf  = delt_tf - atan2(sin(theta_d),cos(theta_d) - vt/vm); 
dqf = 0;
S1a = (q - qf) + beta * (nthroot(dq - dqf,7))^9;


%求解a1
tmp_1 = (nthroot(dq,7))^5;
A1a = r / cos(yita_m) * (-2 * dr * dq / r + 1/(alpha * beta) * tmp_1);
A1b = M * sign(cos(yita_m)) * sgmf(S1a);
A1 = A1a + A1b;


% 求解时间滑膜面 参数t 表示已经过了的时间
tgo_d = td - t;
yita_mf = delt_mf - q;
dyita_mf = -dq;
tgo = r/vm * (1 + (yita_m^2 + yita_mf^2)/15 - yita_m * yita_mf/ 30);
S1t = tgo_d - tgo;


%求解a2
b = - r / vm^2 * (2/15 * yita_m - 1/30 * yita_mf);

c = r / vm * (2/15 * yita_mf * dyita_mf - 1/30 * yita_m * dyita_mf) + dr/vm * (1 + (yita_m^2 + yita_mf^2)/15 - yita_m*yita_mf/30);

A2a = W(b)*(c+1)/b;
A2b  = W(b)* -K / b * sgmf(S1t);
A2 = A2a + A2b;

Am = A1 + A2;


if abs(Am) > a_max
    Am = a_max * sign(Am);
end

ddelt_m = Am / vm;

ddelt_t = 0;




end