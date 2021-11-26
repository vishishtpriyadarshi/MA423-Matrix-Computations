function [Q, R] = reflectqr(A)
    [n, m] = size(A);
    gamma_val = zeros(n, 1);
    Q = eye(n);
    
    iter = m;
    if m == n
        iter = m - 1;
    end
    
    for k = 1 : iter
       [u, gamma, tau] = reflect(A(k : n, k));
        A(k : n, k+1 : m) = appreflect(u, gamma, A(k : n, k+1 : m));
        A(k, k) = -tau;
        
        Q_k = eye(n);
        Q_k(k:n, k:n) = eye(n-k+1) - gamma * (u * u');
        Q = Q * Q_k;
        
        gamma_val(k) = gamma;
    end
    
    R = triu(A);
    Q = Q(:, 1 : m);
    R = R(1 : m, :);
end

