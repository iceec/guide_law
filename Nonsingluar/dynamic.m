
function [dr,dq,ddelt_m,ddelt_t,s,am] = dynamic(vm,vt,yita_m,yita_t,q,r)


qd = 90 / 180 * pi;
a_max = 400;

% 表示扰动即为目标的加速度信息
d = 0;

% 滑模状态的信息
% 这几数不可以瞎取 必须够大才OK
Beta = 1;
Alpha = 5 / 3 ;  % 必须保证是奇数
M = 3000;  % 必须大于某一个值 和at 有关系



dr = -vm * cos(yita_m) + vt * cos(yita_t);

dq = (vm * sin(yita_m) - vt * sin(yita_t))/r;


% 获取状态变量
x1 = q - qd;
x2 = dq;

% 表示滑模面
s = x1 + Beta * x2^Alpha;


% 求得制导律
a1 = r/cos(yita_m) * ((-2 * dr* x2)/r  + d + 1/(Alpha * Beta) * x2^(2-Alpha)); % s_dot =0


%a1 = abs(dr)*x2 / abs(cos(yita_m)) * (2 + r * x2^(1 - Alpha) / (Alpha * Beta * abs(dr)));


a2 = M / sign(cos(yita_m)) * sgmf(s); % 使得V稳定的
am = a1 + a2;

if(abs(am) > a_max)
    am = a_max * sign(am);
end

ddelt_m = am / vm;
ddelt_t = 0; % 求得目标的加速度


end