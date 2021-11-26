function R1 = mysqrt1(A)
    [X, D] = eig(A);
    R1 = (X * sqrt(D)) / X;
end