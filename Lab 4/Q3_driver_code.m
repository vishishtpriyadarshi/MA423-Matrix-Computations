x_min = 1.93;
x_max = 2.08;
x = linspace(x_min, x_max, 151);

p = [1 -18 144 -672 2016 -4032 5376 -4608 2304 -512];
y_horner = Horner(p, x);

y_direct = (x - 2) .^ 9;

plot(x, y_horner, "blue");
hold on;
plot(x, y_direct, "red");
hold off;

xlabel("x");
ylabel("p(x)");
title("Computation of polynomials using different methods");
legend(["Horner method", "Direct formula"]);