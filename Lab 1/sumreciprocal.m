function [s, scf, scb] = sumreciprocal(m, k)
    % This function is to be called as [s, scf, scb] = sumreciprocal(m, k).
    % It returns the sum of the first m terms of the sequence 1/n, n in N,
    % as s, sum of the first m terms in k digit arithmetic as scf, and same
    % sum in reverse order, that is, from 1/m to 1 in k digit arithmetic as
    % scb
    
    [s, scf, scb] = deal(0);
    
    for i = 1 : m
       s = s + 1/i;
       scf = chop(scf + chop(1/i, k), k);
       scb = chop(scb + chop(1/(m - i + 1), k), k);
    end
end