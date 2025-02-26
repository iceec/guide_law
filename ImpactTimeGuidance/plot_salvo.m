m1 = load("m1.mat");
m2 = load("m2.mat");
m3 = load("m3.mat");
time = 0:0.001:100;

n = m1.n;
x1 = m1.XM;
x2 = m2.XM;
x3 = m3.XM;

y1 = m1.YM;
y2 = m2.YM;
y3 = m3.YM;

xt = m1.XT;
yt = m1.YT;


plot(x1(1:n-1),y1(1:n-1),x2(1:n-1),y2(1:n-1),x3(1:n-1),y3(1:n-1),xt(1:n-1),yt(1:n-1) ,'LineWidth', 2);