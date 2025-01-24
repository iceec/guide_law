clc;
close all;
clear;

%导弹的信息
global vm vt am;
xm = 0; ym = 1000; vm = 250;
delt_m = 0 / 180 * pi;

%目标的信息
xt = 1000; yt = 0 ; vt = 0;
delt_t = 0 / 180 * pi;


% 相对信息
q = -45 / 180 * pi;  %% 结果应该是30°的

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

am = 0;

x = [r,q,delt_m,delt_t,xm,ym];

while r > 0 && n < max_n

yita_m = q - delt_m;
yita_t = q - delt_t;



%获取到微分信息
k1 = h * dynamic(x);
k2 = h * dynamic(x + 1/2 * k1);
k3 = h * dynamic(x + 1/2 * k2);
k4 = h * dynamic(x + k3);



x = x + 1/6 * (k1 + 2 * k2 + 2 * k3 + k4);
dx = dynamic(x);

r = x(1); q = x(2); delt_m = x(3); delt_t = x(4); xm = x(5); ym = x(6);






% 存储之前的信息
R(n) = r; XM(n) = xm; YM(n) = ym; 
Q(n) = q * 180 / pi;
DEL_M(n) = delt_m * 180 / pi;
AM(n) = am;





n = n+1;

% if(mod(n,1000) == 0)
%     disp(13.7 - n * h);
%     disp(tgo);
% end

end

disp(n * h);


figure(2);
plot(XM(1:n-1),YM(1:n-1),'LineWidth',2);

figure(3);
plot(R(1:n-1),'LineWidth',2);


figure(4);
plot(AM(1:n-1),'LineWidth',2);


%save("n90.mat","XM","YM","AM","n","sum");





%%
%注意 分数开根号很容易出现复数 所以先开下面的在去管理上面的
%要求yita_tf 和 yita_mf是固定的 不能变动的 表明物体要不能具有加速度

