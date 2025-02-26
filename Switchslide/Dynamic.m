function [dr, dq, ddelt_m, ddelt_t,dd] = Dynamic(delt_m, delt_t,d)
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



global s;
global z2;

global l1;
global l2;


gama = 1.1;

yita_m = delt_m - q;
yita_t = delt_t - q;

dr = vt * cos(yita_t) - vm * cos(yita_m);
dq = (vt * sin(yita_t) - vm * sin(yita_m)) / r;
ddelt_t = at / vt;


qf = theta_d;
dqf = 0 ;

%得到滑模面和滑模变量
x1 = q - qf;
x2 = dq-dqf;
S = x2 + l1 * x1 + l2 * Beta(x1);
%S = x2 + (l1+l2)*x1;
s =S;



k1 = 3;
k2 = 0.5;
sy1 = 9;
sy2 = 10;

%求解am
p1 = -2 * dr * dq / r;
p2 = cos(yita_t)*at/r;
p3 = l1*x2+l2*Beta_dot(x1,x2);
p4 = k2*S;
p5 = k1 *sig(S,sy1,sy2);

am = (r / cos(yita_m)) * (p1 + p2 + p3 + p4 + p5);





if abs(am) > am_max
    am = am_max *sign(am);
end



ddelt_m = am / vm;
dd = gama*abs(S);


eya = [x1; x2];
u = am;

eso(r,dr,delt_m,delt_t,q,dq,am);

J = J + (eya' * Q * eya + u' * Ru * u) * dt * 1 / 2;

end