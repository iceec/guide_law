function d = eso(r, dr, ym, yt, dq, am)
global z1;
global z2;
global dt;

w1 = 50;
w2 = 100;

e = z1 - dq;

dz1 = z2 / r - w1 * e - 2 * dr * z1 / r - cos(ym) / r * am;

dz2 = -r*w2 * fal(e);

z1 = z1 + dt * dz1;
z2 = z2 + dt * dz2;

d = z2 * (r / cos(yt)) / sin(ym) * sin(yt);


end