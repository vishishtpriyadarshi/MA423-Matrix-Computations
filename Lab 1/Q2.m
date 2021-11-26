%% Question - 2
n = 1000;
k = 5;

[s, scf, scb] = sumreciprocal(n, k);
    
fprintf("n = %d\tk = %d\n\n", n, k);
fprintf("(a) s = %f\n(b) scf = %f\n(c) scb = %f\n\n", s, scf, scb);

fprintf("|s - scf| = %f\n", abs(s - scf));
fprintf("|s - scb| = %f\n", abs(s - scb));