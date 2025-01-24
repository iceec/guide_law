f1 = load("n90.mat");
f2 = load("180.mat");



time = 0 :0.001:100;
X1 = f1.XM;
X2 = f2.XM;
% X3 = f3.XM;
% X4 = f4.XM;


XT1 = f1.XT;
XT2 = f2.XT;

A1 = f1.AM;
A2 = f2.AM;
% A3 = f3.AM;
% A4 = f4.AM;



Y1 = f1.YM;
Y2 = f2.YM;
% Y3 = f3.YM;
% Y4 = f4.YM;

YT1 = f1.YT;
YT2 = f2.YT;

N1 = f1.step-1;
N2 = f2.step-1;

% N3 = f3.n-1;
% N4 = f4.n-1;


T1 = f1.IMPACT;
T2 = f2.IMPACT;
% T3 = f3.THETA;
% T4 = f4.THETA;


% figure(1);
% plot(X1(1:N1),Y1(1:N1),'-r',X2(1:N2),Y2(1:N2),'-K',XT2(1:N2),YT2(1:N2),'-.b','LineWidth',2); % X4(1:N4),Y4(1:N4),':k'
% hold on
% plot(0,0,'o','MarkerFaceColor','k');
% xlabel('X/M');
% ylabel('Y/M');



figure(2);

plot(time(1:N1-2),A1(1:N1-2),'-r',time(1:N2-2),A2(1:N2-2),'--k','LineWidth',2);

 xlabel('t/s');
 ylabel('a_{m}/(m\cdot s^{-2})');


% 
% figure(3);
% 
% plot(time(1:N1),T1(1:N1),'-r',time(1:N2),T2(1:N2),'--g',time(1:N3),T3(1:N3),'-.b',time(1:N4),T4(1:N4),':k','LineWidth',0.75);
% 
% xlabel('t/s');
% ylabel('\theta_{imp}/(\circ)');
% legend({'t_{d}=50s','t_{d}=60s','t_{d}=70s','t_{d}=80s'},'Location','best');