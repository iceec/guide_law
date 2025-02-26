function [dr, dq, ddelt_m, ddelt_t, dyimo] = Dynamic(delt_m, delt_t)
global dt;

global r;
global q;
global vm;
global vt;
global at;
global am;
global am_max;
global theta_d;

global Q;
global J;
global Ru;
global z2;

global s;


yita_m = delt_m - q;
yita_t = delt_t - q;

dr = vt * cos(yita_t) - vm * cos(yita_m);
dq = (vt * sin(yita_t) - vm * sin(yita_m)) / r;
ddelt_t = at / vt;


qf = theta_d;
dqf = 0;

%得到滑模面和滑模变量
x1 = q - qf;
x2 = dq - dqf;

beta = 1;
alp = 5/3;
M = 3000;
s = x1 + beta * MyExp(x2, 5, 3);

am = (-2*dr*dq+r/(alp*beta)*MyExp(dq,1,3))/cos(yita_m)+M*sgmf(s)/sign(cos(yita_m));


if abs(am) > am_max
    am = am_max * sign(am);
end


ddelt_m = am / vm;


eya = [x1; x2];
u = am;

eso(r, dr, delt_m, delt_t, q, dq, am);

J = J + (eya' * Q * eya + u' * Ru * u) * dt * 1 / 2;

end