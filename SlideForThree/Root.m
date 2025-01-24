function out = Root(a,x,y)
% a^(x/y) 直接这么写会产生复数

tmp = nthroot(a,y);
out = tmp^x;

end