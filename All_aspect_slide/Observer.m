function d = Observer(r, dr, dq, yita_m, am)

global z1;
global z2;
global z3;
global dt;

l2 = 2;
l1 = 1.3;
l0 = 1.2;

u2 = 8;
u1 = 6;
u0 = 3;
L = 0.1;


v0 = -l2 * MyExp(L, 1, 3) * MyExp(abs(z1-dq), 2, 3) * sign(z1-dq) - u2 * (z1 - dq) + z2;
v1 = -l1 * MyExp(L, 1, 2) * MyExp(abs(z2-v0), 1, 2) * sign(z2-v0) - u1 * (z2 - v0) + z3;


dz0 = -2 * dr * dq / r - cos(yita_m) / r * am + v0;
dz1 = v1;
dz2 = -l0 * L * sign(z3-v1) - u0 * (z3 - v1);


z1 = z1 + dz0 * dt;
z2 = z2 + dz1 * dt;
z3 = z3 + dz2 * dt;

d = z2;


end