function d = ObseverAndReturnDis(r, dr, dq, ym, yt, am)

k11 = 30;
k12 = 30;
s111 = 4;
s112 = 5;
s121 = 6;
s122 = 5;
% s11 -> 0.8
% s12 -> 1.2


k21 = 260;
k22 = 260;
s211 = 3;
s212 = 5;
s221 = 7;
s222 = 5;
% s21 = 2 * 0.8 - 1 = 0.6
% s22 = 2 * 1.2 - 1 = 1.4
k31 = 1100;
k32 = 1100;
s311 = 2;
s312 = 5;
s321 = 8;
s322 = 5;
% s31 = 3 * 0.8 - 2 = 0.4
% s32 = 3 * 1.2 - 2 = 1.6

nr = 60;


global z1;
global z2;
global z3;
global dt;

e = z1 - dq;

dz1 = z2 / r - 2 * dr * dq / r - am * cos(ym) / r - k11 * sig(e, s111, s112) - k12 * sig(e, s121, s122);

dz2 = z3 - k21 * sig(e, s211, s212) - k22 * sig(e, s221, s222);

dz3 = -k31 * sig(e, s311, s312) - k32 * sig(e, s321, s322) - nr * sign(e);

z1 = z1 + dz1 * dt;
z2 = z2 + dz2 * dt;
z3 = z3 + dz3 * dt;

d = z2 *(r / cos(yt)) *sin(yt) / sin(ym);

end