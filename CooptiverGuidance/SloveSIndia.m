function s = SloveSIndia(x1, x2, p1, p2, tc)

p = p2 / (2 * p1 * tc);

tmp1 = MyExp(x1,2*p1,p2);
tmp2 = 1 / tmp1;

s = x2 + p * x1 * exp(tmp1) * tmp2;
end