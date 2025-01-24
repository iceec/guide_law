function y = SloveWT(t, ts)

global n1;
global n2;

% n1 / n2 = 1.5

p1 = f(t,n1,n2);

p2 = f(ts,n1,n2);

y = p1 / (p1 - p2);


end