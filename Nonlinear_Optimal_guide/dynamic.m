
function [dr,dq,ddelt_m,ddelt_t,am,yita_r,err] = dynamic(vm,vt,r,q,delt_m,delt_t)

yita_m = delt_m - q;
yita_t = delt_t - q;
K = vt/vm;
theta_d = -45/180 * pi;

at = -3 * 9.81; %这个值 可以考虑以后从测量获取过来



N=3;
M=1;



dr = vt * cos(yita_t) - vm * cos(yita_m);
dq = (vt * sin(yita_t) - vm * sin(yita_m))/r;

vr = sqrt(vm^2 + vt^2 - 2 * vm * vt * cos(delt_m - delt_t));
delt_r = atan2(sin(delt_m) - K * sin(delt_t) , cos(delt_m) - K * cos(delt_t));
yita_r = delt_r - q;





delt_rf = N/(N-1) * q - 1 / (N-1) * delt_r;

vrf = sqrt(vm^2 + vt^2 - 2 * vm * vt * cos(theta_d));
vc = (vrf + vr * cos(yita_r))/2;
tgo = r / vc;

delt_d = delt_t + at * tgo/vt - atan2(sin(theta_d),cos(theta_d) - K);

err = delt_d - delt_rf;  

a1  = N * vr * dq + M * (N-1)* vr * dr * err / r;


am = (a1 + at * cos(delt_r - delt_t))/cos(delt_r-delt_m);








ddelt_m = am / vm;

ddelt_t = at / vt;





end