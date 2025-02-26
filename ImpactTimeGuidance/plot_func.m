f1 = load("0.5.mat");
f2 = load("0.1.mat");
f3 = load("0.05.mat");
time = 0:0.001:100;

n = f1.n;
e1 = f1.E;
e2 = f2.E;
e3 = f3.E;


plot(time(1:n-1),e1(1:n-1),time(1:n-1),e2(1:n-1),time(1:n-1),e3(1:n-1), 'LineWidth', 2);