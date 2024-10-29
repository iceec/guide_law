function [dr,dq,ddelt_m,ddelt_t,am] = dynamic(vm,yita_m,q,r)


qd = 180 / 180 * pi;
a_max = 400;


dr = -vm * cos(yita_m);

dq = -(vm * sin(yita_m))/r;



% 求得制导律
a1 = 4 * vm * dq + 2 * vm^2 * (q - qd)/r ; % 表示最优制导律 满足u 最小的情况之下的  
a2 = 0; % 
am = a1 + a2;

if(abs(am) > a_max)

    am = a_max *sign(am);

end

ddelt_m = am / vm;
ddelt_t = 0; % 求得目标的加速度


end