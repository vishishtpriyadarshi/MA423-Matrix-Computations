load clown.mat;
[U, S, V] = svd(X);
k = (1:10:200);

[relative_error, compression_ratio] = deal([]);
for i = k
    compression_ratio(end + 1) = 520 * i / 64000;
    relative_error(end + 1) = S(i+1, i+1) / S(1, 1);
end

T = [k', compression_ratio', relative_error'];
T = array2table(T, 'VariableNames', {'k';'Compression ratio';'Relative Error'});
disp(T);