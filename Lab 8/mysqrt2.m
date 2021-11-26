function R2 = mysqrt2(A)
    R = chol(A);
    [U, d, V] = svd(R);
    R2 = V * d * V'; 
end

