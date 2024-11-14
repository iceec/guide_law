function y=dx_active(x1,x2,tf,t)


T = tf - t;


y11 = 2 * x1 * exp(-0.1 * T);
y12 = 0 ;

y21 = 0;
y22 = 2 * x2 * exp(-0.1 * T);

y31 = x2 * T;
y32 = x1 * T;

y41 = 4 * x1^3 * exp(-0.1 * T);
y42 = 0;

y51 = 0;
y52 = 2 * x2 * exp(-0.1 * T);

y61 = 3 * x1^2 * x2;
y62 = x1^3;

y71 = 2 * x1 * x2;
y72 = x1^2;

y81 = x2^2;
y82 = 2 * x1 * x2;


% 8*2

y = [y11 , y12;
     y21 , y22;
     y31 , y32;
     y41 , y42;
     y51 , y52;
     y61 , y62;
     y71 , y72;
     y81 , y82;];

end