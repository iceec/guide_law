function [ddr, ddq_theta, ddq_yita, a_r] = dynamic_with_relative(r, dr, q_theta, q_yita, dq_theta, dq_yita, i)

global desire_q_info;
global atx;
global aty;
global atz;
global m1;
global m2;
global w11;
global w12;
global w21;
global w22;
global zr_info; % 4 * 3;
global ztheta_info;
global zyita_info;
global dt;


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


global AR;
global ATHETA;
global AYITA;



[at_r, at_yita, at_theta] = ChangeIneToRos(atx, aty, atz, q_theta, q_yita);


q_theta_d = desire_q_info(i, 1);
q_yita_d = desire_q_info(i, 2);

F1 = -2 * dr / r * dq_theta - dq_theta^2 * sin(q_theta) * cos(q_theta);
F2 = -2 * dr / r * dq_yita + 2 * dq_theta * dq_yita * tan(q_theta);


at_r_z = zr_info(i, 2);
at_theta_z = ztheta_info(i, 2);
at_yita_z = zyita_info(i, 2);

x1 = r;
x2 = dr;
A = x1^2 * dq_theta^2 / (x2^2) + x1^2 * dq_yita^2 * cos(q_theta)^2 / (x2^2);
B = -x1 / (x2^2);
d = x1 / (x2^2) * at_r_z;

ar_tmp = impact_time_ar(i);
% r_1 = r * dq_theta^2;
% r_2 = r * dq_yita^2 * cos(q_theta)^2;
% r_3 = U(i);
% r_4 = dr^2 / r;
%
% r_5 = r_3 * r_4;
%
% a_r = r_1 + r_2 + r_5 + at_r_z;
a_r = 1 / B * (-A - d + ar_tmp);

x1_theta = q_theta - q_theta_d;
x2_theta = dq_theta;

s_theta_india = SloveSIndia(x1_theta, x2_theta, p11, p12, tc1);
a_theta_part_one = SInidaDotPart(x1_theta, x2_theta, p11, p12, tc1);
a_theta_part_two = APartTwo(s_theta_india, p21, p22, tc2, kp1);
a_theta = r * (F1 + a_theta_part_one + a_theta_part_two) + at_theta_z;
%s_theta = SloveS(x1_theta, x2_theta);
%a_theta = r * (F1 + m1 * sig(s_theta, w11, w12) + m2 * sig(s_theta, w21, w22) + D(x1_theta, x2_theta)) + at_theta_z;


x1_yita = q_yita - q_yita_d;
x2_yita = dq_yita;
s_yita_india = SloveSIndia(x1_yita, x2_yita, p31, p32, tc3);
a_yita_part_one = SInidaDotPart(x1_yita, x2_yita, p31, p32, tc3);
a_yita_part_two = APartTwo(s_yita_india, p41, p42, tc4, kp2);

a_yita = -r * cos(q_theta) * (F2 + a_yita_part_one + a_yita_part_two) + at_yita_z;
%s_yita = SloveS(x1_yita, x2_yita);
%a_yita = -r * cos(q_theta) * (F2 + m1 * sig(s_yita, w11, w12) + m2 * sig(s_yita, w21, w22) + D(x1_yita, x2_yita)) + at_yita_z;

a_theta = Ampify(a_theta);
a_yita = Ampify(a_yita);
a_r = Ampify(a_r);

ddr = r * dq_theta^2 + r * dq_yita^2 * cos(q_theta)^2 - a_r + at_r;
ddq_theta = (-2 * dr / r) * dq_theta - dq_yita^2 * sin(q_theta) * cos(q_theta) - a_theta / r + at_theta / r;
ddq_yita = (-2 * dr / r) * dq_yita + 2 * dq_theta * dq_yita * tan(q_theta) + a_yita / (r * cos(q_theta)) - at_yita / (r * cos(q_theta));


[dz_r1, dz_r2, dz_r3] = ObserveAtr(r, dr, dq_theta, dq_yita, q_theta, a_r, i);

zr_info(i, 1) = zr_info(i, 1) + dz_r1 * dt;
zr_info(i, 2) = zr_info(i, 2) + dz_r2 * dt;
zr_info(i, 3) = zr_info(i, 3) + dz_r3 * dt;

v1 = x2_theta * r;
v2 = -x2_yita * r * cos(q_theta);

[dz_theta1, dz_theta2, dz_theta3] = ObserveAttheta(r, dr, dq_theta, dq_yita, q_theta, a_theta, v1, i);
ztheta_info(i, 1) = ztheta_info(i, 1) + dz_theta1 * dt;
ztheta_info(i, 2) = ztheta_info(i, 2) + dz_theta2 * dt;
ztheta_info(i, 3) = ztheta_info(i, 3) + dz_theta3 * dt;

[dz_yita1, dz_yita2, dz_yita3] = ObserveAtyita(r, dr, dq_theta, dq_yita, q_theta, a_yita, v2, i);
zyita_info(i, 1) = zyita_info(i, 1) + dz_yita1 * dt;
zyita_info(i, 2) = zyita_info(i, 2) + dz_yita2 * dt;
zyita_info(i, 3) = zyita_info(i, 3) + dz_yita3 * dt;

AR(i, n) = a_r;
ATHETA(i, n) = a_theta;
AYITA(i, n) = a_yita;

R_ERROR(i, n) = at_r;

end
