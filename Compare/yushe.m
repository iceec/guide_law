time = 0 : 0.001 : 20;
N = 1000*20;
n=1;

Y =zeros(1,N);
NY =zeros(1,N);
w0 = 10;
w00 = 0.5;
k = 1;
t = 0;
dt = 0.001;
while n < N

    y = (w0-woo)*exp(-k*t)+woo;

    t = dt +t;
    Y(n) = y;
    NY(n)=-y;
    n = n+1;

end

tsubplot(1,1,1,'tight');
plot(time(1:n-1),Y(1:n-1),'-k',time(1:n-1),NY(1:n-1),'-k','LineWidth',2);


