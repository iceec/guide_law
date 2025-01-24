function y = SloveDw(t, ts)

global n1;
global n2;
global w0;
global woo;


p1 = -n1 / n2 * f(ts, n1, n2) * f(t, n1-n2, n2) * (w0 - woo) * exp(SloveWT(t, ts));

p2 = (f(t, n1, n2) - f(ts, n1, n2))^2;

if t < ts
    y = p1 / p2;
else
    y = 0;
end