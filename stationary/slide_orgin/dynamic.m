
function dx = dynamic(x)

global vm vt am;

r = x(1); q = x(2); delt_m = x(3); delt_t = x(4);

yita_m = q - delt_m;
yita_t = q - delt_t;


qd = 90 / 180 * pi;
a_max = 400;
%delt_mf = qd;

% 表示扰动即为目标的加速度信息
d = 0;

% 滑模状态的信息
% 这几数不可以瞎取 必须够大才OK
Beta = 1;
Alpha = 5 / 3 ;  % 必须保证是奇数
M = 3000;  % 必须大于某一个值 和at 有关系
%K=5;


dr = -vm * cos(yita_m) + vt * cos(yita_t);

dq = (vm * sin(yita_m) - vt * sin(yita_t))/r;


% 获取状态变量
x1 = q - qd;
x2 = real(dq);


% yita_mf = delt_mf - q;  % 表示是负的
% 
% dyita_mf = -dq;

% % 估计剩余飞行时间
%tgo = r / vm *(1 + (yita_m^2 + yita_mf^2) / 15 - yita_mf * (-yita_m) / 30);


% %求解时间参数b c 
% b = - r / (vm^2) * (2/15 * (-yita_m) - 1/30 * yita_mf);
% c = r/vm * (2/15 * yita_mf * dyita_mf  - 1/30 * (-yita_m) * dyita_mf) + dr / vm *(1 + (yita_m^2 + yita_mf^2) / 15);

% 表示滑模面
sia = x1 + Beta * (nthroot(x2,3))^5;
% sit = td - t - tgo;


% %求解时间项
% at1 = (c + 1) / b;
% at2 = -K/b*sgmf(sit);
% 
% 
% at = at1 + at2;





% 求得制导律
a1 = r/cos(yita_m) * ((-2 * dr* x2)/r  + d + 1/(Alpha * Beta) * nthroot(x2,3)); % s_dot =0


%a1 = abs(dr)*x2 / abs(cos(yita_m)) * (2 + r * x2^(1 - Alpha) / (Alpha * Beta * abs(dr)));


a2 = M / sign(cos(yita_m)) * sgmf(sia); % 使得V稳定的
am = a1 + a2;

if(abs(am) > a_max)
    am = a_max * sign(am);
end

ddelt_m = am / vm;
ddelt_t = 0; % 求得目标的加速度

dx(1) = dr; dx(2) = dq; dx(3) = ddelt_m; dx(4) = ddelt_t; dx(5) = vm * cos(delt_m); dx(6) = vm * sin(delt_m);


end