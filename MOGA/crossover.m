function crosspop = crossover(crosspop, pop, ncount, ncross, F, d)
% crossover - Perform crossover operation on the population
%
% Usage:
%   crosspop = crossover(crosspop, pop, ncount, ncross, F, d)
%
% Inputs:
%   crosspop - Empty structure array to store the offspring
%   pop - Population structure array
%   ncount - Number of elements in the solution vector
%   ncross - Number of offspring to be produced
%   F - Fronts of non-dominated solutions
%   d - EPANET network object
%
% Output:
%   crosspop - Updated structure array with crossover offspring
%
% Description:
%   The crossover function performs the crossover operation on the given
%   population to produce offspring. The number of offspring to be produced
%   is specified by 'ncross'. Random parents are selected from the 'pop'
%   structure array, and the crossover operation is applied by blending the
%   solution vectors. The offspring are then evaluated for fitness using
%   the 'fitness' function and stored in the 'crosspop' array.
%
% Author:
%   [Erfan Hajibandeh]

format long

npop = length(pop);

for n = 1:2:ncross

    % Select random parents
    i1 = randi([1 npop]);
    i2 = randi([1 npop]);

    p1 = pop(i1).nodeD;
    p2 = pop(i2).nodeD;

    r = rand(1, ncount);

    % Apply crossover by blending the solution vectors
    o1 = round(10*((r.*p1) + (1-r).*p2))/10;
    o2 = round((10*(r.*p2) + (1-r).*p1))/10;

    % Evaluate fitness of offspring
    crosspop(n).nodeD = o1;
    crosspop(n).fit = fitness(o1, 2, d);

    crosspop(n+1).nodeD = o2;
    crosspop(n+1).fit = fitness(o2, 2, d);
end

end
