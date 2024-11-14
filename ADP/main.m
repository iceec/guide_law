clear;

%仿真时间大差不差但是到最后会发散导致根本制导不了 需要解决
xm = 0; ym =0; vm = 600; delt_m = 30 / 180 * pi;

xt = 2500; yt = 0; vt = 400;  delt_t = 125/180 * pi;

q = atan2(yt-ym,xt-xm);

W = [50;50;50;50]; % 初始的W

r = sqrt((xm-xt)^2 + (ym - yt)^2);

h = 0.001;
N = 1000 * 10;

% 存储信息用的
R = zeros(1,N);
Q = zeros(1,N);
XM = zeros(1,N);
YM = zeros(1,N);
XT = zeros(1,N);
YT = zeros(1,N);
AM  =zeros(1,N);
AT = zeros(1,N);

n = 1;
while r > 0 && n <=N
    [dr,dq,ddelt_m,ddelt_t,am,at,dW]=dynamic(vm,vt,r,q,delt_m,delt_t,W,n);

    
    r = r + dr * h;
    R(n) = r;
    AM(n) = am;
    q = q + dq *h;
    W = W + dW *h;
    n = n+1;

   


end


plot(AM(1:n-1));
