yita1 = 89/180 * pi; % 考虑用89代替90度
yita2 = -60/180 * pi;

h = 0.001;
T = 1000;

YITA1 = zeros(1,T);
YITA2 = zeros(1,T);
V = 0 : 0.001 : 1;

yimo_0 = 120/180 * pi;
N = 3;
M = 1;

n = 1;

while n < T

    YITA1(n) = yita1 * 180 / pi;
    YITA2(n) = yita2 * 180 / pi;

    dyita1 = nonlinear_analysis(V(n),M,N,yita1,yimo_0);
    dyita2 = linear_analysis(V(n),M,N,yita2,yimo_0);

    n = n + 1;

    yita1 = dyita1 * h + yita1;
    yita2 = yita2 + dyita2 * h;
end


figure(1)
plot(V(1:n),YITA1(1:n),V(1:n),YITA2(1:n),'LineWidth',2);