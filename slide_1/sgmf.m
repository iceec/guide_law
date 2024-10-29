function y = sgmf(s)
alpha = 20;
if(abs(s) < 0.5)
    y = 2 * (1/(1 + exp(-alpha * s)) - 1/2);
else
    y = sign(s);
end

end