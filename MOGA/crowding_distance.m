function pop = crowding_distance(pop, F)
% crowding_distance - Calculate the crowding distance for each solution in the population
%
% Usage:
%   pop = crowding_distance(pop, F)
%
% Inputs:
%   pop - Population structure array
%   F - Fronts of non-dominated solutions
%
% Output:
%   pop - Updated population structure array with crowding distances
%
% Description:
%   The crowding_distance function calculates the crowding distance for
%   each solution in the population. The crowding distance is a measure of
%   how crowded a solution is in relation to its neighbors in the objective
%   space. It is used to maintain diversity during selection in
%   multi-objective optimization. The crowding distance is calculated
%   based on the ranks of solutions and their objective values.
%
% Author:
%   [Erfan Hajibandeh]

format long

nf = length(F);
nobj = length(pop(1).fit);
npop = length(pop);

C = [pop.fit]';

emp.value = [];
emp.index = [];
sortf = repmat(emp, nf, nobj);

for i = 1:npop
    fi = pop(i).rank;
    m = F{fi};
    nm = length(m);
    Cfi = C(m,:);
    crdis = 0;
    
    for o = 1:nobj
        Cobj = Cfi(:, o);
        
        if isempty(sortf(fi, o).value)
           [value, index] = sort(Cobj);
           sortf(fi, o).value = value;
           sortf(fi, o).index = m(index);
           sortf(fi, o).maxvalue = value(end);
           sortf(fi, o).minvalue = value(1);
        end
        
        value = sortf(fi, o).value;
        index = sortf(fi, o).index;
        maxvalue = sortf(fi, o).maxvalue;
        minvalue = sortf(fi, o).minvalue;
        
        j = find(index == i);
        
        if j == 1 || j == nm
            crdis = crdis + inf;
        else
            valueC = value(j + 1);
            valueA = value(j - 1);
            crdisB = abs(valueC - valueA) / (maxvalue - minvalue);
            crdis = crdis + crdisB;
        end
    end
    
    pop(i).cdis = crdis;
end

end
