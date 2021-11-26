%% Question - 5

A = [1 3 1; 2 9 4; 3 4 7]
[L, U] = genp(A);

disp("LU factorization for matrix A -");
disp("L:");
disp(L);

disp("U:");
disp(U);


disp("LU:");
disp(L*U);