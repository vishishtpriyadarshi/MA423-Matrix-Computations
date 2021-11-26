function A = condmat(n, kappa)
    X = randn(n, n);
    [U, ~] = qr(X);
    val = kappa .^ ((1:n) ./ (n-1));
    D = diag(val);
    A = U * D * U';
end

