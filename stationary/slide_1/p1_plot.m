f1 = load("50.mat");
f2 = load("60.mat");
f3 = load("70.mat");
f4 = load("80.mat");


time = 0 :0.001:100;
X1 = f1.XM;
X2 = f2.XM;
X3 = f3.XM;
X4 = f4.XM;

A1 = f1.AM;
A2 = f2.AM;
A3 = f3.AM;
A4 = f4.AM;





Y1 = f1.YM;
Y2 = f2.YM;
Y3 = f3.YM;
Y4 = f4.YM;

N1 = f1.n-1;
N2 = f2.n-1;
N3 = f3.n-1;
N4 = f4.n-1;


T1 = f1.THETA;
T2 = f2.THETA;
T3 = f3.THETA;
T4 = f4.THETA;


% figure(1);
% plot(X1(1:N1),Y1(1:N1),'-r',X2(1:N2),Y2(1:N2),'--g',X3(1:N3),Y3(1:N3),'-.b',X4(1:N4),Y4(1:N4),':k','LineWidth',0.75);
% hold on
% plot(0,0,'o','MarkerFaceColor','k');
% xlabel('X/M');
% ylabel('Y/M');
% legend({'t_{d}=50s','t_{d}=60s','t_{d}=70s','t_{d}=80s','target'},'Location','best');


% figure(2);
% 
% plot(time(1:N1-2),A1(1:N1-2),'-r',time(1:N2-2),A2(1:N2-2),'--g',time(1:N3-2),A3(1:N3-2),'-.b',time(1:N4-2),A4(1:N4-2),':k','LineWidth',0.75);
% 
%  xlabel('t/s');
%  ylabel('a_{m}/(m\cdot s^{-2})');
% legend({'t_{d}=50s','t_{d}=60s','t_{d}=70s','t_{d}=80s','target'},'Location','best');


% 
% figure(3);
% 
% plot(time(1:N1),T1(1:N1),'-r',time(1:N2),T2(1:N2),'--g',time(1:N3),T3(1:N3),'-.b',time(1:N4),T4(1:N4),':k','LineWidth',0.75);
% 
% xlabel('t/s');
% ylabel('\theta_{imp}/(\circ)');
% legend({'t_{d}=50s','t_{d}=60s','t_{d}=70s','t_{d}=80s'},'Location','best');