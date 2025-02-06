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


global z1;
global z2;
global z3;
global dt;
global am;
global am_max;

global e;
global w;


xm = 0;
ym = 10000;
xt = 8000;
yt = 10000;


vm = 500;
vt = 400;
mth = 20 / 180 * pi;
tth = 120 / 180 * pi;

at = 3 * 9.81;

td = 70;
t = 0;
dt = 0.001;
n = 1;
N = 1000 * 100;

Time = 0 : 0.001 :100;

k = 6;
n1 = 3;
n2 = 2;
ts = 6;
woo = 1;
l1 = 3;
l2 = 2;
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
E = zeros(1,N);
W = zeros(1,N);

while r > 1 && n <= N
    [dr, dq, dmth, dtth, dd] = Dynamic(vm, vt, r, q, mth, tth, d);

    AM(n) = am;
    W(n) = w;
    E(n) = e;

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
    n = n + 1;
    disp(r);
end
figure(1);
plot(Time(1:n-1),E(1:n-1),Time(1:n-1),W(1:n-1),'LineWidth',2);
figure(2);
plot(AM(1:n-1),'LineWidth',2);

