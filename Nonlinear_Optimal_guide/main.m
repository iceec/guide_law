% 你做的不是最优的 还差点 1: 时间不太对 第一个时间是超的
% 第二个情景最后的加速度是不对的 是超过的 本来是-75 你的减到-120了 
% eso的形式要满足 z2 是独立的
xm = 0;
ym = 0;
xt = 2500*sqrt(3);
yt = 2500;
vm = 500;
vt = 250;
t = 0;

delt_t = 60 / 180 * pi;
delt_m = 0 / 180 * pi;

r = sqrt((xm - xt) ^ 2 + (ym - yt) ^ 2);
q = atan2(yt - ym, xt - xm);

h = 0.001;
N = 1000 * 80;

XM = zeros(1, N);
YM = zeros(1, N);
XT = zeros(1, N);
YT = zeros(1, N);
R = zeros(1, N);
AM = zeros(1, N);

YITA_R = zeros(1,N);
ERR = zeros(1,N);

n = 1;
am_pre = 0;
z1 = (vt * sin(delt_t - q) - vm * sin(delt_m - q)) / r;
z2 = 0;
% z1一定要预先存在的 不然没办法计算的 z2 = 0;
Z2 = zeros(1, N);
A2 = zeros(1, N);

time = 0 : 0.001 : 80;

J = 0;

while r > 0 && n < N

R(n) = r;
XM(n) = xm;
YM(n) = ym;
XT(n) = xt;
YT(n) = yt;
[ dr, dq, ddelt_m, ddelt_t, am,yita_r,err] = dynamic(vm, vt, r, q, delt_m, delt_t,t);


ERR(n) = err / pi * 180;
YITA_R(n) = yita_r / pi * 180;


AM(n) = am;

J =  J + abs(am);

am_pre = am;

r = r + h * dr;
q = q + h * dq;
delt_m = delt_m + h * ddelt_m;
delt_t = delt_t + h * ddelt_t;

xm = xm + vm * cos(delt_m) * h;
ym = ym + vm * sin(delt_m) * h;

xt = xt + vt * cos(delt_t) * h;
yt = yt + vt * sin(delt_t) * h;
t = t + h;

n = n + 1;

if mod (n, 1000) == 0 
    disp(r) 
end

end


figure(1);

plot(XM(1:n-1),YM(1:n-1),XT(1:n-1),YT(1:n-1),'LineWidth',2);

figure(2);

plot(AM(1:n-10),'LineWidth',2);

figure(3);
plot(YITA_R(1:n-1),'LineWidth',2);

figure(4);
plot(ERR(1:n-1),'LineWidth',2);

disp(J);
