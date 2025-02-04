function [dr, dq, dmth, dtth, dd] = Dynamic(vm, vt, r, q, mth, tth, d)

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


global e;
global w;




myt = mth - q;
tyt = tth - q;

dr = vt * cos(tyt) - vm * cos(myt);
dq = (vt * sin(tyt) - vm * sin(myt)) / r;
dtth = at/vt;


vr = dr;
vq = r * dq;

%确定包络线的当前值
if (t < ts)
    w = (w0 - woo) * exp(SloveWT(t, ts)) + woo;
else
    w = woo;
end

%求解当前tgo 和误差 e F B
v_2 = vm^2 - vt^2;
tgo = r * (vr + 2 * vm * cos(myt) - vq * tan(myt)) / v_2;
%tgo = -r / dr;
e = t + tgo - td;

%B = r*sin(myt)/(dr^2);
%F = -1 + (vt*sin(tyt)*dq-vm*sin(myt)*dq)*r/(dr^2);


F = vq^2 / (v_2 * cos(myt)^2) - 1;
B = -r * vq / (vm * v_2 * cos(myt)^2);

% 求解得到yimo
tmp = (1 + e/w)/(1 - e/w);
yimo = 0.5 * log(tmp);

%求解dw 进而求得 fai alp
dw = SloveDw(t, ts);
fai = w / (w^2 - e^2);
if fai < 0
    disp('fai wrong');
end
alp = -dw / w;
% 求解得到 am
s = yimo * fai;
am = 1 / B * (-l1 * f(yimo, p1, p2) - l2 * f(yimo, q1, q2) - alp * e - F - 1 -d*sign(s));  % d * gama * sgmf(s)  d * tanh(yimo*fai/tao)
%dmth 和 de
dmth = am / vm;
dd = -k1 * beta * f(d, p1, p2) - k2 * beta * f(d, q1, q2) + beta *abs(s); % * yimo * fai * tanh(yimo*fai/tao)
%%dd = gama*abs(s);

end