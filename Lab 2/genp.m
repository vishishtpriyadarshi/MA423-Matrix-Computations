function [L, U] = genp(A)
    % This function is to be called as [L, U] = genp(A).
    % It finds an LU factorization A = LU of an n-by-n matrix A by
    % performing Gaussian Elimination with no pivoting (GENP).
    
    [n, ~] = size(A);
    for k = 1: n - 1
        if A(k, k) ~= 0
            A(k + 1: n, k) = A(k + 1: n, k) / A(k, k);
        else
            error("Zero pivot encountered");
        end
        
        A(k + 1: n, k + 1: n) = A(k + 1: n, k + 1: n) - A(k + 1: n, k) * A(k, k + 1: n);
    end
    
    L = eye(n) + tril(A, -1);
    U = triu(A);
end