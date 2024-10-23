function [dz1,dz2] = leso(z1,z2,y)

tmp = y - z1;


yimo = 0.05;

a = 0.75;

dz1 = z2 + 2 * abs(tmp / yimo)^(a) *sign(tmp);

dz2 = 1/yimo * abs(tmp / yimo)^(2 * a -1) *sign(tmp); 

end