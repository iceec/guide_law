r1 = 12000;
dr1 = -320;
q_theta_1 = -60 / 180 * pi;
q_yita_1 = 10 / 180 * pi;
dq_theta_1 = deg2rad(0.63);
dq_yita_1 = deg2rad(1.404);

r2 = 12000;
dr2 = -400;
q_theta_2 = -45 / 180 * pi;
q_yita_2 = 30 / 180 * pi;
dq_theta_2 = deg2rad(0.246);
dq_yita_2 = deg2rad(0.67);


r3 = 13000;
dr3 = -380;
q_theta_3 = -30 / 180 * pi;
q_yita_3 = 40 / 180 * pi;
dq_theta_3 = deg2rad(-0.355);
dq_yita_3 = deg2rad(-0.521);

r4 = 9000;
dr4 = -350;
q_theta_4 = -20 / 180 * pi;
q_yita_4 = 60 / 180 * pi;
dq_theta_4 = deg2rad(-0.779);
dq_yita_4 = deg2rad(-0.882);


global desire_q_info;
global zr_info;
global ztheta_info;
global zyita_info;

global m1;
global m2;
global w11;
global w12;
global w21;
global w22;

global Tgo;

global missle_graph

global p1;
global p2;
global q1;
global q2;
global ar;
global betar;

global beta;
global a1;
global u1;
global t;
global dt;


global xt;
global yt;
global zt;

global vtx;
global vty;
global vtz;


global atx;
global aty;
global atz;

global R_ERROR;
global n;


global p11;
global p12;
global p21;
global p22;
global tc1;
global tc2;
global kp1;

global p31;
global p32;
global p41;
global p42;
global tc3;
global tc4;
global kp2;

global n;
global AR;
global ATHETA;
global AYITA;


xt = 0;
yt = 0;
zt = 0;
vtx = 0;
vty = 0;
vtz = 0;


t = 0;
dt = 0.001;
N = 60 * 1000;
n = 1;

TIME = 0:0.001:60;

desire_q_info = [deg2rad(-30), deg2rad(30); ...
    deg2rad(-10), deg2rad(50); ...
    deg2rad(-60), deg2rad(10); ...
    deg2rad(-50), deg2rad(40)];

zr_info = zeros(4, 3);
ztheta_info = zeros(4, 3);
zyita_info = zeros(4, 3);


m1 = 1.6;
m2 = 3;
w11 = 1;
w12 = 5;
w21 = 5;
w22 = 1;

Tgo = [ST(r1, dr1), ST(r2, dr2), ST(r3, dr3), ST(r4, dr4)];
missle_graph = [1, 1, 0, 1; ...
    1, 1, 1, 0; ...
    0, 1, 1, 1; ...
    1, 0, 1, 1];
ar = 0.3;
betar = 0.3;
p1 = 3;
p2 = 5;
q1 = 7;
q2 = 5;

beta = 0.005;
a1 = 1.6;
u1 = 0.1;

InitZInfo(r1, dr1, dq_theta_1, dq_yita_1, q_theta_1, 1);

InitZInfo(r2, dr2, dq_theta_2, dq_yita_2, q_theta_2, 2);

InitZInfo(r3, dr3, dq_theta_3, dq_yita_3, q_theta_3, 3);

InitZInfo(r4, dr4, dq_theta_4, dq_yita_4, q_theta_4, 4);


TPOS = zeros(3, N);
M1POS = zeros(3, N);
M2POS = zeros(3, N);
M3POS = zeros(3, N);
M4POS = zeros(3, N);
AR = zeros(4, N);
ATHETA = zeros(4, N);
AYITA = zeros(4, N);
QTHETA = zeros(4, N);
R_ERROR = zeros(4, N);

p11 = 3;
p12 = 20;
p21 = 3;
p22 = 20;
tc1 = 20;
tc2 = 20;
kp1 = 0;

p31 = 3;
p32 = 20;
p41 = 3;
p42 = 20;
tc3 = 20;
tc4 = 20;
kp2 = 0;

