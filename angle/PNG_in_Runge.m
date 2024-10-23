clc; close all;
clear;
% 建立导弹信息
xm = 0; ym = 0; vm = 100; delta_m = 30 / 180 * pi;

% 建立目标信息
 %xt = 5000; yt = 400; vt = 10; delta_t = 10 / 180 * pi;
xt = 5000; yt = 0; vt = 0; delta_t = 0;

k = 3;

q = atan2(yt - ym , xt - xm); % 得到的也是弧度

yita_m = q - delta_m;
yita_t = q - delta_t;

r = sqrt((xt - xm) ^ 2 + (yt - ym) ^ 2);
n = 0;
h = 0.01;
while r > 0 && n < 8000
    n = n + 1;
    XM(n) = xm;
    YM(n) = ym;
    R(n) = r;
    % 记录中间信息

    init_info = [r,q,yita_m,yita_t];

    k1 = runge(init_info,vm,vt);
    k2 = runge(init_info + h/2 * k1,vm,vt);
    k3 = runge(init_info + h/2 * k2,vm,vt);
    k4 = runge(init_info + h*k3,vm,vt);


    next_info = init_info + h/6 *(k1 + 2*k2 + 2*k3 + k4);

    r = next_info(1);
    q = next_info(2);
    yita_m = next_info(3);
    yita_t = next_info(4);



    delta_m = q - yita_m;

    xm = xm + vm * cos(delta_m) * h ; 

    ym = ym + vm * sin(delta_m) * h ;

end


figure(1);

plot(XM,YM,'LineWidth',2);

figure(2);

plot(R,'LineWidth',2);

%{
 这个r其实是一个矢量 dr * dt 表明了增大或者减小
 
 疑问 为什么要保证 dq是永远< 0 的 一旦 > 0 制导就结束了 这个是为什么 ？？？
 
 还有就是制导的本身就要要求dq是 = 0 的 这样一直存在着碰撞三角形 


%}


function out=runge(info,vm,vt)

r = info(1);
yita_m = info(3);
yita_t = info(4);

dr = vt * cos(yita_t) - vm * cos(yita_m);
dq = (vm * sin(yita_m) - vt * sin(yita_t))/r;

ddel_m = 3 * dq;

dyita_m = dq - ddel_m;

dyita_t = dq - 0;


out(1) = dr;
out(2) = dq;
out(3) = dyita_m;
out(4) = dyita_t;

end

