%具有落角约束的导引律
%2020/12/5 by zhouyu
clc
close all
clear all
% %% 打击地面目标
% t=0.001;
% time=100;
% step=time/t;
% %变量定义
% xm=zeros(1,step);
% ym=zeros(1,step);
% r=zeros(1,step);%弹目距离
% a=zeros(1,step);%法向过载
% theta=zeros(1,step);%弹道倾角
% q=zeros(1,step);%视线角
% eta=zeros(1,step);%速度前置角
% %常量定义
% V=120;
% xt=4000;
% yt=0;
% thetaset=pi/6;
% %变量赋初值
% xm(1)=0;
% ym(1)=4000;
% r(1)=sqrt((xm(1)-xt)^2+(ym(1)-yt)^2);
% theta(1)=0;
% 
% for i=1:step
%     q(i)=atan((ym(i)-yt)/(xt-xm(i)));
%     qdot=-V*sin(theta(i)-q(i))/r(i);
%     rdot=-V*cos(theta(i)-q(i));
%     tgo=-r(i)/rdot;
%     thetadot=(4*qdot-2*(thetaset-q(i))/tgo);%4*qdot;%
%     xdot=V*cos(theta(i));
%     ydot=-V*sin(theta(i));
%  
%     r(i+1)=r(i)+rdot*t; 
%     theta(i+1)=theta(i)+thetadot*t;  
%     xm(i+1)=xm(i)+xdot*t; 
%     ym(i+1)=ym(i)+ydot*t;
%     if r(i)<0.5
%         a=i;
%        break
%     end
%     
% end
% figure(1)
% plot(xm(1:a),ym(1:a))
% hold on
% plot(xt,yt,'*')
% figure(2)
% xx=0.001*[1:step];
% plot(xx,theta)
%% 打击空中目标
t=0.001;
time=100;
step=time/t;
%变量定义
xm=zeros(1,step);
ym=zeros(1,step);

xt=zeros(1,step);
yt=zeros(1,step);
r=zeros(1,step);%弹目距离
a=zeros(1,step);%法向过载
theta=zeros(1,step);%弹道倾角
t_d = zeros(1,step);
theta_t=zeros(1,step);%弹道倾角
q=zeros(1,step);%视线角
r_d = zeros(1,step);

q_d=zeros(1,step);%视线角
eta=zeros(1,step);%速度前置角
%常量定义
V=120;
V1 = 50;
xt(1)=4000;
yt(1)=10000;%目标在天上
thetaset=30/180*pi;
%变量赋初值
xm(1)=0;
ym(1)=4000;
r(1)=sqrt((xm(1)-xt(1))^2+(ym(1)-yt(1))^2);
theta(1)=30/180*pi;
theta_t(1) = 0/180*pi;

q(1)=atan((yt-ym(1))/(xt-xm(1)));%弹目视线角计算
for i=1:step
    
    qdot=(V*sin(-theta(i)+q(i))-V1*sin(-theta_t(i)+q(i)) )/r(i);
    rdot=-V*cos(theta(i)-q(i))+V1*cos(theta_t(i)-q(i));
    tgo=-r(i)/rdot;
    thetadot=(4*qdot-2*(thetaset-q(i))/tgo);
    the_t_dot = -sin(step * t)/V1;
    
    xdot=V*cos(theta(i));
    ydot=V*sin(theta(i));
  
    xtdot=V1*cos(theta_t(i));
    ytdot=V1*sin(theta_t(i));


    q(i+1)=q(i)+qdot*t; 
    r(i+1)=r(i)+rdot*t; 
    theta(i+1)=theta(i)+thetadot*t;  
    theta_t(i+1) = theta_t(i) + the_t_dot*t;

    xm(i+1)=xm(i)+xdot*t; 
    ym(i+1)=ym(i)+ydot*t;



    xt(i+1)=xt(i)+xtdot*t; 
    yt(i+1)=yt(i)+ytdot*t;
    q_d(i) = qdot;
    r_d(i) = rdot;
    t_d(i) = thetadot*V;
    if r(i)<0.5
        a=i;
       break
    end
    
end
figure(1)
plot(xm(1:a),ym(1:a),xt(1:a),yt(1:a),'LineWidth',2)
figure(2)
plot(r(1:a),'LineWidth',2);

figure(4)
plot(q_d(1:a),'LineWidth',2);

figure(5)
plot(t_d(1:a),'LineWidth',2);


