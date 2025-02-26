time = 0 : 0.001 : 20;
N = 1000*20;
n=1;

Y =zeros(1,N);

w0 = 10;
w00 = 0.5;
k = 1;
t = 0;
dt = 0.001;
while n < N

    y = (wo-woo)*exp(-k*t)+woo;

    t = dt +t;
    Y(n) = y;
    n = n+1;

end


