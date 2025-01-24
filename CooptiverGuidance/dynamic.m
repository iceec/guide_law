function [dmx, dmy, dmz, dvmx, dvmy, dvmz, dtx, dty, dtz, dvtx, dvty, dvtz] = dynamic(xt, yt, zt, xm, ym, zm, vtx, vty, vtz, vmx, vmy, vmz, i)
global q_theta_d;
global q_yita_d;
global m1;
global m2;
global w11;
global w12;
global w21;
global w22;


xr = xt - xm;
yr = yt - ym;
zr = zt - zm;


vx = vtx - vmx;
vy = vty - vmy;
vz = vtz - vmz;

r = sqrt(xr^2+yr^2+zr^2);
dr = 1 / r * (xr * vx + yr * vy + zr * vz);

[m_theta, m_yita] = SloveAngle(vmx, vmy, vmz);
[t_theta, t_yita] = SloveAngle(vtx, vty, vtz);
[q_theta, q_yita] = SloveAngle(xr, yr, zr);



dq_theta = ((xr^2 + zr^2) * vy - yr * (xr * vx + zr * vz)) / (r^2 * sqrt(xr^2+zr^2));
dq_yita = (zr * vx - xr * vz) / (xr^2 + zr^2);


a_r = r * dq_theta^2 + r * dq_yita^2 * cos(q_theta)^2 + dr^2 / r * U(i) + atr;


F1 = -2 * dr / r * dq_theta - dq_theta^2 * sin(q_theta) * cos(q_theta);
F2 = -2 * dr / r * dq_yita + 2 * q_theta * dq_yita * tan(q_theta);


x1_theta = q_theta - q_theta_d;
x2_theta = dq_theta;
s_theta = SloveS(x1_theta, x2_theta);

a_theta = r * (F1 + m1 * sig(s_theta, w11, w12) + m2 * sig(s_theta, w21, w22) + D(x1_theta, x2_theta)) + at_theta;


x1_yita = q_yita - q_yita_d;
x2_yita = dq_yita;
s_yita = SloveS(x1_yita, x2_yita);

a_yita = -r * cos(q_theta) * (F2 + m1 * sig(s_yita, w11, w12) + m2 * sig(s_yita, w21, w22) + D(x1_yita, x2_yita)) + at_yita;


[a_mx, a_my, a_mz] = SloveALineToBody(a_r, a_theta, a_yita, q_theta, q_yita, m_theta, m_yita);

[a_tx, a_ty, a_tz] = SloveALineToBody(at_r, at_theta, at_yita, q_theta, q_yita, t_theta, t_yita);

dmx = vmx;
dmy = vmy;
dmz = vmz;
dvmx = a_mx;
dvmy = a_my;
dvmz = a_mz;


dtx = vtx;
dty = vty;
dtz = vtz;
dvtx = a_tx;
dvty = a_ty;
dvtz = a_tz;


end