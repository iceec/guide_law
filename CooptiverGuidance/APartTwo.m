function a = APartTwo(s,p1,p2,tc,k)

tmp1 = MyExp(s,2*p1,p2);
tmp2 = 1 / tmp1;

p = p1/p2;

part1 = s * exp(tmp1)*tmp2 / (2 * p * tc);

part2 = k * s / abs(s);

a = part1 + part2;

end