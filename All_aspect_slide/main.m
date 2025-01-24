global r;
global q;
global yimo;
global t;
global dt;
global vm;
global vt;
global at;
global am;
global z1;
global z2;
global m;
global n;
global theta_d;
global K1;
global seta;
global am0;
global k;
global am_max;

%测评
global Q;
global J;
global Ru;

Q_elem = [10^5, 10^5];
Q = diag(Q_elem);
Ru = 1;

J = 0;

xm = 0;
ym = 0;
xt = 5000 * sqrt(3);
yt = 5000;

vm = 500;
vt = 250;
delt_m = 0 / 180 * pi;
delt_t = 120 / 180 * pi;
at = 20;
am = 0; % 现在表示未知
am_max = 400;
k = 150;

t = 0;
theta_d = 90 / 180 * pi;


r = sqrt((xm - xt)^2+(ym - yt)^2);
q = atan2(yt-ym, xt-xm);

%求解初始的yimo
dq = (vt * sin(delt_t-q) - vm * sin(delt_m-q)) / r;
dr = vt * cos(delt_t-q) - vm * cos(delt_m-q);
qf = delt_t - atan2(sin(theta_d), cos(theta_d)-vt/vm);

x1 = q - qf;
x2 = dq - at / vt;
tgo = esttgo(dr);

yimo = -x2 - n * x1 / tgo;

%滑模面参数
n = 2;
m = 2;
K1 = 0.05;
%sgmf参数
seta = 0.8;


z1 = dq;
z2 = 0;

dt = 0.001;
N = 1000 * 60;


XM = zeros(1, N);
YM = zeros(1, N);
XT = zeros(1, N);
YT = zeros(1, N);
IMPACT = zeros(1, N);
R = zeros(1, N);
AM = zeros(1, N);
Z2 = zeros(1, N);
step = 1;


while r > 1 && step < N


    [dr, dq, ddelt_m, ddelt_t, dyimo] = Dynamic(delt_m, delt_t);

    R(step) = r;
    XM(step) = xm;
    YM(step) = ym;
    XT(step) = xt;
    YT(step) = yt;
    AM(step) = am;
    Z2(step) = z2  / cos(delt_t - q);
    IMPACT(step) = (delt_t - delt_m) / pi * 180;


    r = r + dr * dt;
    q = q + dq * dt;
    delt_m = delt_m + ddelt_m * dt;
    delt_t = delt_t + ddelt_t * dt;
    yimo = yimo + dyimo * dt;

    xm = xm + vm * cos(delt_m) * dt;
    ym = ym + vm * sin(delt_m) * dt;

    xt = xt + vt * cos(delt_t) * dt;
    yt = yt + vt * sin(delt_t) * dt;

    t = t + dt;
    step = step + 1;

end

disp(J);

figure(1);

plot(XM(1:step-1), YM(1:step-1), XT(1:step-1), YT(1:step-1), 'LineWidth', 2);

figure(2);
plot(AM(1:step-1), 'LineWidth', 2);


figure(3);
plot(IMPACT(1:step-1), 'LineWidth', 2);

figure(4)
plot(Z2(1:step-1),'LineWidth',2);


save("./Data/180.mat", "XM", "YM", "XT", "YT", "AM", "IMPACT", "step");
