%% Question - 3

num = input("Enter number of iterations: ");
n = input("Enter size of matrix A:");
norm_arr = [];

for i = 1 : num
    A = randn(n);
    b = randn(n, 1);
    
    x_gepp = geppsolve(A, b);
    x_matlab = A\b;
    
    fprintf("****  Iteration - %d  ****\n", i);
    disp("A =");
    disp(A);
    
    disp("b = ");
    disp(b);
    
    disp("x using geppsolve =");
    disp(x_gepp);
    
    disp("x using MATLAb gepp = ");
    disp(x_matlab);
    
    norm_arr(end + 1) = norm(x_gepp - x_matlab);
end

T = table((1 : num)', norm_arr');
T.Properties.VariableNames = {'SI No.' '|| x_gepp - x_matlab ||₂'};
disp(T);