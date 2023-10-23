% Number of trials per plucking position
numTrials = 5;

% Length from nut to bridge
% stringLength = input('guitar string length (cm): ');
stringLength = 65.3;

% Calculate numDivisions divisions based on the string length
numDivisions = 10;
startPosition = 1; % 1 cm away from the beginning of the string
endPosition = stringLength - 1; % 1 cm away from the end of the string

pluckingPositions = linspace(startPosition, endPosition, numDivisions);
pluckingPositions = round(pluckingPositions); % round to nearest cm

% Initialize data structures for storing the results
numPositions = length(pluckingPositions);
highestIntensityFrequencies = zeros(numPositions, numTrials);


% Perform trials for each plucking position
for pos = 1:numPositions
    position = pluckingPositions(pos);
    fprintf('plucking position: %.2f cm\n', position);
    
    trial = 1;
    while trial <= numTrials
        fprintf('Trial %d of %d\n', trial, numTrials);
        input('press key to start recording');
        
        % Call the analyze_guitar_string function to record and analyze the guitar string
        [highestIntensityHarmonicFrequency, harmonicAmpltudeAbsolute, harmonicAmplitudeRatio] = analyze_guitar_string(trial, pluckingPositions(pos));
        
        % store data
        highestIntensityFrequencies(pos, trial) = highestIntensityHarmonicFrequency;
        
        % Ask if the user wants to repeat the trial
        decision = input('Do you want to repeat the trial? (y/n) ', 's');
        if strcmpi(decision, 'y')
            % Don't increment the trial counter to redo the current trial
            continue;
        end
        
        trial = trial + 1;
    end
end

% Calculate the average frequency for each plucking position
averageHighestIntensity = mean(highestIntensityFrequencies, 2);

% Scatterplot of highest intensity non-fundamental harmonic frequencies vs. plucking positions
figure;
hold on;

for pos = 1:numPositions
    scatter(repmat(pluckingPositions(pos), 1, numTrials), highestIntensityFrequencies(pos, :), 'filled', 'MarkerFaceColor', [0.7 0.7 1]);
end

% Plotting the average frequencies with black 'o' markers
scatter(pluckingPositions, averageHighestIntensity, 'ko', 'LineWidth', 1.5);

hold off;
xlabel('Plucking Position (cm)');
ylabel('Highest Intensity Non-fundamental Harmonic Frequency (Hz)');
title('Relationship between Plucking Position and Highest Intensity Non-fundamental Harmonic Frequency');
