% RouletteWheel - Perform selection using Roulette Wheel mechanism
%
% Usage:
%   i = RouletteWheel(pop, F, nobj, nf)
%
% Inputs:
%   pop   - Population structure
%   F     - Cell array of fronts
%   nobj  - Number of objective functions
%   nf    - Number of fronts
%
% Output:
%   i     - Index of the selected individual
%
% Description:
%   The `RouletteWheel` function performs selection using the Roulette Wheel
%   mechanism. It first selects a front based on the Roulette Wheel selection
%   process, where the probability of selecting a front is inversely
%   proportional to its rank. Then, it selects an individual within the
%   selected front using another Roulette Wheel selection, where the
%   probability of selecting an individual is determined by its crowding
%   distance. The index of the selected individual is returned.
%
% Author:
%   [Erfan Hajibandeh]

function i = RouletteWheel(pop, F, nobj, nf)
    % Select Front by Roulette Wheel
    f = 1:nf;
    f = 1./f;
    f = f./sum(f);
    f = cumsum(f);
    k = find(rand <= f, 1, 'first');

    % Select member by Roulette Wheel
    m = F{k};
    cd = [pop(m).cdis];
    cd(cd == inf) = nobj;
    cd = cd./sum(cd);
    cd = cumsum(cd);
    j = find(rand <= cd, 1, 'first');

    i = m(j);
end