while r1 > 1 && r2 > 1 && r3 > 1 && r4 > 1 && n < N

    %
    %         atx = 30;
    %         aty = 10;
    %         atz = 20;
    atx = 30 * cos(pi/4*t);
    aty = 15 * sin(pi/4*t);
    atz = 10 + 5 * cos(pi/4*t);
    %     atx = 0;
    %     aty = 0;
    %     atz = 0;

    [ddr1, ddq_theta_1, ddq_yita_1] = dynamic_with_relative(r1, dr1, q_theta_1, q_yita_1, dq_theta_1, dq_yita_1, 1);

    [ddr2, ddq_theta_2, ddq_yita_2] = dynamic_with_relative(r2, dr2, q_theta_2, q_yita_2, dq_theta_2, dq_yita_2, 2);

    [ddr3, ddq_theta_3, ddq_yita_3] = dynamic_with_relative(r3, dr3, q_theta_3, q_yita_3, dq_theta_3, dq_yita_3, 3);

    [ddr4, ddq_theta_4, ddq_yita_4] = dynamic_with_relative(r4, dr4, q_theta_4, q_yita_4, dq_theta_4, dq_yita_4, 4);

    dr1 = ddr1 * dt + dr1;
    dq_theta_1 = ddq_theta_1 * dt + dq_theta_1;
    dq_yita_1 = ddq_yita_1 * dt + dq_yita_1;

    r1 = dr1 * dt + r1;
    q_theta_1 = dq_theta_1 * dt + q_theta_1;
    q_yita_1 = dq_yita_1 * dt + q_yita_1;


    dr2 = ddr2 * dt + dr2;
    dq_theta_2 = ddq_theta_2 * dt + dq_theta_2;
    dq_yita_2 = ddq_yita_2 * dt + dq_yita_2;

    r2 = dr2 * dt + r2;
    q_theta_2 = dq_theta_2 * dt + q_theta_2;
    q_yita_2 = dq_yita_2 * dt + q_yita_2;


    dr3 = ddr3 * dt + dr3;
    dq_theta_3 = ddq_theta_3 * dt + dq_theta_3;
    dq_yita_3 = ddq_yita_3 * dt + dq_yita_3;

    r3 = dr3 * dt + r3;
    q_theta_3 = dq_theta_3 * dt + q_theta_3;
    q_yita_3 = dq_yita_3 * dt + q_yita_3;


    dr4 = ddr4 * dt + dr4;
    dq_theta_4 = ddq_theta_4 * dt + dq_theta_4;
    dq_yita_4 = ddq_yita_4 * dt + dq_yita_4;

    r4 = dr4 * dt + r4;
    q_theta_4 = dq_theta_4 * dt + q_theta_4;
    q_yita_4 = dq_yita_4 * dt + q_yita_4;

    vtx = vtx + atx * dt;
    vty = vty + aty * dt;
    vtz = vtz + atz * dt;

    xt = xt + vtx * dt;
    yt = yt + vty * dt;
    zt = zt + vtz * dt;

    TPOS(1, n) = xt;
    TPOS(2, n) = yt;
    TPOS(3, n) = zt;


    [xm1, ym1, zm1] = SloveMissPos(r1, q_theta_1, q_yita_1);
    [xm2, ym2, zm2] = SloveMissPos(r2, q_theta_2, q_yita_2);
    [xm3, ym3, zm3] = SloveMissPos(r3, q_theta_3, q_yita_3);
    [xm4, ym4, zm4] = SloveMissPos(r4, q_theta_4, q_yita_4);


    M1POS(1, n) = xm1;
    M1POS(2, n) = ym1;
    M1POS(3, n) = zm1;

    M2POS(1, n) = xm2;
    M2POS(2, n) = ym2;
    M2POS(3, n) = zm2;

    M3POS(1, n) = xm3;
    M3POS(2, n) = ym3;
    M3POS(3, n) = zm3;

    M4POS(1, n) = xm4;
    M4POS(2, n) = ym4;
    M4POS(3, n) = zm4;


    QTHETA(1, n) = q_theta_1 / pi * 180;


    t = t + dt;
    n = n + 1;

    Tgo = [ST(r1, dr1), ST(r2, dr2), ST(r3, dr3), ST(r4, dr4)];


end
figure(1);
plot(TIME(1:n-1), ATHETA(1, 1:n-1), TIME(1:n-1), ATHETA(2, 1:n-1), TIME(1:n-1), ATHETA(3, 1:n-1), TIME(1:n-1), ATHETA(4, 1:n-1), 'LineWidth', 2);

figure(2);
plot(TIME(1:n-1), AYITA(1, 1:n-1), TIME(1:n-1), AYITA(2, 1:n-1), TIME(1:n-1), AYITA(3, 1:n-1), TIME(1:n-1), AYITA(4, 1:n-1), 'LineWidth', 2);

figure(3);
plot(TIME(1:n-1), AR(1, 1:n-1), TIME(1:n-1), AR(2, 1:n-1), TIME(1:n-1), AR(3, 1:n-1), TIME(1:n-1), AR(4, 1:n-1), 'LineWidth', 2);


% figure(3);
% plot3(TPOS(1, 1:n-1), TPOS(2, 1:n-1), TPOS(3, 1:n-1), 'LineWidth', 2);
% hold on;
% plot3(M1POS(1, 1:n-1), M1POS(2, 1:n-1), M1POS(3, 1:n-1),'LineWidth', 2);
% hold on;
% plot3(M2POS(1, 1:n-1), M2POS(2, 1:n-1), M2POS(3, 1:n-1),'LineWidth', 2);
% hold on;
% plot3(M3POS(1, 1:n-1), M3POS(2, 1:n-1), M3POS(3, 1:n-1),'LineWidth', 2);
% hold on;
% plot3(M4POS(1, 1:n-1), M4POS(2, 1:n-1), M4POS(3, 1:n-1),'LineWidth', 2);


% figure(4);
% plot(ATHETA(1, 1:n-1), 'LineWidth', 2);
%
% figure(5);
% plot(R_ERROR(1, 1:n-1), 'LineWidth', 2);


disp(rad2deg(q_theta_1));
disp(rad2deg(q_theta_2));
disp(rad2deg(q_theta_3));
disp(rad2deg(q_theta_4));


disp(rad2deg(q_yita_1));
disp(rad2deg(q_yita_2));
disp(rad2deg(q_yita_3));
disp(rad2deg(q_yita_4));
