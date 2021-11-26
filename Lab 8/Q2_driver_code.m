n = [5, 7, 10, 12];
[data_1, data_2, data_3] = deal([]);

for val = n
    A = hilb(val);
    R1 = mysqrt1(A);
    R2 = mysqrt2(A);
    R3 = sqrtm(A);
    
    data_1(end + 1) = norm(A-R1 * R1)/norm(A);
    data_2(end + 1) = norm(A-R2 * R2)/norm(A);
    data_3(end + 1) = norm(A-R3 * R3)/norm(A);
end

plot(n, data_1);
hold on;
plot(n, data_2);
plot(n, data_3);
hold off;

xlabel('n');
ylabel('norm(A - R*R)/norm(A)');
title('Error vs n');
legend('mysqrt1', 'mysqrt2', 'sqrtm');