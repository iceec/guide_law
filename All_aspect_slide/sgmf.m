function y = sgmf(s)
alpha = 2000;
if(abs(s) < 0.0005)
    y = 2 * (1/(1 + exp(-alpha * s)) - 1/2);
else
    y = sign(s);
end

end