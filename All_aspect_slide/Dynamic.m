function [dr, dq, ddelt_m, ddelt_t, dyimo] = Dynamic(delt_m, delt_t)
global dt;

global r;
global q;
global yimo;
global vm;
global vt;
global at;
global am;
global am_max;
global m;
global n;
global theta_d;

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


% global P1;
% global P2;
% global beta;





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

%S = x1 + beta * MyExp(x2,P1,P2);
s =S;



z2 = eso(r,dr,delt_m,delt_t,q,dq,am);

%求解am
p1 = ((m + n) * x2) / tgo;
p2 = (m + 1) * n * x1 / (tgo^2);

p3 = -2 * dr * dq / r;
p4 = k2*S;
p5 = k1 *sig(S,y1,y2);
p6 = 0.2 * sgmf(S);  %d * gama * sgmf(S);
p7 = z2/r;

% a1 = r / cos(yita_m) *(p3 + p7);
% 
% T = r / cos(yita_m) * (beta * P1 / P2) * MyExp(x2,P2 - P1,P2);
% 
% a2 = T * (x2 + p4 + p5 + p6);
% 
% am = a1 + a2;


am = (r / cos(yita_m)) * (p1 + p2 + p3 + p4 + p5 + p6 + p7);

dd = gama * abs(S);

d = d + dd *dt;

if abs(am) > am_max
    am = am_max *sign(am);
end



ddelt_m = am / vm;

dyimo = m / tgo * (x2 + n * x1 / tgo);

eya = [x1; x2];
u = am;


J = J + (eya' * Q * eya + u' * Ru * u) * dt * 1 / 2;

end