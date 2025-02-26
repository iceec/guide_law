function y = sgmf(s)
alpha = 1000;
if(abs(s) < 0.001)
    y = 2 * (1/(1 + exp(-alpha * s)) - 1/2);
else
    y = sign(s);
end

end