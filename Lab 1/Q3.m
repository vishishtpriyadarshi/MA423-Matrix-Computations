%% Question - 3

m = (200: 50: 1150);
time1 = (1: 20);
time2 = (1: 20);

for i = 1: 20
    A = rand(i);
    b = rand(i, 1);
    
    tic;
    x = A\b;
    time1(i) = toc;
    
    tic;
    x = inv(A) * b;
    time2(i) = toc;
end

semilogx(m, time1, m, time2);

title("Time to solve system of eqns Ax = b")
legend("GEPP", "Using Inverse");
xlabel("Size of matrix");
ylabel("Time (t)");
