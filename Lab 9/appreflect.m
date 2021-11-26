function B = appreflect(u, gamma, A)
    v = gamma * u;
    w = u' * A;
    C = v * w;
    B = A - C;
end