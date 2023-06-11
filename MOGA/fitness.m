% fitness - Calculate the fitness value for a given vector v and network model d
%
% Usage:
%   Z = fitness(v, h, d)
%
% Inputs:
%   v - Vector representing the values
%   h - Flag indicating the type of vector (1 for nodeD, 2 for regular vector)
%   d - Network model object
%
% Output:
%   Z - Fitness value vector
%
% Description:
%   The `fitness` function calculates the fitness value based on the given
%   vector `v` and network model `d`. The behavior of the function depends
%   on the value of `h` flag. If `h` is 1, `v` is treated as a struct
%   containing the `nodeD` values. Otherwise, `v` is a regular vector.
%
%   In either case, the function constructs a cell array `b` representing
%   the base demands, where the first 8 elements of `b` correspond to the
%   demand values. The remaining elements are set to 0. The function then
%   calculates the first fitness component `z1` as the sum of absolute
%   differences between the demand values and 0.3, normalized by 2.8.
%
%   Next, the base demands in the network model `d` are updated with `b`,
%   and the hydraulic time series is computed. The node pressures are
%   retrieved, and the second fitness component `z2` is calculated as the
%   sum of squared differences between specific node pressures and their
%   target values.
%
%   The resulting fitness components `z1` and `z2` are combined into a
%   vector `Z` and returned.
%
% Author:
%   [Erfan Hajibandeh]

function Z = fitness(v, h, d)
    b = cell(1, 11);
    format long
    z1 = 0;
    
    if h == 1
        for i = 1:8
            b{i} = v.nodeD(i);
            b{9} = 0;
            b{10} = 0;
            b{11} = 0;
            z1 = z1 + abs(0.3 - v.nodeD(i));
        end
    else
        for i = 1:8
            b{i} = v(i);
            b{9} = 0;
            b{10} = 0;
            b{11} = 0;
            z1 = z1 + abs(0.3 - v(i));
        end
    end
    
    z1 = z1 / 2.8;
    
    d.setNodeBaseDemands(b);
    d.getComputedHydraulicTimeSeries;
    w = d.getNodePressure;
    
    z2 = ((w(6) - 56.441032409667969) / 56.441032409667969)^2 + ...
          ((w(8) - 76.903312683105469) / 76.903312683105469)^2;
    
    Z = [z1 z2]';
end
