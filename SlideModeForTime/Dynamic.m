function [dr, dq, dmth, dtth, am, tgo] = Dynamic()

global mth;
global tth;
global r;
global q;
global VT;
global VM;
global at;
global Td;
global t;
global K3;
global AM_MAX;


myt = mth - q;
tyt = tth - q;

%相对运动模型
dr = VT * cos(tyt) - VM * cos(myt);
dq = (VT * sin(tyt) - VM * sin(myt)) / r;
dtth = at / VT;

%求解am
vr = dr;
vq = r * dq;
n_2 = VM^2 - VT^2;
tgo = r * (vr + 2 * VM * cos(myt) - vq * tan(myt)) / (n_2);

e = tgo - (Td - t);

F = -1 + vq^2 / (n_2 * cos(myt)^2);

B = -r * vq / (VM * n_2 * cos(myt)^2);

D = -r * sin(myt+tyt) / (n_2 * cos(myt));

am = -(F + 1 + D * at + K3 * sign(e)) / B;

if (abs(am) > AM_MAX)
    am = AM_MAX * sign(am);
end

dmth = am / VM;


end