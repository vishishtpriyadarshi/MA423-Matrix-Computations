%% Question - 2

num = input("Enter number of iterations: ");
n = input("Enter size of matrix A:");
[norm1, norm2, norm3, norm4] = deal([]);

for i = 1 : num
    A = randn(n);
    [L, U, p] = gepp(A);
    [L_matlab, U_matlab, p_matlab] = lu(A);
    
    fprintf("****  Iteration - %d  ****\n", i);
    disp("A =");
    disp(A);
    
    disp("LU using gepp:");
    disp("L = ");
    disp(L);
    disp("U = ");
    disp(U);
    
    norm1(end + 1) = norm(A(p, :) - L*U);
    
    disp("LU using Matlab function lu:");
    disp("L = ");
    disp(L_matlab);
    disp("U = ");
    disp(U_matlab);
    
    
    norm2(end + 1) = norm(L - L_matlab);
    norm3(end + 1) = norm(U - U_matlab);
    
    I = eye(n);
    norm4(end + 1) = norm(I(p, :) - p_matlab);
end

T = table((1 : num)', norm1', norm2', norm3', norm4');
T.Properties.VariableNames = {'SI No.' '|| A(p, :) - LU ||₂' '|| L - L_matlab ||₂' '|| U - U_matlab ||₂' '|| p - p_matlab ||₂'};
disp(T);