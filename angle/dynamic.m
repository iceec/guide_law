
function  [dr,dq,ddelt_m,ddelt_t,am,s]= dynamic(vm,vt,delt_m,delt_t,r,q)



yita_m_max = 45 * pi / 180; % 45

sigema = 0.1;

qd = -60 * pi / 180;

k1 = 2;



yita_m = q - delt_m;

yita_t = q - delt_t;


dr = -vm * cos(yita_m) + vt * cos(yita_t);

dq = (vm * sin(yita_m) - vt *sin(yita_t)) / r;









k2 = 0.2 + 0.5;

kc = vm * sin(yita_m_max) - vt;

x1 = q - qd;

x2 = r * dq;


m1 = ( -kc * abs(x1) / (abs(x1) + sigema)^2 + kc / (abs(x1) + sigema) -dr)*(x2/r);



da1 = ((-kc * abs(x1) / (abs(x1) + sigema)^2) - (kc / (abs(x1) + sigema))) * (x2/r);


w = (kc) / (abs(x1) + sigema);

a1 = -w *x1;
s = w * x1 + x2;

tmp_p = log((kc + s + a1) * (kc - a1) / ((kc -s -a1) * (kc +a1)));

p = kc * tmp_p /(2*s);



% if 可以观测出来z2 需要进行观测的
tmp_am = (-m1 - da1 + ((kc^2 - x2^2)/kc^2 * p * da1) - k1 *s - k2 * sign(s));


am = -1/(cos(yita_m)) * tmp_am;






ddelt_m = am / vm;

ddelt_t = 0;

%ddelt_t = 0;

end