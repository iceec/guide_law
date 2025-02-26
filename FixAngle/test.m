% 定义矩阵 A1 和 A2
k1 = 0.04; k2 = 0.04; 
k_bar1 = k1; k_bar2 = k2;
p01 = 3;
p02 = 5;
p0 = p01/p02;
q0 = 6/5;


A1 = [0 1; -k1 -k2];
Q1 = eye(2);
P1 = lyap(A1', Q1); % 解 P1*A1 + A1'*P1 = -Q1

% 同理求解 P2

A2 = [0 1; -k_bar1 -k_bar2];
Q2 = eye(2);
P2 = lyap(A2', Q2);

lambda_max_P1 = max(eig(P1));
lambda_max_P2 = max(eig(P2));
lambda_min_P2 = min(eig(P2));

mu = 1 / lambda_max_P1;
mu_bar = 1 / lambda_max_P2;

rho_bar = (q0-1)/q0;
rho = (1-p0)/p0;


lambda_min_P2 = min(eig(P2));
t1 = (lambda_max_P1 / (mu * rho));
t2 =  1 / (mu_bar * rho_bar * MyExp(lambda_min_P2,p02-p01,p01));

t = t1 + t2;