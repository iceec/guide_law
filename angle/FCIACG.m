% FCIACG
clc;
close all;
clear;
global qd;
global yimo;
global kc;
global seta;
global gama;

global ak1;
global ak2;
global b1;
global b2;






% 导弹的信息
xm = 10000; ym = 0; vm = 300; 
yita_m_max = 45 / 180 * pi; % 最大的前置角度范围
delm = 0 / 180 * pi; % 起始的航迹角




%目标的信息
xt = 0 ; yt = 0; vt = 0;
delt = 0 * 180 / pi;


qd = 90 * pi / 180;
kc = vm * sin(yita_m_max) - vt;
ak1 = 2;
ak2 = 0.2;
b1 = 2;
b2 = 1;

gama = 0.75;
seta = 0.05;
yimo = 0.1;


% am = -(1/cos(yita_m_max) *M1 - z2_ -alf_1_dot + (kc ^ 2 - x2 ^2)/kc ^2 )


r = sqrt((xt - xm )^2 + (yt-ym)^2);
q = atan2(yt-ym,xt-xm);

z1 = 0;
z2 = 0;

yita_m = q - delm;
yita_t = q - delt;

h = 0.01; % 步长信息

n = 1;
while r > 0 && n < 5000
    R(n) = r;
    Q(n) = q;
    YITA_M(n) = yita_m;
    YITA_T(n) = yita_t;

    pos = [r,q,yita_m,yita_t,z1,z2];
    k1 = runge(pos,vm,vt);
    k2 = runge(pos + h/2*k1,vm,vt);
    k3 = runge(pos + h/2*k2,vm,vt);
    k4 = runge(pos + h*k3,vm,vt);

    next_pos = pos + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    
    r = next_pos(1);
    q = next_pos(2);
    yita_m = next_pos(3);
    yita_t = next_pos(4);
    z1 = next_pos(5);
    z2 = next_pos(6);
    % 可以考虑对xm ym 进行runge积分 
    n = n+1;
    
end

figure(1);

plot(R,'LineWidth',2);



function next_pos=runge(pos,vm,vt)

 global qd;
global yimo;
global kc;
global seta;
global gama;

global ak1;
global ak2;
global b1;
global b2;

    r = pos(1);
    q = pos(2);
    yita_m = pos(3);
    yita_t = pos(4);


    % 观测器的积分
    z1 = pos(5);
    z2 = pos(6);

    dr = vt * cos(yita_t) - vm * cos(yita_m);
    dq = (vm * sin(yita_m) - vt * sin(yita_t))/r;


    x1 = q - qd;
    x2 = r * dq;

    % y 就是 x2
    y =x2;

    dz1 = z2 + b1*abs( (y-z1)/seta)^gama * sign(y - z1);
    dz2 = b2 / seta *abs((y-z1)/seta)^(2*gama-1) * sign(y - z1);

    M1 = (-kc * abs(x1) / (abs(x1) +yimo)^2 + kc / (abs(x1) + yimo) -dr)*x2/r;

    a1 = -(kc) /(abs(x1) + yimo) * x1;
    
    da1 = (-kc /(abs(x1) + yimo)^2 * abs(x1) - kc / (abs(x1) + yimo))*x2/r;

    s = (kc / (abs(x1) + yimo)) * x1 + x2;

    % k1 k2 要自己进行选择 z2 
    


    p = kc / (2 * s) *log(((kc+s+a1)*(kc-a1)) / ((kc - s - a1) * (kc + a1)));

    am = - 1 / cos(yita_m) * (-M1 - z2 - da1 + ((kc ^2 - x2 ^2) / kc^2) * p * da1 - ak1 * s - ak2 * sign(s));

    ddelta_m = am / vm;

    dyita_m = dq - ddelta_m;
    dyita_t = dq;


    next_pos(1) = dr;
    next_pos(2) = dq;
    next_pos(3) = dyita_m;
    next_pos(4) = dyita_t;
    next_pos(5) = dz1;
    next_pos(6) = dz2;


    

end
