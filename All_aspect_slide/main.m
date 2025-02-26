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
global z3;


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

global s;

g= 9.81;
k1 =1.5;
k2 = 0.5;
y1 = 9;
y2 = 10;


Q_elem = [10^5, 10^5];
Q = diag(Q_elem);
Ru = 1;

J = 0;

xm = 0;
ym = 0;
xt = 5000 * sqrt(3);
yt = 5000;

vm = 600;
vt = 300;
delt_m = 60 / 180 * pi;
delt_t = 0 / 180 * pi;

t = 0;


am_max = 20*g;


theta_d = 45 / 180 * pi;


r = sqrt((xm - xt)^2+(ym - yt)^2);
q = atan2(yt-ym, xt-xm);

%求解初始的yimo
dq = (vt * sin(delt_t-q) - vm * sin(delt_m-q)) / r;
dr = vt * cos(delt_t-q) - vm * cos(delt_m-q);
qf = theta_d;

x1 = q - qf;
x2 = dq;
tgo = esttgo(dr);

S_init = x2 + x1 * n / tgo;
v = S_init^2*0.5;

T_end = 1/(3*0.1) + log((3*v^0.1+0.96)/0.96);

yimo = -x2 - n * x1 / tgo;

%滑模面参数
n = 2;
m = 2;
K1 = 0.05;
%sgmf参数
seta = 0.8;

z1 = dq;
z2 = 0;
z3 = 0;


dt = 0.001;
N = 1000 * 60;

Time = 0:0.001:60;
XM = zeros(1, N);
YM = zeros(1, N);
XT = zeros(1, N);
YT = zeros(1, N);
Q_angle = zeros(1, N);
R = zeros(1, N);
AM = zeros(1, N);
Z2 = zeros(1, N);
A2 = zeros(1, N);
D = zeros(1, N);
S = zeros(1, N);
DQ = zeros(1, N);
TGO = zeros(1,N);
step = 1;


while r > 3 && step < N


    at=5+30*cos(pi/4*t);

    [dr, dq, ddelt_m, ddelt_t, dyimo,tgo] = Dynamic(delt_m, delt_t);

    R(step) = r;
    XM(step) = xm;
    YM(step) = ym;
    XT(step) = xt;
    YT(step) = yt;
    AM(step) = am;
    Z2(step) = z2;
    A2(step) = at * cos(delt_t-q);
    DQ(step) = dq/pi*180;
    S(step) = s;
    Q_angle(step) = (q) / pi * 180;
    TGO(step) = tgo;


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
plot(Q_angle(1:step-1), 'LineWidth', 2);

figure(4);
plot(DQ(1:step-1), 'LineWidth', 2);

figure(5);
plot(Time(1:step-1), A2(1:step-1),Time(1:step-1), Z2(1:step-1), 'LineWidth', 2);

figure(6);
plot(S(1:step-1), 'LineWidth', 2);

figure(7);
plot(TGO(1:step-1), 'LineWidth', 2);

save("../Compare/G1.mat", "XM", "YM", "XT", "YT", "AM", "Q_angle","DQ" ,"step");
%save("./Data/60.mat", "XM", "YM", "XT", "YT", "AM", "Q_angle", "step","DQ","S","TGO","A2","Z2");
