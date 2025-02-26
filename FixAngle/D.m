function y = D(x1, x2)

global beta;
global a1;
global u1;

t1 = (beta * a1 * abs(x1) * x2) / (1 + u1 * x1^2);
t2 = 2 * log(abs(x1)) / (1 + u1 * x1^2) + 1;


numer = a1 * x1^2;
don = 1 + u1 * x1^2;

t3 = nthroot(abs(x1)^numer, don);

y = t1 * t2 * t3;


end