function y = W(b)
seta1 = 0.001;
seta2 = 0.01;
tmp = abs(b);

if tmp < seta1
    y = 0;
elseif tmp >= seta1 && tmp <= seta2
    y = (tmp - seta1) / (seta2 - seta1);
else
    y = 1;
end