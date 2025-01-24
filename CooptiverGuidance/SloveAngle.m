function [theta, yita] = SloveAngle(xr, yr, zr)

theta = atan(yr/sqrt(xr^2+zr^2));

if xr > 0
    yita = -atan(zr/xr);
elseif xr < 0 && zr < 0
    yita = pi - atan(zr/xr);
else
    yita = -pi - atan(zr/xr);

end