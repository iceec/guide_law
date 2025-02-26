f1 = load("30.mat");
f2 = load("60.mat");
f3 = load("90.mat");


time = 0:0.001:100;
X1 = f1.XM;
X2 = f2.XM;
X3 = f3.XM;
% X4 = f4.XM;


XT = f3.XT;


A1 = f1.AM;
A2 = f2.AM;
A3 = f3.AM;
% A4 = f4.AM;


Y1 = f1.YM;
Y2 = f2.YM;
Y3 = f3.YM;
% Y4 = f4.YM;

YT = f3.YT;


N1 = f1.step - 1;
N2 = f2.step - 1;
N3 = f3.step - 1;
% N4 = f4.n-1;


Q1 = f1.Q_angle;
Q2 = f2.Q_angle;
Q3 = f3.Q_angle;
% T4 = f4.THETA;


DQ1 = f1.DQ;
DQ2 = f2.DQ;
DQ3 = f3.DQ;

S1 = f1.S;
S2 = f2.S;
S3 = f3.S;

TGO1 = f1.TGO;
TGO2 = f2.TGO;
TGO3 = f3.TGO;

disp(Q1(N1-1));
disp(Q2(N2-1));
disp(Q3(N3-1));

disp(N1);
disp(N2);
disp(N3);


Z2 = f2.Z2;
D2 = f2.A2;


% figure(1);
% plot(X1(1:N1), Y1(1:N1), '-b', X2(1:N2), Y2(1:N2), '-.K', X3(1:N3), Y3(1:N3), '--m', XT(1:N3), YT(1:N3), ':r', 'LineWidth', 2); % X4(1:N4),Y4(1:N4),':k'
% x=xlabel('X/m');
% y=ylabel('Y/m');
% set(x,'FontSize',9,'FontName','Times New Roman');%设置横坐标标识的字体与大小
% set(y,'FontSize',9,'FontName','Times New Roman');%设置纵坐标标识的字体与大小
% hg1=legend({'\fontname{Times new roman}q_{d}=30^{\circ}', ...
%     '\fontname{Times new roman}q_{d}=60^{\circ}', '\fontname{Times new roman}q_{d}=90^{\circ}', '\fontname{宋体}目标'}, 'Location', 'best');
% 
% 
% 
% 
% 
% figure(2);
% 
% plot(time(1:N1-2), A1(1:N1-2), '-b', time(1:N2-2), A2(1:N2-2), '-.k', time(1:N3-2), A3(1:N3-2),'--m', 'LineWidth', 2);
% xlabel('t/s');
% ylabel('a_{M}/(m\cdot s^{-2})');
% hg2=legend({'\fontname{Times new roman}q_{d}=30^{\circ}', ...
%     '\fontname{Times new roman}q_{d}=60^{\circ}', '\fontname{Times new roman}q_{d}=90^{\circ}'}, 'Location', 'best');
% 
% 
% 
% figure(3);
% plot(time(1:N1-2), Q1(1:N1-2), '-b', time(1:N2-2), Q2(1:N2-2), '-.k', time(1:N3-2), Q3(1:N3-2), '--m', 'LineWidth', 2);
% xlabel('t/s');
% ylabel('q/{\circ}');
% legend({'\fontname{Times new roman}q_{d}=30^{\circ}', ...
%     '\fontname{Times new roman}q_{d}=60^{\circ}', '\fontname{Times new roman}q_{d}=90^{\circ}'}, 'Location', 'best');
% 
% figure(4);
% plot(time(1:N1-2), DQ1(1:N1-2), '-b', time(1:N2-2), DQ2(1:N2-2), '-.k', time(1:N3-2), DQ3(1:N3-2), '--m', 'LineWidth', 2);
% xlabel('t/s');
% ylabel('dq/({\circ}\cdot s^{-1})');
% legend({'\fontname{Times new roman}q_{d}=30^{\circ}', ...
%     '\fontname{Times new roman}q_{d}=60^{\circ}', '\fontname{Times new roman}q_{d}=90^{\circ}'}, 'Location', 'best');
% 
% 
% 
% 
% figure(5);
% plot(time(1:N1-2), S1(1:N1-2), '-b', time(1:N2-2), S2(1:N2-2), '-.k', time(1:N3-2), S3(1:N3-2), '--m', 'LineWidth', 2);
% xlabel('t/s');
% ylabel('S');
% legend({'\fontname{Times new roman}q_{d}=30^{\circ}', ...
%     '\fontname{Times new roman}q_{d}=60^{\circ}', '\fontname{Times new roman}q_{d}=90^{\circ}'}, 'Location', 'best');
% 
% 
% figure(6);
% plot(time(1:N1-2), TGO1(1:N1-2), '-b', time(1:N2-2), TGO2(1:N2-2), '-.k', time(1:N3-2), TGO3(1:N3-2), '--m', 'LineWidth', 2);
% xlabel('t/s');
% ylabel('t_{go}/s');
% legend({'\fontname{Times new roman}q_{d}=30^{\circ}', ...
%     '\fontname{Times new roman}q_{d}=60^{\circ}', '\fontname{Times new roman}q_{d}=90^{\circ}'}, 'Location', 'best');

figure(6);
plot(time(1:N2-2), D2(1:N2-2), '-k', time(1:N2-2), Z2(1:N-2), '-.b', 'LineWidth', 2);
xlabel('t/s');
ylabel('d/(m\cdot s^{-2})');
legend({'\fontname{Times new roman}d', ...
    '\fontname{Times new roman}z_{2}'}, 'Location', 'best');
