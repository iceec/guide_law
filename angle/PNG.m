clc; close all;
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
dt = 0.01;
while r > 0
    n = n + 1;
    XM(n) = xm;
    YM(n) = ym;
    R(n) = r;
    % 记录中间信息
    dr = vt * cos(yita_t) - vm * cos(yita_m);
    dq = (vm * sin(yita_m) - vt * sin(yita_t))/r;

    DQ(n) = dq;
    
    % 改变之后的q 
    r = r + dr * dt;
    
    q = q + dq * dt;


    am = k * vm * dq ;
    ddelta_m = am / vm ; 

    delta_m = delta_m + ddelta_m * dt ;

    yita_m = q - delta_m; 

    yita_t = q - delta_t;

    xm = xm + vm * cos(delta_m) * dt ; 

    ym = ym + vm * sin(delta_m) * dt ;

end


figure(1);

plot(XM,YM,'LineWidth',2);

figure(2);
plot(DQ,'LineWidth',2);

%{
 这个r其实是一个矢量 dr * dt 表明了增大或者减小
 
 疑问 为什么要保证 dq是永远< 0 的 一旦 > 0 制导就结束了 这个是为什么 ？？？
 
 还有就是制导的本身就要要求dq是 = 0 的 这样一直存在着碰撞三角形 


%}
