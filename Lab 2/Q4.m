%% Question - 4

n = input("Enter size of matrix A:");
A = randn(n);
d = mydet(A);

disp("Matrix is:");
disp(A);

fprintf("Determinant using mydet = %f\n", d);
fprintf("Determinant using inbuilt det = %f\n", det(A));
fprintf("Absolute difference = ")
disp(abs(d - det(A)));