function y = SloveW0(vm,vt,r, q, mth, tth)

global td;
global t;
global k;
myt = mth - q;
tyt = tth - q;

dr = vt * cos(tyt) - vm * cos(myt);
dq = (vt * sin(tyt) - vm * sin(myt)) / r;
vr = dr;
vq = r * dq;

v_2 = vm^2 - vt^2;
tgo = r * (vr + 2 * vm * cos(myt) - vq * tan(myt)) / v_2;

e = t + tgo - td;

y = k * abs(e);

end