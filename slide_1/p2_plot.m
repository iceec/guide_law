f1 = load("s1.mat");
f2 = load("s2.mat");
f3 = load("s3.mat");


time = 0 :0.001:100;
X1 = f1.XM;
X2 = f2.XM;
X3 = f3.XM;

A1 = f1.AM;
A2 = f2.AM;
A3 = f3.AM;

Y1 = f1.YM;
Y2 = f2.YM;
Y3 = f3.YM;


N1 = f1.n-1;
N2 = f2.n-1;
N3 = f3.n-1;


T1 = f1.THETA;
T2 = f2.THETA;
T3 = f3.THETA;


% figure(1);
% plot(X1(1:N1),Y1(1:N1),'-k',X2(1:N2),Y2(1:N2),'--k',X3(1:N3),Y3(1:N3),'-.k','LineWidth',0.75);
% hold on
% plot(0,0,'o','MarkerFaceColor','r');
% xlabel('X/M');
% ylabel('Y/M');
% legend({'Missile1','Missile2','Missile3','target'},'Location','best');


figure(2);

plot(time(1:N1-2),A1(1:N1-2),'-k',time(1:N2-2),A2(1:N2-2),'--k',time(1:N3-2),A3(1:N3-2),'-.k','LineWidth',0.75);

 xlabel('t/s');
 ylabel('a_{m}/(m\cdot s^{-2})');
legend({'Missile1','Missile2','Missile3'},'Location','best');



% figure(3);
% 
% plot(time(1:N1),T1(1:N1),'-k',time(1:N2),T2(1:N2),'--k',time(1:N3),T3(1:N3),'-.k','LineWidth',0.75);
% 
% xlabel('t/s');
% ylabel('\theta_{imp}/(\circ)');
% legend({'Missile1','Missile2','Missile3'},'Location','best');