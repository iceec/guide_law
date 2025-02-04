function b=Beta_dot(x1,x2)


global by1;
global by2;
global bn;

by = by1/by2;

r1 = (2-by)*MyExp(bn,by1-by2,by2);
r2 = (by-1)*MyExp(bn,by1-2*by2,by2);


if abs(x1) > bn
    b = by * MyExp(abs(x1),by1-by2,by2)*x2;
else
    b = r1*x2 + r2*2*x1*x2*sign(x1);
end

end