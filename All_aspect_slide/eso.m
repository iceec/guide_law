function y=eso(r, dr, delt_m, delt_t,q, dq, am)
global z1;
global z2;
global dt;

w1 = 50;
w2 = 100;

e = z1 - dq;

dz1 = z2  / r - w1 * e - 2 * dr * z1 / r - cos(delt_m-q) / r * am;

dz2 = -r  * w2 * fal(e);

z1 = z1 + dz1 * dt;
z2 = z2 + dz2 * dt;

y = z2;


end