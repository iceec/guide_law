function [x2,y2,z2] = ChangeIneToRos(x1,y1,z1,theta,yita)

R1 = [cos(theta) * cos(yita), -sin(theta) * cos(yita), sin(yita); ...
    sin(theta), cos(theta), 0; ...
    -cos(theta) * sin(yita), sin(theta) * sin(yita), cos(yita)];



tmp = [x1;y1;z1];


result = R1' * tmp;

x2 = result(1);
y2 = result(2);
z2 = result(3);

end