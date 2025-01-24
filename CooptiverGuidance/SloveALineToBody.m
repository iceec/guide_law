function [xb, yb, zb] = SloveALineToBody(xq, yq, zq, q_theta, q_yita, b_theta, b_yita)


R1 = [cos(q_yita) * cos(q_theta), -sin(q_theta) * cos(q_yita), sin(q_yita); ...
    sin(q_theta), cos(q_theta), 0; ...
    -cos(q_theta) * sin(q_yita), sin(q_theta) * sin(q_yita), cos(q_yita)];


R2 = [cos(b_theta) * cos(b_yita), sin(b_theta), -cos(b_theta) * sin(b_yita); ...
    -sin(b_theta) * cos(b_yita), cos(b_theta), sin(b_theta) * sin(b_yita); ...
    sin(b_yita), 0, cos(b_yita);];


V = [xq; yq; zq];

T = R1 * R2 * V;

xb = T(1);
yb = T(2);
zb = T(3);
end