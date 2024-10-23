clc;
close all;
clear;


%导弹的信息
xm = 0; ym = 15000; vm = 3 * 340;
delt_m = -40 / 180 * pi;

%目标的信息
xt = 10000; yt = 0 ; vt = 0;
delt_t = 0 / 180 * pi;


% 相对信息
q = atan2(yt - ym,xt - xm);
yita_m = q - delt_m;
yita_t = q  - delt_t;
r = sqrt((xt-xm)^2 + (yt - ym)^2);

% 步长以及仿真时间
n = 1;
h = 0.01;
sim_time = 40;
max_n = 100 * sim_time;

%存储的数组
XM = zeros(1,max_n);
YM = zeros(1,max_n);
R = zeros(1,max_n);
Q = zeros(1,max_n);


while r > 0 && n < max_n

yita_m = q - delt_m;
yita_t = q - delt_t;
% 存储之前的信息
R(n) = r; XM(n) = xm; YM(n) = ym; 
Q(n) = q * 180 / pi;

%获取到微分信息
[dr,dq,ddelt_m,ddelt_t] = dynamic(vm,vt,yita_m,yita_t,q,r);

r = r + h * dr;
q = q + h * dq;
delt_m = delt_m + h *ddelt_m;
delt_t = delt_t + h *ddelt_t;

xm = xm + vm * cos(delt_m) * h;
ym = ym + vm *sin(delt_m) *h;

n = n+1;

end



% 作图
figure(1);
plot(XM(1:n-1),YM(1:n-1),'LineWidth',2);
