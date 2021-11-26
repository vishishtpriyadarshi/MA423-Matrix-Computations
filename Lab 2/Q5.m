%% Question - 5

n = input("Enter size of matrix A:");
iter = input("Enter no of iterations:");

for i = 1 : iter
    fprintf("\n******** Iteration no - %d ********\n", i);
    X = randn(n);
    A = (X') * X;

    disp("Matrix is:");
    disp(A);

    disp("Cholesky factor using mychol:");
    disp(mychol(A));

    disp("Cholesky factor using chol:");
    disp(chol(A));

    fprintf("Norm difference (2-norm) = ");
    disp(norm(mychol(A) - chol(A)));
end