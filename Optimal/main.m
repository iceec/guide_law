clc;
close all;
clear;


%导弹的信息
xm = 1000; ym = 1000; vm = 250;
delt_m = 0 / 180 * pi;

%目标的信息
xt = 0; yt = 0 ; vt = 0;
delt_t = 0 / 180 * pi;


% 相对信息
q = 45 /180 * pi;
yita_m = delt_m - q;
yita_t = delt_t - q;
r = sqrt((xt-xm)^2 + (yt - ym)^2);

% 步长以及仿真时间
n = 1;
h = 0.001;
sim_time = 40;
max_n = 1000 * sim_time;

%存储的数组
XM = zeros(1,max_n);
YM = zeros(1,max_n);
R = zeros(1,max_n);
Q = zeros(1,max_n);
S = zeros(1,max_n);
DEL_M = zeros(1,max_n);
AM = zeros(1,max_n);
time = 1:max_n;

sum = 0;

while r > 0 && n < max_n

yita_m = delt_m - q;
yita_t = delt_t - q;


%获取到微分信息
[dr,dq,ddelt_m,ddelt_t,am] = dynamic(vm,yita_m,q,r);

% 存储之前的信息
R(n) = r; XM(n) = xm; YM(n) = ym;
Q(n) = q * 180 / pi;
DEL_M(n) = delt_m * 180 / pi;
AM(n) = am;


r = r + h * dr;
q = q + h * dq;
delt_m = delt_m + h *ddelt_m;
delt_t = delt_t + h *ddelt_t;

xm = xm - vm * cos(delt_m)*h;
ym = ym - vm * sin(delt_m) *h;

n = n+1;
sum = sum + abs(am);

end

disp(q*180/pi)

% 作图
figure(1);
plot(XM(1:n-1),YM(1:n-1),'LineWidth',2);

disp(sum);

save("n90.mat","XM","YM","n","AM","sum");

