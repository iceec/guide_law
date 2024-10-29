clear;
% 打击固定目标 固定目标的版本over
% 导弹信息
xm = -10000; ym = 2000; vm = 250;
delt_m = -60 * pi / 180;


%目标信息
xt = 0; yt = 0; vt = 0; 
delt_t = 0 / 180 * pi;



% 相对信息
 r = sqrt((xt - xm)^2 + (yt - ym)^2);
 q = atan2(yt - ym,xt - xm);


 h = 0.001;
 N = 1000 * 100;


R = zeros(1,N);
Q = zeros(1,N);
XM = zeros(1,N);
YM = zeros(1,N);
AM = zeros(1,N);

n = 1;
while r > 0 && n <N

yita_m = delt_m - q;
yita_t = delt_t - q;


R(n) = r; Q(n) = q;

[dr,dq,ddelt_m,ddelt_t,am]=dynamic(vm,vt,q,r,yita_m,yita_t,n*h);

r = r + dr *h;
q = q + dq *h;
delt_m  = delt_m + ddelt_m * h;
delt_t = delt_t + ddelt_t *h;
xm = xm + vm * cos(delt_m) * h;
ym = ym + vm * sin(delt_m) * h;

XM(n) = xm; YM(n) = ym; AM(n) =am;
n = n + 1;

end


disp(n);

figure(1);

plot(XM(1:n-1),YM(1:n-1),'LineWidth',2);

figure(2);

plot(AM(1:n-1),'LineWidth',2);