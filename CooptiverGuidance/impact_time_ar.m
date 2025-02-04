function y = impact_time_ar(i)
global Tgo;
global missle_graph

alp1 = 1;
alp2 = 2;

alpr = alp1 / alp2;
tc = 25;
lamda = 2;
n = 4;
kr = 20;


src = Tgo(i);
src_vector = [src, src, src, src];
other_vector = missle_graph(i, :);

error = src_vector - Tgo;

e = error .* other_vector;

E = -(e(1) + e(2) + e(3) + e(4));

p1 = pi / (2 * lamda * tc * alpr);

p2 = MyExp(n, alp1, 2*alp2) / kr * sig(E, alp2-alp1, alp2);

p3 = kr * sig(E, alp2+alp1, alp2);

y = p1 * (p2 + p3);

end