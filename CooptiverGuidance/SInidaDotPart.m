function a = SInidaDotPart(x1, x2, p1, p2, tc)
p = p1 / p2;
part1 = 1 / (2 * p * tc);


tmp1 = MyExp(x1, 2*p1, p2);

tmp2 = 1 / tmp1;

part2 = exp(tmp1) * tmp2 + 2 * p * exp(tmp1-1) * tmp1 - 2 * p * exp(tmp1) * tmp2;

a = part1 * part2 * x2;
end