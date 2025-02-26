T = 0 : 0.001 : 10;

N = 9.9*1000;
Y2 = zeros(1,N);
Y1 = zeros(1,N);
n  = 1;

ts = 10;
t = 0;
l = 0.5;
dt = 0.001;
while n <N

    y1 = -t/(ts-t);
    y2 = -t^(1.5)/(ts-t);    Y1(n) = y1;
    Y2(n) = y2;
    t = t + dt;
    n = n + 1;
end

plot(T(1:N-1),Y1(1:N-1),T(1:N-1),Y2(1:N-1),'LineWidth',2);