format long e
[C_1, C_2, C_inf] = deal([]);
N = 2:2:16;

for n = N
    H = hilb(n); 
    C_1 = [C_1; cond(H, 1)];
    C_2 = [C_2; cond(H, 2)];
    C_inf = [C_inf; cond(H, Inf)];
end

figure();
semilogy(N, C_1);
xlabel("N");
ylabel("Condition Number on log-scale");
title("Condition Number vs N with norm-1");

figure();
semilogy(N, C_2);
xlabel("N");
ylabel("Condition Number on log-scale");
title("Condition Number vs N with norm-2");

figure();
semilogy(N, C_inf);
xlabel("N");
ylabel("Condition Number on log-scale");
title("Condition Number vs N with infinity norm");