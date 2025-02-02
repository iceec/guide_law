function [dr, dq, dmth, dtth, dd,tgo] = DynamicOnlyT(vm, vt, r, q, mth, tth, d)

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
global k1;
global k2;
global beta;


global am;
global am_max;

global gama;

gama = 8;


myt = mth - q;
tyt = tth - q;

dr = vt * cos(tyt) - vm * cos(myt);
dq = (vt * sin(tyt) - vm * sin(myt)) / r;
dtth = at/vt;


vr = dr;
vq = r * dq;


%求解当前tgo 和误差 e F B
v_2 = vm^2 - vt^2;
tgo = r * (vr + 2 * vm * cos(myt) - vq * tan(myt)) / v_2;
%tgo = -r / dr;
e = t + tgo - td;

%B = r*sin(myt)/(dr^2);
%F = -1 + (vt*sin(tyt)*dq-vm*sin(myt)*dq)*r/(dr^2);


F = vq^2 / (v_2 * cos(myt)^2) - 1;
B = -r * vq / (vm * v_2 * cos(myt)^2);



am = 1 / B * ( - l2 * f(e, q1, q2) - F - 1 - d * tanh(e/tao) );  % d * gama * sgmf(s)  -l1 * f(e, p1, p2)

if abs(am) > am_max
    am = am_max *sign(am);
end
%dmth 和 de
dmth = am / vm;
dd =  - k2 * beta * f(d, q1, q2) + beta *e * tanh(e/tao); % -k1 * beta * f(d, p1, p2)
%%dd = gama*abs(s);

end