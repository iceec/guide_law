xm1 = -1000;
ym1 = 0;
zm1 = 0;
vm1 = 600;
theta_m1 = 60 / 180 * pi;
yita_m1 = 90 / 180 * pi;

xm2 = 1000;
ym2 = 0;
zm2 = 0;
vm2 = 600;
theta_m2 = 60 / 180 * pi;
yita_m2 = 90 / 180 * pi;

xm3 = 4000;
ym3 = 0;
zm3 = 0;
vm3 = 600;
theta_m3 = 60 / 180 * pi;
yita_m3 = 90 / 180 * pi;

xt = 8000;
yt = 10000;
zt = -15000;
vt = 200;
theta_t = 0 / 180 * pi;
yita_t = 90 / 180 * pi;

[vxm1,vym1,vzm1] = SloveInitV(vm1,theta_m1,yita_m1);
[vxm2,vym2,vzm2] = SloveInitV(vm2,theta_m2,yita_m2);
[vxm3,vym3,vzm3] = SloveInitV(vm3,theta_m3,yita_m3);
[vtx,vty,vtz] = SloveInitV(vt,theta_t,yita_t);


