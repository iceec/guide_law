function b=Beta_dot(x1,x2)
global y1;
global y2;
global bn;
global a1;
global a2;



y = y1/y2;

if abs(x1) > bn
    b = y * MyExp(abs(x1),y1-y2,y2)*x2;
else
    b = a1*x2+2*a2*x1*x2*sign(x1);
end

end