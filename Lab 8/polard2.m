function [W, R] = polard2(A)
    R = mysqrt1(A * A');
    W = R \ A;
end