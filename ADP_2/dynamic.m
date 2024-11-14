function [dx1,dx2,W_dot]=dynamic(x1,x2,tgo,W)
tf = 20;
R1 = 20;
R2 = 2;
lamda = 1; % abs(u) <= 1

a1 = 0.2;


gx = [0,cos(2*x1) + 2]';
kx = [0,sin(4*x1) + 2]';

%求u 和 v 
D = 1/(2*lamda) * (1/R1) * gx' *dx_active(x1,x2,tf,tgo)' * W;
u = -lamda * tanh(D);
v = 1/2 *(1/R2) * kx' * dx_active(x1,x2,tf,tgo)' * W;


um = u + sin(tgo)^5 * cos(tgo) + sin(tgo)^5 *cos(0.2 * tgo);
if abs(u) >=1 
    um = sign(u);
end
dx1 = -x1 +x2;
dx2 = -0.5 * x1 - 0.5 * x2 * (1 - (cos(2*x1) + 2)^2) + (cos(2*x1) + 2) * um + (sin(4*x1) + 2) * v;
dx = [dx1,dx2]';

t = tf - tgo;  % 弢

Qxt = 10 * (x1^2 + x2^2 + t^2); 


integration_u = 2 * lamda * atanh(u/lamda)' * R1 * u + lamda^2 * R1 * log(1 - (u/lamda)^2);

ec = W' * dt_active(x1,x2,tf,tgo) + W' * dx_active(x1,x2,tf,tgo) * dx +Qxt + 2 * integration_u - v' * R2 * v;  

% etf 和 xtf的变形 

beta1 = dt_active(x1,x2,tf,tgo) + dx_active(x1,x2,tf,tgo) * dx;

Beta1 = beta1 / (1 + beta1' * beta1);

ms = 1 + beta1' * beta1;

K = dx_active(x1,x2,tf,tgo) * kx * (1/R2) * kx' * dx_active(x1,x2,tf,tgo)';

Y1 = 50*[1,1,1,1,1,1,1,1]';
Y2 = diag(ones(1,8)) * 0.01;



item = 1;

Jx = [x1,x2]';

if Jx'*dx <0
    item = 0;
end

W_dot = -a1 * Beta1/ms * ec ...
        + 1/2 * a1 * item * dx_active(x1,x2,tf,tgo) * gx ...
       *(1/R1)*(1-tanh(D)^2)*R1*gx'*Jx ...
       -1/2 *a1 *item * dx_active(x1,x2,tf,tgo)*kx * (1/R2) *kx'*Jx... 
        + a1 * ( dx_active(x1,x2,tf,tgo) *gx * lamda * ( tanh(D) - sign(D) ) *Beta1'/ms *W - 1/4 * Beta1/ms *W' *K *W -(Y2 - Y1*Beta1')*W);








end