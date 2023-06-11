% plotpareto - Plot the Pareto front
%
% Usage:
%   plotpareto(F, C)
%
% Inputs:
%   F - Cell array containing the fronts of non-dominated individuals
%   C - Fitness values of the individuals
%
% Description:
%   The `plotpareto` function takes the fronts of non-dominated individuals
%   stored in the cell array `F` and their corresponding fitness values `C`,
%   and plots the Pareto front in a 2D scatter plot. The function extracts
%   the fitness values of the individuals belonging to the first front
%   (`F{1}`) and plots them with red asterisks.
%
%   The x-axis represents the first objective (F1) and the y-axis represents
%   the second objective (F2). The function adds appropriate labels to the
%   axes to provide a clear visualization of the Pareto front.
%
% Author:
%   [Erfan Hajibandeh]

function plotpareto(F, C)
    C1 = C(F{1}, :);
    plot(C1(:, 1), C1(:, 2), 'r*')
    xlabel('F1');
    ylabel('F2');
end
