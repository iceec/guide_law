time = 0:0.001:20;
N = 1000 * 20;
n = 1;
ts = 2;
l1 = 0.1;
l2 = 1;
l3 = 5;
Y1 = zeros(1, N);
NY1 = zeros(1, N);
Y2 = zeros(1, N);
NY2 = zeros(1, N);
Y3 = zeros(1, N);
NY3 = zeros(1, N);
w0 = 10;
w00 = 0.5;
k = 1;
t = 0;
dt = 0.001;
while n < N
    if t < ts
        y1 = (w0 - woo) * exp(-l1*t/(ts - t)) + woo;
    else
        y1 = woo;
    end

    if t < ts
        y2 = (w0 - woo) * exp(-l2*t/(ts - t)) + woo;
    else
        y2 = woo;
    end

    if t < ts
        y3 = (w0 - woo) * exp(-l3*t/(ts - t)) + woo;
    else
        y3 = woo;
    end

    t = dt + t;
    Y1(n) = y1;
    NY1(n) = -y1;

    Y2(n) = y2;
    NY2(n) = -y2;

    Y3(n) = y3;
    NY3(n) = -y3;
    n = n + 1;

end

tsubplot(1, 1, 1, 'tight');
plot(time(1:n-1), Y1(1:n-1), '-b', time(1:n-1), Y2(1:n-1), '-.k', time(1:n-1), Y3(1:n-1), '--m', time(1:n-1), NY1(1:n-1), '-b', ...
    time(1:n-1), NY2(1:n-1), '-.k', ...
    time(1:n-1), NY3(1:n-1), '--m', 'LineWidth', 2);
txt = ylabel('\pm \omega');
y = xlabel('t/s');
hg1 = legend({'\fontname{Times new roman}\lambda=0.1', ...
    '\fontname{Times new roman}\lambda=1', '\fontname{Times new roman}\lambda=5'}, 'Location', 'best');
