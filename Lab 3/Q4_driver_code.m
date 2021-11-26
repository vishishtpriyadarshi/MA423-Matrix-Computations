format long e
rng(41);

N = [32, 64];
[condition_number, error_gepp, ratio_gepp, error_qr, ratio_qr] = deal([]);

for n = N
    x = rand(n, 1);
    % save(['Q4_workspace_x_' num2str(n) '.mat'], 'x');
    
    W = Wilkinson(n);
    b = W * x;

    x_gepp = geppsolve(W, b);
    
    condition_number = [condition_number; cond(W, inf)];
    error_gepp = [error_gepp; norm(x - x_gepp, inf) / norm(x, inf)];
    ratio_gepp = [ratio_gepp; norm(W * x_gepp - b, inf) / norm(b, inf)];

    [Q, R] = qr(W);
    x_qr = colbackward(R, Q' * b);
    error_qr = [error_qr; norm(x - x_qr, inf) / norm(x, inf)];
    ratio_qr = [ratio_qr; norm(W * x_qr - b, inf) / norm(b, inf)];
end

T = table(N', condition_number, error_gepp, error_qr, ratio_gepp, ratio_qr);
T.Properties.VariableNames = {'n', 'condition Number', 'Error (GEPP)', 'Error (QR)', '||r||/||b|| (GEPP)', '||r||/||b|| (QR)'};
disp(T);