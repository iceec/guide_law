% yita_m 还是取得是相反的  
function [dr,dq,ddelt_m,ddelt_t,am,at,dW] = dynamic(vm,vt,r,q,delt_m,delt_t,W)

%代价函数
R1 = 0.1; % 表示am的
R2 = 0.1; % 表示at的
Q1 = 200;
ac = 0.07;
as = 10;

%评价网络的参数
%W 是要每次都传进来求出dW给出去


yita_m = delt_m - q;
yita_t = delt_t - q;


dr = vt * cos(yita_t) -vm * cos(yita_m);
dq = (vt * sin(yita_t) - vm * sin(yita_m))/r;

%定义状态变量  确定激活函数
x = dq;
dactive = [1 ; 2*x ; 3*x^2 ; 4*x^3];
%函数的前置项 都是 1*1的
fx = (-2*dr*x)/r;
gx = -cos(yita_m)/r;
kx = cos(yita_t)/r;



%求最优的am和at
am = -0.5/R1 * gx * dactive' * W;
at = 0.5/R2 * kx * dactive' *W;

ddelt_m = am / vm;
ddelt_t = at / vt;


% 对w参数进行修改 
% 先求ec
%激活函数 active  = [x; x^2;x^3;x^4];

%Q(x)
Qx =  Q1 * x^2;
part1 = W' * dactive * fx;
part2 = -1/4 * W' * dactive * gx * (1/R1) * gx' * dactive' * W;
part3 = 1/4 * W' *dactive * kx * (1/R2) * kx' * dactive' * W;
ec = Qx + part1 + part2 + part3;  % 1*1

% n*1
ec_d_w = dactive * fx - 1/2 *  dactive * gx * (1/R1) * gx' * dactive' * W + 1/2 * dactive * kx * (1/R2) * kx' * dactive' * W;



% 求附加项的值
% Jx = 0.5 * x^2 -> x
dx = fx + gx*am + kx * at;
dJx = x * dx;

item = 0;
if dJx < 0
    item = 1;
end

dW_p1 = 0.5 * as * item * dactive * gx * (1/R1) * gx' * x;  % x 表示dJ
dW_p2 = -0.5 * as * item * dactive * kx * (1/R2) * kx' * x;

dW = -ac * ec_d_w *ec + dW_p1 + dW_p2;



end