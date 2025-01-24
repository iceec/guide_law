function [dr,dq,dtheta_m,dtheta_t,dw,dz,Am]=Dynamic(r,q,theta_m,theta_t,z,w)
global Vm; global Vt; global impact_angle; global yimo; global At; global R; global Ca; global tf; global t;
global G; global Am_max; global ea0; global S_back; global dt; global beta; global alpha; global Hf; global Q;
global J;



v = Vt/Vm;


yita_m = theta_m - q;
yita_t = theta_t - q;

%微分方程
dr = Vt*cos(yita_t) - Vm*cos(yita_m);
dq = (Vt*sin(yita_t) - Vm*sin(yita_m))/r;

dtheta_t = At/Vt; %先打击静止目标

%建立方程

qd = theta_t - atan2(sin(impact_angle),cos(impact_angle)-v);
dqd = dtheta_t;


x1 = q;   x2 = dq;
xd1 = qd; xd2 = dqd; dxd2 = 0; % at_dot/vt

ea = [x1-xd1; x2-xd2; z];

Aa = [0, 1,       0;
      0, -2*dr/r, -(2*dr*xd2/r+dxd2)/z;
      0,  0,      -yimo];

Ba = [0; -cos(yita_m)/r; 0];

ha = [0; cos(yita_t)/r; 0] * At;

%求解Pss Ltf
M = Ba/R*Ba';
[Pss,~,~]=care(Aa,Ba,Ca'*Q*Ca,R);
Ltf = Ca'*Hf*Ca - Pss;




%求解p

Ar = Aa - M*Pss;

%用Ar和M求解Hss
Hss = lyap(Ar,-M);

%tf 和 t 需要进行一定的调整
Tao = (tf-t)*Ar;
Pe = expm(Tao')*Ltf / (eye(3) - Hss*Ltf + expm(Tao)*Hss*expm(Tao')*Ltf) *expm(Tao);
P = Pss + Pe;
Am_nom = -1/R*Ba'*P*ea;

%求解S S_back起始是3*1的0
S_back = S_back + (Aa - Ba/R*Ba'*P)*ea * dt;  

S = G*Ca*(ea - ea0) - G*Ca*S_back;

Am_disc = 1/(G*Ca*Ba)*(-alpha *sqrt(abs(S))*sign(S) +w); % 取了0.5

%w 和 z 的变化
dw = -beta*sign(S);
dz = -yimo *z;

Am = Am_nom + Am_disc;

if(Am > Am_max)
    Am  = Am_max * sign(Am);
end

dtheta_m = Am/Vm;

eya = [x1-xd1; x2-xd2;];
u = Am;

J = J + (eya'*Q*eya + u'*R*u)*dt*1/2;

end