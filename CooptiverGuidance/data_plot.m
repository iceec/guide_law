figure(3);

plot3(TPOS(1, 1:n-1), TPOS(2, 1:n-1), TPOS(3, 1:n-1), 'LineWidth', 2);
hold on;
plot3(M1POS(1, 1:n-1), M1POS(2, 1:n-1), M1POS(3, 1:n-1),'LineWidth', 2);
hold on;
plot3(M2POS(1, 1:n-1), M2POS(2, 1:n-1), M2POS(3, 1:n-1),'LineWidth', 2);
hold on;
plot3(M3POS(1, 1:n-1), M3POS(2, 1:n-1), M3POS(3, 1:n-1),'LineWidth', 2);
hold on;
plot3(M4POS(1, 1:n-1), M4POS(2, 1:n-1), M4POS(3, 1:n-1),'LineWidth', 2);
grid on;