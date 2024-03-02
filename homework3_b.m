clc;clear all;close all;
fun = @(x) ObjFunc(x, 0);

% Initial guess
x0 = [1, 2];

% r values
r_values=[100,1e3,1e4,2e4,6.19e4,1e5];

disp('External Penalty Method Results:');
disp('---------------------------------');
disp('   r            |   Optimal Point                          |   Optimal Value   |   Function Evaluations   ');

% penalty parameter values
for i = 1:length(r_values)
    r = r_values(i);
    ext_penalty_fun = @(x) fun(x) + r * sum(max(0, nonlcon_wrapper(x)).^2);

    % fminunc with external penalty method
    options = optimoptions('fminunc', 'Display', 'off', 'Algorithm', 'quasi-newton');
    [x_fminunc, fval_fminunc,exitflag, output] = fminunc(ext_penalty_fun, x0, options);
    fprintf('%8.2f |   %-15s |   %.8f       |   %-24d\n', r, mat2str(x_fminunc), fval_fminunc, output.funcCount);

        figure;
        [X, Y] = meshgrid(linspace(-2, 5, 200), linspace(-2, 6, 200));
        Z = exp(X) + exp(Y) + 2*X.^2 + 2 * X .* Y + Y.^2;
        contour(X, Y, Z, 50, 'LineWidth', 1);
        hold on;

        fimplicit(@(x, y) 3 - (x - 3).^2 - (y - 2).^2, 'r', 'LineWidth', 2);
        fimplicit(@(x, y) (x - 3).^2 + (y - 2).^2 - 3, 'b', 'LineWidth', 2);
        fimplicit(@(x, y) -x - y + 3, 'm', 'LineWidth', 2);

        scatter(x_fminunc(1), x_fminunc(2), 100, 'k', 'filled');

        legend(' ',' ','Additional Constraint 1', 'Additional Constraint 2', 'Optimal Point');
        xlabel('X1');
        ylabel('X2');
        title(['Optimization Results (r = ', num2str(r), ')']);
        grid on;
        hold off;
    end

function [c, ceq] = nonlcon_wrapper(x)
    c = [(x(1) - 3)^2 + (x(2) - 2)^2 - 3; -x(1) - x(2) + 3];
    ceq = [];
end