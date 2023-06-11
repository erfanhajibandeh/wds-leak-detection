% sorting - Sort the population based on crowding distance and rank
%
% Usage:
%   pop = sorting(pop)
%
% Inputs:
%   pop - Population of individuals
%
% Output:
%   pop - Sorted population
%
% Description:
%   The `sorting` function takes a population of individuals and sorts them
%   based on their crowding distance and rank. First, the individuals are
%   sorted in descending order of their crowding distance. If two or more
%   individuals have the same crowding distance, they are then sorted in
%   ascending order of their rank.
%
%   The function returns the sorted population, where the individuals with
%   higher crowding distance and lower rank are placed at the beginning of
%   the population.
%
% Author:
%   [Erfan Hajibandeh]

function pop = sorting(pop)
    [~, index] = sort([pop.cdis], 'descend');
    pop = pop(index);

    [~, index] = sort([pop.rank]);
    pop = pop(index);
end
