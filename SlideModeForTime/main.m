global mth;
global tth;
global r;
global q;
global VT;
global VM;
global at;
global Td;
global t;
global K3;
global AM_MAX;

r = 10000;
q = 0 / 180 * pi;
mth = 0 / 180 * pi;
tth = 90 / 180 * pi;
AM_MAX = 400;

VM = 500;
VT = 400;

t = 0;
at = 20;
Td = 50;

N = 70 * 1000;
dt = 0.001;
n  = 1;


AM = zeros(1,N);
TGO = zeros(1,N);

while r > 1 && n <= N
    K3 = 0.003 * r;
    [dr, dq, dmth, dtth,am,tgo] = Dynamic();
    AM(n) = am;
    TGO(n) = tgo;
    r = r + dr * dt;
    q = q + dq * dt;
    mth = mth + dmth * dt;
    tth = tth + dtth * dt;
    t = t + dt;
    n = n + 1;

    if mod(n,1000) == 0
        disp(n); 
    end
    
end




