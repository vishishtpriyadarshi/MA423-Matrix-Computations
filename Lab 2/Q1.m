%% Question - 1

A = [10^(-20) 1; 1 1];

disp("(a) The factors L and U are:");

[L, U] = genp(A);
disp("L:");
disp(L);

disp("U:");
disp(U);

disp("A - LU = ");
disp(A - L * U);

b = [1 0]';
y = rowforward(L, b);
x = colbackward(U, y);

fprintf("(b) Computed solution for Ax = b using genp:\nx =\n");
disp(x);

x_correct = A\b;
fprintf("Exact solution for Ax = b:\nx =\n");
disp(x_correct);

fprintf("Difference of computed answer with the correct solution in the 2-norm = %f", norm(x - x_correct));
