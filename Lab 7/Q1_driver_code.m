format long e;

t = linspace(-5, 6, 23)';
b = sin(pi * t / 5) + t / 5;
A = t .^ (0: 1: 17);


p1 = A \ b;
r1_norm = norm(A * p1 - b);
disp("**********  Method 1 **********");
fprintf("Condition number of coeff matrix \t=");
disp(cond(A));
fprintf("r1 norm \t\t\t\t\t\t\t=");
disp(r1_norm);
fprintf("\n\n");


B = mychol(A' * A);
y = rowforward(B', A' * b);
p2 = colbackward(B, y);
r2_norm = norm(A * p2 - b);
disp("**********  Method 2  **********");
fprintf("Condition number of coeff matrix \t=");
disp(cond(A' * A));
fprintf("r2 norm \t\t\t\t\t\t\t=");
disp(r2_norm);
fprintf("\n\n");


A_new = [eye(23) A; A' zeros(18)];
b_new = [b; zeros(18, 1)];
x = A_new \ b_new;
p3 = x(24 : end);
r3_norm = norm(A * p3 - b);
disp("**********  Method 3  **********");
fprintf("Condition number of coeff matrix \t=");
disp(cond(A_new));
fprintf("r3 norm \t\t\t\t\t\t\t=");
disp(r3_norm);