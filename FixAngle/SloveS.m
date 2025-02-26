function s = SloveS(x1, x2)

global a1;
global u1;
global beta;
s = x2 + beta * sig(x1, a1*x1^2, 1+u1*x1^2);
end