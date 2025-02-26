function y = SloveWT(t, ts)

global n1;
global n2;

% p1 = f(t,n1,n2);
% 
% p2 = f(ts,n1,n2);
% 
% y = p1 / (p1 - p2);

global l;

p1 = ts-t;
p2 = -l*t;

y = p2/p1;


end