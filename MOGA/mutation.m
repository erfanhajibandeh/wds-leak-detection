% mutation - Perform mutation on the population
%
% Usage:
%   mutpop = mutation(mutpop, pop, ncount, nmut, popsize, d)
%
% Inputs:
%   mutpop   - Mutated population structure
%   pop      - Original population structure
%   ncount   - Number of elements in a solution vector
%   nmut     - Number of individuals to be mutated
%   popsize  - Size of the population
%   d        - EPANET object representing the water distribution system
%
% Output:
%   mutpop   - Mutated population structure
%
% Description:
%   The `mutation` function performs mutation on a subset of individuals
%   in the population. It randomly selects individuals from the original
%   population `pop`, and swaps two elements within their solution vector.
%   The mutated individuals are stored in the `mutpop` structure with
%   updated fitness values calculated using the `fitness` function.
%
% Author:
%   [Erfan Hajibandeh]

function mutpop = mutation(mutpop, pop, ncount, nmut, popsize, d)
    format long
    for n = 1:nmut
        i = randi([1 popsize]);
        p = pop(i).nodeD;

        j1 = randi([1 ncount-1]);
        j2 = randi([j1+1 ncount]);

        nj1 = p(j1);
        nj2 = p(j2);

        p(j1) = nj2;
        p(j2) = nj1;

        mutpop(n).nodeD = p;
        mutpop(n).fit = fitness(p, 2, d);
    end
end
