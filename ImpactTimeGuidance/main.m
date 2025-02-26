global w0;
global woo;
global t;
global ts;
global at;
global td;
global p1;
global p2;
global q1;
global q2;
global l1;
global l2;
global tao;
global k;
global k1;
global k2;
global beta;
global n1;
global n2;
global l;


global z1;
global z2;
global z3;
global dt;
global am;
global am_max;

global e;
global w;



m_init = 10;
xm = -6600;
ym =-4600;
xt = 0;
yt = 0;


vm = 500;
vt = 400;
mth = m_init / 180 * pi;
tth = 90 / 180 * pi;



td = 50;
t = 0;
dt = 0.001;
n = 1;
N = 1000 * 110;

Time = 0:0.001:110;

k = 2;
n1 = 9;
n2 = 2;
l = 1;
ts = 6;
woo = 0.5;
l1 = 0.5;
l2 = 0.5;
p1 = 5;
p2 = 5;
q1 = 11;
q2 = 15;
k1 = 0.2;
k2 = 0.1;
beta = 0.5;
tao = 0.03;
am_max = 200;


r = sqrt((xm - xt)^2+(yt - ym)^2);
q = atan2(yt-ym, xt-xm);
myt = mth - q;
tyt = tth - q;

dq = (vt * sin(tyt) - vm * sin(myt)) / r;
z1 = dq;
z2 = 0;
z3 = 0;

d = 0.5;
% 求解 w0 需要 e0 那么先求tgo0
w0 = SloveW0(vm, vt, r, q, mth, tth);


AM = zeros(1, N);
am = 0;
Z2 = zeros(1, N);
E = zeros(1, N);
W = zeros(1, N);
NW = zeros(1, N);
XM = zeros(1, N);
YM = zeros(1, N);
YT = zeros(1, N);
XT = zeros(1, N);
TGO = zeros(1, N);
DEM = zeros(1,N);
MYT = zeros(1,N);
while r > 1 && n <= N
   at = 20;

    [dr, dq, dmth, dtth, dd, tgo,dtrue] = Dynamic(vm, vt, r, q, mth, tth, d);

    AM(n) = am;
    W(n) = w;
    NW(n) = -w;
    E(n) = e;
    TGO(n) = tgo;
    DEM(n) = d-dtrue;
    r = r + dr * dt;
    q = q + dq * dt;
    mth = mth + dmth * dt;
    tth = tth + dtth * dt;
    d = d + dd * dt;
    t = t + dt;

    xm = xm + vm * cos(mth) * dt;
    ym = ym + vm * sin(mth) * dt;

    xt = xt + vt * cos(tth) * dt;
    yt = yt + vt * sin(tth) * dt;
    XM(n) = xm;
    YM(n) = ym;
    XT(n) = xt;
    YT(n) = yt;
    MYT(n) = mth-q;
    n = n + 1;
    disp(r);
end
figure(1);
plot(Time(1:n-1), E(1:n-1), Time(1:n-1), W(1:n-1), Time(1:n-1), NW(1:n-1), 'LineWidth', 2);
figure(2);
plot(AM(1:n-1), 'LineWidth', 2);
figure(3);
plot(XM(1:n-1), YM(1:n-1), XT(1:n-1), YT(1:n-1), 'LineWidth', 2);
% figure(4);
% plot(TGO(1:n-1), 'LineWidth', 2);
% figure(5);
% plot(DEM(1:n-1), 'LineWidth', 2);
% figure(6);
% plot(MYT(1:n-1), 'LineWidth', 2);

save("m3.mat", "AM", "XM", "YM", "YT", "XT","n","E","W","NW");
