function [dz1,dz2] =  nleso(z1,z2,y)

a1 = 2;

a2 = 1;

yimo = 0.05;

alfa = 0.75;

dz1 = z2 + a1 * abs((y - z1) / yimo)^ alfa * sign(y - z1);

dz2 = a2/yimo * abs((y - z1) / yimo)^(2 * alfa -1)* sign(y - z1);


end