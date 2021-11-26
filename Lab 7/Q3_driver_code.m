format short e;

fprintf("\n**************  Part (i)  **************\n\n"); 
A = gallery('kahan', 90, 1.2, 0);
sig = svd(A);
fprintf("sigma_1 = "); disp(sig(1));
fprintf("sigma_89 = "); disp(sig(89));
fprintf("sigma_90 = "); disp(sig(90));

fprintf("Rank of A = "); disp(rank(A));


fprintf("\n\n**************  Part (ii) - Perturbed Matrix  **************\n\n");
A = gallery('kahan', 90, 1.2, 25);
sig = svd(A);
fprintf("sigma_1 = "); disp(sig(1));
fprintf("sigma_89 = "); disp(sig(89));
fprintf("sigma_90 = "); disp(sig(90));

fprintf("Rank of A = "); disp(rank(A));


fprintf("\n\n**************  Part (iii) - QR decomposition with col pivoting  **************\n\n");
[Q, R, E] = qr(A);
fprintf("|| I - E || = "); disp(norm(eye(90) - E));

fprintf("R(90, 90) = "); disp(R(90, 90));
