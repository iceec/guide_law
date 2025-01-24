function [z1_dot,z2_dot] = eso(z1,z2,r,dr,delt_m,q,dq,am) 


    w1 = 50;
    w2 = 100;

    e =  z1 - dq;

    z1_dot = z2/r - w1*e - 2 *dr* z1 / r - cos(delt_m - q)/r * am;

    z2_dot = - r*w2 * fal(e);


end