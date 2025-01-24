function [xm,ym,zm]=SloveMissPos(r,theta,yita)

global xt;
global yt;
global zt;


rx = r *cos(theta)*cos(yita);

ry = r*sin(theta);

rz = r*cos(theta)*sin(yita);


xm = xt - rx;
ym = yt - ry;
zm = zt - rz;

end