global vm;
global vt;
% lamda 和 seta 表示目标的速度向量与地面坐标系的倾角和偏角
% 打击非机动目标 那么 Lamda 和 Seta 就不会改变了
global Lamda;
global Seta;
%期望的撞击角度
global theta_d; 
global yita_d;

theta_d = -35 * pi / 180;
yita_d = 10 * pi / 180;
vm = 300;
vt  = 100;
Lamda = 0/180*pi;
Seta = 30/180 * pi;

r  = 10000;
theta = -60 * pi / 180;
yita = 40 * pi / 180 ;
theta_m = 20* pi / 180 ;
yita_m = 20* pi / 180 ;

[theta_t,yita_t] = Trans(Lamda,Seta,theta,yita);


N = 100000;
h  = 0.001;
AMZ = zeros(1,N);
AMY = zeros(1,N);
n = 1;
while r > 3 &&  n< N

dif = Dynamic(r,theta,yita,theta_m,yita_m,theta_t,yita_t);

dr = dif(1);
dtheta = dif(2);
dyita = dif(3);
dtheta_m = dif(4);
dyita_m  = dif(5);
dtheta_t = dif(6);
dyita_t = dif(7);
amz = dif(8);
amy = dif(9);

r = f(r,dr);
theta = f(theta,dtheta);
yita = f(yita,dyita);
theta_m = f(theta_m,dtheta_m);
yita_m = f(yita_m,dyita_m);
theta_t = f(theta_t,dtheta_t);
yita_t = f(yita_t,dyita_t);

AMY(n) = amy;
AMZ(n) = amz;
n = n + 1;
end



plot(AMY(1:n-1),'LineWidth',2);
