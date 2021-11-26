p = [1 -8 16];
x = 0;

disp("****** Evaluation at Scalar value *******");
fprintf("x = ");
disp(x);
fprintf("Calculated using Horner formula = ");
disp(Horner(p, x));

fprintf("Calculated using exact formula = ");
disp(f(x));

x = [1, 2, 4];
fprintf("\n\n****** Evaluation at Vector value *******\n");
fprintf("x = ");
disp(x);
fprintf("Calculated using Horner formula = ");
disp(Horner(p, x));

fprintf("Calculated using exact formula = ");
disp(f(x));


function y = f(x)
    y = (x - 4) .^ 2;
end
