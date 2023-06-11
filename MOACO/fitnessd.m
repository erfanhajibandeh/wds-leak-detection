% fitnessd - Calculate the fitness value for a given vector v and vector c
%
% Usage:
%   z = fitnessd(v, c)
%
% Inputs:
%   v - Vector representing the values
%   c - Vector representing the coefficients
%
% Output:
%   z - Fitness value
%
% Description:
%   The fitnessd function calculates the fitness value based on the given
%   vector v and vector c. It iterates over the range 1 to 34 and applies
%   the fitness formula to each element. The fitness value is then
%   normalized and scaled by a factor of 10^-21.
%
% Author:
%   [Erfan Hajibandeh]

function z = fitnessd(v, c)
    z = 0;
    format long
    for i = 1:34
        z = z + (((v(i) - 0.3) / 0.3) / c(i))^2;
    end
    z = z * 10^-21;
end