
% 前置角的表达方式是原来的负数
function [dr,dq,ddelt_m,ddelt_t,Am]=dynamic_2(vm,vt,q,r,yita_m,yita_t)


% 固定参数设定

delt_mf = -90 / 180 * pi;
a_max = 100;

delt_m = q + yita_m;

yita_mf = delt_mf -q;

dr = vt * cos(yita_t) - vm * cos(yita_m);
dq = (vt * sin(yita_t) - vm * sin(yita_m))/r;



tgo = r/vm * (1 + (yita_m^2 + yita_mf^2)/15 - yita_m * yita_mf/ 30);


Am = vm/tgo *(-6*q + 4 * delt_m + 2* delt_mf);




if abs(Am) > a_max
    Am = a_max * sign(Am);
end

ddelt_m = Am / vm;

ddelt_t = 0;




end