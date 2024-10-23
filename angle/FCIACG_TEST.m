
clc;
close all;
clear;




vm = 3*340;
vt = 0;
r = sqrt(10000^2 + 15000^2);

xm = 0;
ym = 15000;

xt = 10000;
yt = 0;
q = atan2(yt - ym , xt - xm);
delt_m = -40 / 180 * pi;
delt_t = 0 / 180 * pi;


n = 1;
dt = 0.01;


R=zeros(1,10000);
XM=zeros(1,10000);
YM = zeros(1,10000);


YITA_M = zeros(1,10000);
AM = zeros(1,10000);
DELT_M = zeros(1,1000);
S = zeros(1,10000);


while r> 1 && n <= 10000




[dr,dq,ddelt_m,ddelt_t,am,s] = dynamic(vm,vt,delt_m,delt_t,r,q);


R(n) = r;
XM(n) = xm;
YM(n) = ym;

YITA_M(n) = (q - delt_m) / pi * 180;

AM(n) = am / 9.81;
DELT_M(n) = delt_m * 180 / pi;
S(n) = s;







r = r + dr * dt;
q = q + dq * dt;
delt_m = delt_m + ddelt_m * dt;
delt_t = delt_t + ddelt_t * dt;

xm = xm + vm * cos(delt_m) * dt;
ym = ym + vm * sin(delt_m) * dt;





n = n+1;

end


figure(1);

plot(XM(1,1:n-1),YM(1,1:n-1),'LineWidth',2);
hold on
plot(xt,yt,'*');


figure(2);

plot(DELT_M(1:n-1),'LineWidth',2);

figure(3);

plot(YITA_M(1:n-1),'LineWidth',2);