function SloveTgo(xt,yt,zt,xm,ym,zm,vtx,vty,vtz,vmx,vmy,vmz,i)
global Tgo;

xr = xt - xm;
yr = yt - ym;
zr = zt - zm;


vx = vtx - vmx;
vy = vty - vmy;
vz = vtz - vmz;

r = sqrt(xr^2+yr^2+zr^2);
dr = 1 / r * (xr * vx + yr * vy + zr * vz);

tgo = -r/dr;

Tgo(i) = tgo;


end