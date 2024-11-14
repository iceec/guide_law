function y = dt_active(x1,x2,tf,t)


T = tf - t;

y1 = x1^2 * exp(-0.1 * T) * 0.1;

y2 = x2^2 * exp(-0.1 * T) * 0.1;

y3 = x1*x2*(-1);

y4 = x1^4 * exp(-0.1 * T) * 0.1;

y5 = x2^2 * exp(-0.1 * T) * 0.1;

y6 = 0;

y7 = 0;

y8 = 0;


y = [y1,y2,y3,y4,y5,y6,y7,y8]';

end