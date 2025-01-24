function [vx,vy,vz]=SloveInitV(v,theta,yita)

vx = v*cos(theta)*cos(yita);
vy = v*sin(theta);
vz = -v*cos(theta)*sin(yita);

end