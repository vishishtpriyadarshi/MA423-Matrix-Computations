[n, sz] = deal(15, 20);
[data_1, data_2, data_3, data_4] = deal([]);

rng(4);
matrices = randn(sz, sz, n);

for j = 1 : n
   mat = matrices(:, :, j);
   [U, d, V] = svd(mat);
   d = sort(diag(d), 'descend');
   d = (d / d(end)) * (10^(-j + 6));
   d = diag(d);
   A = U * d * V';
   
   [U1, d1, V1] = mysvd(A);
   [U2, d2, V2] = svd(A);
   
   data_1(end + 1) = norm(U1' * U1 - eye(sz));
   data_2(end + 1) = norm(U2' * U2 - eye(sz));
   data_3(end + 1) = norm(V1' * V1 - eye(sz));
   data_4(end + 1) = norm(V2' * V2 - eye(sz));
end

figure();
plot((1:n), data_1);
hold on;
plot((1:n), data_2);
hold off;

xlabel('j');
ylabel("norm(U*U - I)");
title("Plot for norm(U*U - I)");
legend('mysvd', 'svd');


figure();
plot((1:n), data_3);
hold on;
plot((1:n), data_4);
hold off;

xlabel('j');
ylabel("norm(V*V - I)");
title("Plot for norm(V*V - I)");
legend('mysvd', 'svd');