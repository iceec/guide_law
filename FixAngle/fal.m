function y = fal(e)

yimo = 0.01;

t = 0.5;

if abs(e) > yimo
    y = abs(e)^t * sign(e);
else
    y = e / yimo^t;

end