%bias proportional navigation impact angle control

%保证在追逐过程当中r_dot要一直小于0 
%保证在初始的yita_m要是在 [-90 , 90] 之间的  
% if 目标是动态的 不能保证一定可以满足攻击角度的约束  
clc; close all;clear;

% 导弹的信息
xm = -10000; ym = 500; vm = 250; delm = 30 / 180 * pi;
am_limit = 5 * 9.81; % 过载限制
delm_d = -60 /180 * pi; % 期望攻击角度
N=3; %应用于比例导引 
K=3; %应用于攻击角度 
dt = 0.001;

% 目标的信息
xt = 0; yt = 0; vt = 0; delt = 0;


%初始的状态信息
r = sqrt((xm - xt)^2 + (ym - yt)^2); % 初始的距离
q = atan2(yt-ym,xt-xm);  %初始的视线角
a = (N-1)*delm_d - N*q + delm;  % 初始的a
yita_m = q - delm;
yita_t = q - delt;
n = 1;
while r > 1
    dr = -vm * cos(yita_m) + vt * cos(yita_t);
    dq = (vm * sin(yita_m) - vt * sin(yita_t)) / r;
    da = -(K * vm * a * cos(yita_m)) / r;
    R(n) = r;
    XM(n) = xm;
    YM(n) = ym;
    AM(n) = a;
    YITA_M(n) = yita_m;
    DELM(n) = delm * 180 / pi;
    am = N * vm * dq - ((K * vm^2 * cos(yita_m))/r * a); % 求得过载
    % min(am,am_limit); % 限制最大的过载

    ddelm = am / vm;

    r = r + dr * dt;
    q = q + dq * dt;
    delm = delm + ddelm * dt;
    yita_m = q - delm;
    yita_t = q - delt;
    a = a + da * dt;

    xm = xm + vm * cos(delm) * dt;
    ym = ym + vm * sin(delm) * dt;
    n = n + 1;
end

% 
% figure(1);
% plot(XM,YM,'LineWidth',2);
% figure(2);
% plot(DELM,'LineWidth',2);
figure(3);
plot(AM,'LineWidth',2);
figure(4);
plot(YITA_M,'LineWidth',2);
r