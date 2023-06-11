% fitnessp - Calculate the fitness value for a given vector v and EPANET model r
%
% Usage:
%   z = fitnessp(v, r)
%
% Inputs:
%   v - Vector representing the values
%   r - EPANET model object
%
% Output:
%   z - Fitness value
%
% Description:
%   The fitnessp function calculates the fitness value based on the given
%   vector v and EPANET model r. It assigns the values of v to the demand
%   values of the EPANET model, computes the hydraulic time series, and
%   retrieves the node pressures. It then applies a fitness formula to the
%   pressure values at nodes 6 and 8, comparing them to the expected
%   pressures. The fitness value represents the sum of the squared
%   differences between the actual and expected pressures.
%
% Author:
%   [Erfan Hajibandeh]

function z = fitnessp(v, r)
    b = cell(1, 11);
    format long
    for i = 1:8
        b{i} = v(i);
    end
    b{9} = 0;
    b{10} = 0;
    b{11} = 0;
    r.setNodeBaseDemands(b);
    r.getComputedHydraulicTimeSeries;
    w = r.getNodePressure;
    z = ((w(6) - (86.436828613281250)) / 86.436828613281250)^2 + ...
        ((w(8) - (80.894065856933594)) / 80.894065856933594)^2;
end
