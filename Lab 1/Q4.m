%% Question - 4

disp("(a) Column oriented back substitution");
U = [2 4 5; 0 2 6; 0 0 2]
b = [4 5 6]'

x = colbackward(U, b)

disp("(b) Row oriented forward substitution");
L = [2 0 0; 2 4 0; 2 4 8]
b = [0.7373 0.6898 -0.8360]'

x = rowforward(L, b)