% dominate - Check dominance between two vectors a and b
%
% Usage:
%   c = dominate(a, b)
%
% Inputs:
%   a - Vector representing the first solution
%   b - Vector representing the second solution
%
% Output:
%   c - Boolean value indicating whether a dominates b (true) or not (false)
%
% Description:
%   The `dominate` function compares two vectors, a and b, element-wise.
%   It returns true if a dominates b, which means that all elements of a
%   are less than or equal to the corresponding elements in b, and at
%   least one element in a is strictly less than the corresponding
%   element in b. Otherwise, it returns false.
%
% Author:
%   [Erfan Hajibandeh]


function c=dominate(a,b)
format long

c=all(a<=b) && any(a<b);

end