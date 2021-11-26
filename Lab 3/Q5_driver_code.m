format long e
rng(41);

N = 20:20:140;
[L_genp_norm_1, U_genp_norm_1, req_genp_norm_1, L_gepp_norm_1, U_gepp_norm_1, req_gepp_norm_1] = deal([]);
[L_genp_norm_2, U_genp_norm_2, req_genp_norm_2, L_gepp_norm_2, U_gepp_norm_2, req_gepp_norm_2] = deal([]);
[L_genp_norm_inf, U_genp_norm_inf, req_genp_norm_inf, L_gepp_norm_inf, U_gepp_norm_inf, req_gepp_norm_inf] = deal([]);

for n = N
    A = rand(n);
    A(1, 1) = 50 * eps * A(1, 1);
    % save(['Q5_workspace_A_' num2str(n) '.mat'], 'A');
    
    [L, U] = genp(A);
    [L_gepp, U_gepp, p] = gepp(A);
    I = eye(n);
    
    % Computing for norm-1
    L_genp_norm_1 = [L_genp_norm_1; norm(L, 1)];
    U_genp_norm_1 = [U_genp_norm_1; norm(U, 1)];
    req_genp_norm_1 = [req_genp_norm_1; norm(L * U - A, 1) / norm(A, 1)];

    L_gepp_norm_1 = [L_gepp_norm_1; norm(L_gepp, 1)];
    U_gepp_norm_1 = [U_gepp_norm_1; norm(U_gepp, 1)];
    req_gepp_norm_1 = [req_gepp_norm_1; norm(L_gepp * U_gepp - I(p, :) * A, 1) / norm(A, 1)];
    
    
    % Computing for norm-2
    L_genp_norm_2 = [L_genp_norm_2; norm(L)];
    U_genp_norm_2 = [U_genp_norm_2; norm(U)];
    req_genp_norm_2 = [req_genp_norm_2; norm(L * U - A) / norm(A)];

    L_gepp_norm_2 = [L_gepp_norm_2; norm(L_gepp)];
    U_gepp_norm_2 = [U_gepp_norm_2; norm(U_gepp)];
    req_gepp_norm_2 = [req_gepp_norm_2; norm(L_gepp * U_gepp - I(p, :) * A) / norm(A)];
    
    
    % Computing for Infinity norm
    L_genp_norm_inf = [L_genp_norm_inf; norm(L, Inf)];
    U_genp_norm_inf = [U_genp_norm_inf; norm(U, Inf)];
    req_genp_norm_inf = [req_genp_norm_inf; norm(L * U - A, Inf) / norm(A, Inf)];

    L_gepp_norm_inf = [L_gepp_norm_inf; norm(L_gepp, Inf)];
    U_gepp_norm_inf = [U_gepp_norm_inf; norm(U_gepp, Inf)];
    req_gepp_norm_inf = [req_gepp_norm_inf; norm(L_gepp * U_gepp - I(p, :) * A, Inf) / norm(A, Inf)];
end

fprintf("\n\n*********** For norm-1 ***********\n");
T = table(N', L_genp_norm_1, U_genp_norm_1, req_genp_norm_1, L_gepp_norm_1, U_gepp_norm_1, req_gepp_norm_1);
T.Properties.VariableNames = {'n', '||L|| (genp)', '||U|| (genp)', '||LU - A||/||A|| (genp)', '||L|| (gepp)', '||U|| (gepp)', '||LU - PA||/||A|| (gepp)'};
disp(T);

fprintf("\n\n*********** For norm-2 ***********\n");
T = table(N', L_genp_norm_2, U_genp_norm_2, req_genp_norm_2, L_gepp_norm_2, U_gepp_norm_2, req_gepp_norm_2);
T.Properties.VariableNames = {'n', '||L|| (genp)', '||U|| (genp)', '||LU - A||/||A|| (genp)', '||L|| (gepp)', '||U|| (gepp)', '||LU - PA||/||A|| (gepp)'};
disp(T);

fprintf("\n\n*********** For Infinity norm ***********\n");
T = table(N', L_genp_norm_inf, U_genp_norm_inf, req_genp_norm_inf, L_gepp_norm_inf, U_gepp_norm_inf, req_gepp_norm_inf);
T.Properties.VariableNames = {'n', '||L|| (genp)', '||U|| (genp)', '||LU - A||/||A|| (genp)', '||L|| (gepp)', '||U|| (gepp)', '||LU - PA||/||A|| (gepp)'};
disp(T);