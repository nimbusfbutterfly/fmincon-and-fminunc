# Optimization Problem

## Objective
The objective of this project is to find the optimal point for the given objective function while considering the provided constraints. Two methods will be used: `fmincon` with constraints and `fminunc` with an external penalty method. The results obtained from both methods will be compared, and the effect of the parameter `r` in the external penalty method will be analyzed.

## Problem Definition
Objective Function: \( (X_1 - 3)^2 + (X_2 - 2)^2 \)
Constraints:
- \( (X_1 - 3)^2 + (X_2 - 2)^2 < 3 \)
- \( X_1 + X_2 > 3 \)

## Steps
1. **Initial Guess:** [1, 2]
2. **Comparing Results:** After obtaining the optimal point using both methods, compare the results.
3. **Visualization:** Plot the contour lines of the two-dimensional function and show the scatter of points to reach the optimal point. Also, plot the constraints on the contour lines.
4. **Methods:** Use `fmincon` once with constraints and `fminunc` with an external penalty method.
5. **Effect of Parameter \( r \):** Investigate the effect of the parameter \( r \) in the external penalty method on the number of iterations and the accuracy of the solution.

## Implementation
- MATLAB: Use the `fmincon` and `fminunc` functions to solve the optimization problem.

