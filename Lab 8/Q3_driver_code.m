[n, sz] = deal(15, 20);
[data_1, data_2] = deal([]);

rng(9);
matrices = randn(sz, sz, n);

for j = 1 : n
   mat = matrices(:, :, j);
   [U, d, V] = svd(mat);
   d = sort(diag(d), 'descend');
   d = (d / d(end)) * (10^(-j + 6));
   d = diag(d);
   A = U * d * V';
   
   [W, R] = polard1(A);
   [X, T] = polard2(A);
   
   data_1(end + 1) = norm(W' * W - eye(sz));
   data_2(end + 1) = norm(X' * X - eye(sz));
end

plot((1:n), data_1);
hold on;
plot((1:n), data_2);
hold off;

xlabel('n');
ylabel("norm(W*W - I)");
legend('polard1', 'polard2');