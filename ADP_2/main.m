x1 = 1;
x2 = 0.5;
h = 0.001;
N = 1000*20;
X1 = zeros(1,N);
X2 = zeros(1,N);


W = zeros(8,1);
n = 1;

while n <20 *1000

[dx1,dx2,W_dot] = dynamic(x1,x2,n * h,W);


x1 = x1 + dx1 *h;
x2 = x2 + dx2 *h;
W = W +W_dot *h;


X1(n) = x1;

X2(n) = x2;

n = n+1;
end

figure(1);


plot(X1(1:n-1),'LineWidth',2);