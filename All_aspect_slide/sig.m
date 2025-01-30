function y = sig(x, numer, don)

tmp = nthroot(abs(x)^numer, don);

y = tmp * sgmf(x);

end
