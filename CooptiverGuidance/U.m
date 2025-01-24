function u = U(i)

global Tgo;

global missle_graph

global p1;
global p2;
global q1;
global q2;
global ar;
global betar;


src = Tgo(i);
src_vector = [src, src, src, src];
other_vector = missle_graph(i, :);

error = src_vector - Tgo;

e = error .* other_vector;

E = e(1) + e(2) + e(3) + e(4);

u = ar * sig(E, p1, p2) + betar * sig(E, q1, q2);


end