clc;
close all;
clear;
time_series = 0 : 0.01 : 5;


Z1 = zeros(1,501);
Z2 =zeros(1,501);
Z3 = zeros(1,501);



X1 = zeros(1,501);
X2 =zeros(1,501);
X3 = zeros(1,501);


% 初始的位置
x1 = 4; 
x2 = 0;
u=0;

z1 = 0;
z2 = 0;
z3 = 0;

step = 0.01;
n =1;

for time_point = time_series
    
    u = sin(time_point);

    d = 3 * sin(time_point);

    [dx1,dx2] = dynamic(x1,x2,u,d);

    [dz1,dz2,dz3] = leso(z1,z2,z3,x1,u);


    z1 = z1 + dz1 * step;
    z2 = z2 + dz2 * step;
    z3 = z3 + dz3 * step;

    x1 = x1 + dx1 * step;
    x2 = x2 + dx2 * step;

    Z1(n) = z1;
    Z2(n) = z2;
    Z3(n) = z3;

    X1(n) = x1;
    X2(n) = x2;
    X3(n) = 3 * sin(time_point);

    n = n+1;




end

figure(1);
plot(time_series,X1,time_series,Z1,'LineWidth',2);

figure(2);
plot(time_series,X2,time_series,Z2,'LineWidth',2);

figure(3);
plot(time_series,X3,time_series,Z3,'LineWidth',2);

function [dz1,dz2,dz3]=leso(z1,z2,z3,y,u)

tmp = y - z1;

dz1 = z2 + 30 * tmp;

dz2 = z3 + u + 300 * tmp;

dz3 = 1000 * tmp;

end



function [dx1,dx2] = dynamic(x1,x2,u,d)


dx1 = x2;
dx2 = u + d;

end









