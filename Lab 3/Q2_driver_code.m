format long e
N = 8:2:12;
    
[cond_arr, norm1, norm2, norm3] = deal([]);
for n = N
    H = hilb(n);
    HI = invhilb(n);
    x = rand(n,1);
    
    % save(['Q2_workspace_x_' num2str(n) '.mat'], 'x');
    
    b = H * x;
    x1 = H \ b;
    x2 = HI*b;
    x3 = geppsolve(H, b);

    fprintf("\n*********** For n = %d ***********\n", n);
    fprintf("x = \n");
    disp(x);

    fprintf("x1 = \n");
    disp(x1);

    fprintf("x2 = \n");
    disp(x2);

    fprintf("x3 = \n");
    disp(x3);

    cond_arr = [cond_arr; cond(H)];
    norm1 = [norm1; norm(x-x1)/norm(x)];
    norm2 = [norm2; norm(x-x2)/norm(x)];
    norm3 = [norm3; norm(x-x3)/norm(x)];
end

T = table(N', cond_arr, norm1, norm2, norm3);
T.Properties.VariableNames = {'n', 'cond(H)', 'norm(x-x1)/norm(x)', 'norm(x-x2)/norm(x)', 'norm(x-x3)/norm(x)'};
disp(T);