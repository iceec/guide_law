d1=load("0.mat");
d2 = load("90.mat");
d3 = load("n90.mat");
d4 = load("180.mat");

time = 0 : 0.001 : 40;

x1 = d1.XM;
y1 = d1.YM;
n1 = d1.n;
a1 = d1.AM; 


x2 = d2.XM;
y2 = d2.YM;
n2 = d2.n;
a2 = d2.AM; 

x3 = d3.XM;
y3 = d3.YM;
n3 = d3.n;
a3 = d3.AM; 

x4 = d4.XM;
y4 = d4.YM;
n4 = d4.n;
a4 = d4.AM; 

figure(1);

plot(x1(1:n1-1),y1(1:n1-1),'-',x2(1:n2-1),y2(1:n2-1),'--',x3(1:n3-1),y3(1:n3-1),'-.',x4(1:n4-1),y4(1:n4-1),':','LineWidth',2);

figure(2);
plot(time(1:n1-1),a1(1:n1-1),'-',time(1:n2-1),a2(1:n2-1),'--',time(1:n3-1),a3(1:n3-1),'-.',time(1:n4-1),a4(1:n4-1),':','LineWidth',2);


disp(d1.sum);
disp(d2.sum);
disp(d3.sum);
disp(d4.sum);