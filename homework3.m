clc;clear all;close all;

fun = @(x) ObjFunc(x, 0);

% Initial guess
x0 = [1, 2];

options = optimoptions('fmincon', 'Algorithm', 'interior-point', 'Display', 'iter', 'OptimalityTolerance', 1e-8);
[x_fmincon, fval_fmincon] = fmincon(fun, x0, [], [], [], [], [], [], @nonlcon_wrapper, options);
disp('fmincon result:');
disp(['Optimal point: ', num2str(x_fmincon)]);
fprintf('Optimal value: %.8f\n', fval_fmincon);


figure;
[X, Y] = meshgrid(linspace(-2, 5, 200), linspace(-2, 6, 200));
Z = exp(X) + exp(Y) + 2*X.^2 + 2 * X .* Y + Y.^2;
contour(X, Y, Z, 50, 'LineWidth', 1);
hold on;
fimplicit(@(x, y) 3 - (x - 3).^2 - (y - 2).^2, 'r', 'LineWidth', 2);
fimplicit(@(x, y) (x - 3).^2 + (y - 2).^2 - 3, 'b', 'LineWidth', 2);
fimplicit(@(x, y) -x - y + 3, 'm', 'LineWidth', 2);
scatter(x_fmincon(1), x_fmincon(2), 100, 'k', 'filled');
legend('Additional Constraint 1', 'Additional Constraint 2', 'fmincon Optimal Point');
xlabel('X1');
ylabel('X2');
title('Optimization Results');
grid on;
hold off;

function [c, ceq] = nonlcon_wrapper(x)
    c = [(x(1) - 3)^2 + (x(2) - 2)^2 - 3; -x(1) - x(2) + 3];
    ceq = [];
end