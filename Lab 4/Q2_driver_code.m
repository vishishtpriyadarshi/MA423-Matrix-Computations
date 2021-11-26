p = [1 -18 144 -672 2016 -4032 5376 -4608 2304 -512];

a = [1.95, 1.96, 1.97, 1.98, 1.99, 1.96];
b = [2.05, 2.04, 2.03, 2.02, 2.01, 1.99];

for i = 1 : length(a)
    x = bisect(p, a(i), b(i), 1e-8);
    fprintf("Computed Root for root in [%f, %f] = ", a(i), b(i));
    disp(x);
end