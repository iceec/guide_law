global Vm;
global Vt;
global impact_angle;
global yimo;
global At;
global R;
global Ca;
global tf;
global t;
global G;
global Am_max;
global ea0;
global S_back;
global dt;
global beta;
global alpha;
global Hf;
global Q;
global J;
J = 0;
xm = 0;
ym = 0;
xt = 5000 * sqrt(3);
yt = 5000;

Vm = 500;
Vt = 250;
impact_angle = 90 * pi / 180;
yimo = 0.00001;
beta = 0.0011;
alpha = 0.0015;
At = 20;
R = 1;

Ca = [1, 0, 0; ...
    0, 1, 0];
tf = 20;
t = 0;
dt = 0.001;

Hf_elem = [10^9, 10^10];
Hf = diag(Hf_elem);

Q_elem = [10^5, 10^5];
Q = diag(Q_elem);


G = [1, 1];
Am_max = 400;
S_back = 0;

r = 10000;
q = 30 / 180 * pi;

theta_m = 30 / 180 * pi;
theta_t = 90 / 180 * pi;
z = 1;
w = 0;
%求解ea0
dq = (Vt * sin(theta_t-q) - Vm * sin(theta_m-q)) / r;
qd = theta_t - atan2(sin(impact_angle), cos(impact_angle)-Vt/Vm);
dqd = At / Vt;

ea0 = [q - qd; dq - dqd; z];

n = 1;
N = 30 * 1000;

AM = zeros(1, N);
XM = zeros(1, N);
YM = zeros(1, N);
XT = zeros(1, N);
YT = zeros(1, N);

interval = 0.5;
while r > 0 && n < N

    if (tf - t < interval)
        tf = tf + interval;
    end

    [dr, dq, dtheta_m, dtheta_t, dw, dz, am] = Dynamic(r, q, theta_m, theta_t, z, w);

    r = r + dr * dt;
    q = q + dq * dt;
    theta_m = theta_m + dtheta_m * dt;
    theta_t = theta_t + dtheta_t * dt;
    w = w + dw * dt;
    z = z + dz * dt;
    t = t + dt;


    xm = xm + Vm * cos(theta_m) * dt;
    ym = ym + Vm * sin(theta_m) * dt;

    xt = xt + Vt * cos(theta_t) * dt;
    yt = yt + Vt * sin(theta_t) * dt;

    disp(r);
    AM(n) = am;
    XM(n) = xm;
    YM(n) = ym;
    XT(n) = xt;
    YT(n) = yt;


    n = n + 1;
end

disp(J);
figure(1);
plot(AM(1:n-1), 'LineWidth', 2);

figure(2);

plot(XM(1:n-1), YM(1:n-1), XT(1:n-1), YT(1:n-1), 'LineWidth', 2);
