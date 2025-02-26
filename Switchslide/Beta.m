function b = Beta(x1)
global y1;
global y2;
global bn;
global a1;
global a2;




if abs(x1) > bn
    b = sig(x1,y1,y2);
else
    b = a1*x1+a2*sign(x1)*x1^2;
end

end