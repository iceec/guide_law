function y = sgmf(s)
a = 20;
y = 2 *(1/(1 + exp(-a*s)) - 1/2);
end
