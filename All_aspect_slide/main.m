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

global am_max;

%测评
global Q;
global J;
global Ru;


global k1;
global k2;
global y1;
global y2;
global d;
global gama;

global s;

global P1;
global P2;
global beta;

P1 = 9;
P2 = 7;
beta = 5;


k1 = 6;
k2 = 2;
y1 = 9;
y2 = 10;
gama = 2;
d = 0.02;


Q_elem = [10^5, 10^5];
Q = diag(Q_elem);
Ru = 1;

J = 0;

xm = 0;
ym = 0;
xt = 2500 * sqrt(3);
yt = 2500;

vm = 500;
vt = 250;
delt_m = 60 / 180 * pi;
delt_t = 0 / 180 * pi;

t = 0;
if t < 10
    at = -30;
else
    at = 30;
end

am_max = 200;


theta_d = 30 / 180 * pi;


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

Time = 0:0.001:60;
XM = zeros(1, N);
YM = zeros(1, N);
XT = zeros(1, N);
YT = zeros(1, N);
IMPACT = zeros(1, N);
R = zeros(1, N);
AM = zeros(1, N);
Z2 = zeros(1, N);
A2 = zeros(1, N);
D = zeros(1, N);
S = zeros(1, N);
step = 1;


while r > 1 && step < N


    if t < 10
        at = -30;
    else
        at = 30;
    end

    [dr, dq, ddelt_m, ddelt_t, dyimo] = Dynamic(delt_m, delt_t);

    R(step) = r;
    XM(step) = xm;
    YM(step) = ym;
    XT(step) = xt;
    YT(step) = yt;
    AM(step) = am;
    Z2(step) = z2;
    A2(step) = cos(delt_t-q) * at;
    D(step) = d;
    S(step) = s;
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

figure(4);
plot(D(1:step-1), 'LineWidth', 2);

figure(5);
plot(Z2(1:step-1), 'LineWidth', 2);

figure(6);
plot(S(1:step-1), 'LineWidth', 2);


save("./Data/180.mat", "XM", "YM", "XT", "YT", "AM", "IMPACT", "step");
