function b = Beta(x1)
global by1;
global by2;
global bn;

by = by1/by2;

r1 = (2-by)*MyExp(bn,by1-by2,by2);
r2 = (by-1)*MyExp(bn,by1-2*by2,by2);


if abs(x1) > bn
    b = sig(x1,by1,by2);
else
    b = r1*x1+r2*sign(x1)*x1^2;
end

end