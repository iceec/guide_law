clc;
close all;
clear;


%导弹的信息
xm = 0; ym = 0; vm = 500;
delt_m = 60 / 180 * pi;

%目标的信息
xt = 5000 * sqrt(3); yt = 5000 ; vt = 0;
delt_t = 0 / 180 * pi;


% 相对信息
q = atan2(yt - ym,xt - xm);  %% 结果应该是30°的

yita_m = q - delt_m;
yita_t = q  - delt_t;
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

yita_m = q - delt_m;
yita_t = q - delt_t;



%获取到微分信息
[dr,dq,ddelt_m,ddelt_t,s,am] = dynamic(vm,vt,yita_m,yita_t,q,r);


% 存储之前的信息
R(n) = r; XM(n) = xm; YM(n) = ym;  S(n) = s;
Q(n) = q * 180 / pi;
DEL_M(n) = delt_m * 180 / pi;
AM(n) = am;
sum = sum + abs(am);

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
plot(time(1:n-1),AM(1:n-1),'LineWidth',2);

figure(2);
plot(XM(1:n-1),YM(1:n-1),'LineWidth',2);








%%
%注意 分数开根号很容易出现复数 所以先开下面的在去管理上面的

