function [U, d, V] = mysvd(A)
    [W, R] = polard2(A);
    
    [V, d] = eig(R, 'vector');
    [d, I] = sort(d, 'descend');
    d = diag(d);
    
    V = V(:, I);
    U = W * V;
end