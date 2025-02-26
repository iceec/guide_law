f1 = load("G1.mat");
f2 = load("G2.mat");
f3 = load("G3.mat");


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


disp(Q1(N1-1));
disp(Q2(N2-1));
disp(Q3(N3-1));

disp(N1);
disp(N2);
disp(N3);



% 
figure(1);
tsubplot(1, 1, 1,'tight');
plot(X1(1:N1), Y1(1:N1), '-b', X2(1:N2), Y2(1:N2), '-.K', X3(1:N3), Y3(1:N3), '--m', XT(1:N3), YT(1:N3), ':r', 'LineWidth', 2); % X4(1:N4),Y4(1:N4),':k'
x=xlabel('X/m');
y=ylabel('Y/m');
hg1=legend({'\fontname{Times new roman}G_{1}', ...
    '\fontname{Times new roman}G_{2}', '\fontname{Times new roman}G_{3}', '\fontname{宋体}目标'}, 'Location', 'best');



% figure(2);
% tsubplot(3, 1, 1,'tight');
% plot(time(1:N1-2), A1(1:N1-2), '-k', 'LineWidth', 2);
% legend('\fontname{Times new roman}G_{1}', 'Location', 'southeast');
% xlabel('t/s');
% ylabel('a_{M}/(m\cdot s^{-2})');
% 
% 
% tsubplot(3, 1, 2,'tight');
% plot(time(1:N2-2), A2(1:N2-2), '-k',  'LineWidth', 2);
% legend('\fontname{Times new roman}G_{2}', 'Location', 'southeast');
% xlabel('t/s');
% ylabel('a_{M}/(m\cdot s^{-2})');
% tsubplot(3, 1, 3,'tight');
% plot( time(1:N3-2), A3(1:N3-2),'-k', 'LineWidth', 2);
% legend('\fontname{Times new roman}G_{3}', 'Location', 'southeast');
% xlabel('t/s');
% ylabel('a_{M}/(m\cdot s^{-2})');




% figure(3);
% plot(time(1:N1-2), Q1(1:N1-2), '-b', time(1:N2-2), Q2(1:N2-2), '-.k', time(1:N3-2), Q3(1:N3-2), '--m', 'LineWidth', 2);
% xlabel('t/s');
% ylabel('q/{\circ}');
% legend({'\fontname{Times new roman}G_{1}', ...
%      '\fontname{Times new roman}G_{2}', '\fontname{Times new roman}G_{3}'}, 'Location', 'best');
% 
% figure(4);
% plot(time(1:N1-50), DQ1(1:N1-50), '-b', time(1:N2-2), DQ2(1:N2-2), '-.k', time(1:N3-2), DQ3(1:N3-2), '--m', 'LineWidth', 2);
% xlabel('t/s');
% ylabel('dq/({\circ}\cdot s^{-1})');
% legend({'\fontname{Times new roman}G_{1}', ...
%      '\fontname{Times new roman}G_{2}', '\fontname{Times new roman}G_{3}'}, 'Location', 'best');
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


