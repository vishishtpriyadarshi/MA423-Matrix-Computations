format long e
n = 10;
H = hilb(n);
rng(41);
x = randn(n,1);
b = H*x;
xt = H \ b;
r = H * xt - b;

disp([norm(r)/norm(b) norm(x-xt)/norm(x)]);