function j = RouletteWheel(P)
    % Perform selection using Roulette Wheel method
    % Inputs:
    %   P: Probability distribution for selection
    % Output:
    %   j: Selected index based on Roulette Wheel selection

    P = P ./ sum(P); % Normalize probabilities
    P = cumsum(P); % Compute cumulative probabilities
    j = find(rand <= P, 1, 'first'); % Perform selection based on random value
end
