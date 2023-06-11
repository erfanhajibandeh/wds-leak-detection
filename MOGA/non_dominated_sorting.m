% non_dominated_sorting - Perform non-dominated sorting on the population
%
% Usage:
%   [pop, F] = non_dominated_sorting(pop)
%
% Inputs:
%   pop - Population of individuals
%
% Outputs:
%   pop - Updated population with assigned ranks
%   F   - Cell array containing the fronts of non-dominated individuals
%
% Description:
%   The `non_dominated_sorting` function performs non-dominated sorting on
%   the population `pop` to assign ranks to each individual. The function
%   uses a dominate matrix `dm` to determine the dominance relationship
%   between individuals based on their fitness values.
%
%   The function iterates over each individual in `pop` and compares its
%   fitness values with other individuals using the `dominate` function. If
%   an individual dominates another, the corresponding entry in `dm` is
%   set to 1. After processing each individual, the function identifies the
%   first front of non-dominated individuals (rank 1) and assigns the rank
%   value to those individuals.
%
%   The process continues by removing the non-dominated individuals of rank
%   1 from `dm` and iteratively finding the next fronts until all
%   individuals are assigned ranks. The function returns the updated
%   population `pop` with assigned ranks and the cell array `F` containing
%   the fronts of non-dominated individuals.
%
% Author:
%   [Erfan Hajibandeh]

function [pop, F] = non_dominated_sorting(pop)
    k = 1;
    F{k} = [];
    n = length(pop);
    dm = zeros(n); % dominate matrix

    for i = 1:n
        a = pop(i).fit;
        
        if i == n
            if sum(dm(:, i)) == 0
                F{k} = [F{k} i];
                pop(i).rank = k;
            end
            break
        end
        
        for j = i + 1:n
            b = pop(j).fit;
            
            if dominate(a, b)
                dm(i, j) = 1;
            elseif dominate(b, a)
                dm(j, i) = 1;
            end
        end
        
        if sum(dm(:, i)) == 0
            F{k} = [F{k} i];
            pop(i).rank = k;
        end
    end

    s = F{k};
    dm(s, :) = 0;
    dm(:, s) = inf;

    while true
        k = k + 1;
        s = find(sum(dm) == 0);
        
        if isempty(s)
            break
        end
        
        F{k} = s;
        dm(s, :) = 0;
        dm(:, s) = inf;

        for j = s
            pop(j).rank = k;
        end
    end
end
