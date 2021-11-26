function [W, R] = polard1(A)
    [m, n] = size(A);
    
    if m >= n    
        [U, d, V] = svd(A, 0);
        R = V * d * V';
        W = U * V';
    else
        [U, d, V] = svd(A, "econ");
        R = U * d * U';
        W = U * V';
    end
end