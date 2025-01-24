function [dr, dq, ddelt_m, ddelt_t, dyimo] = Dynamic(delt_m, delt_t)

global r;
global q;
global yimo;
global t;
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
global am0;
global k;
global am_max;
global Q;
global J;
global Ru;
global dt;


yita_m = delt_m - q;
yita_t = delt_t - q;

dr = vt * cos(yita_t) - vm * cos(yita_m);
dq = (vt * sin(yita_t) - vm * sin(yita_m)) / r;
ddelt_t = at / vt;

%得到tgo
tgo = esttgo(dr);

qf = delt_t - atan2(sin(theta_d), cos(theta_d)-vt/vm);
dqf = at / vt;

%得到滑模面和滑模变量
x1 = q - qf;
x2 = dq - dqf;
S = x2 + x1 * n / tgo + yimo;


[dz1,dz2] = eso(z1,z2,r,dq,delt_m,q,dq,am);

z1 = dz1 *dt + z1;
z2 = dz2 *dt + z2;

%求解am
p1 = ((m + n) * x2) / tgo;
p2 = (m + 1) * n * x1 / (tgo^2);
p3 = -2 * dr * dq / r;
p4 =z2; % cos(yita_t) / r * at;
p5 = K1 * sgmf(S);

am = r / cos(yita_m) * (p1 + p2 + p3 + p4 + p5);

if (t == 0)
    am0 = am;
end

vc = -dr;

if (vc <= k)
    am = am_max * sign(am0);
end


ddelt_m = am / vm;

dyimo = m / tgo * (x2 + n * x1 / tgo);

eya = [x1; x2];
u = am;


J = J + (eya' * Q * eya + u' * Ru * u) * dt * 1 / 2;

end