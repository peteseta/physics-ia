function [highestIntensityHarmonicFrequency, harmonicAmplitudeAbsolute, harmonicAmplitudeRatio] = analyze_guitar_string(trialNumber, pluckingPosition)
%This function records, processes, and analyzes a guitar string pluck

%% Recording
% Fs = sample rate (Hz)
% id = index of device (1 = macbook, 2 = EVO4)
Fs = 48000;
id = -1;

% Call the function to start the recording
recObj = start_recording(Fs, id);

% record length
recLength = 5;
pause(recLength);

% Call the function to stop the recording and retrieve the audio data
audio_data = stop_recording(recObj);

%% Hann windowing and Welch FFT
% Apply Hann window to the audio signal
windowed_audio_data = audio_data .* hann(length(audio_data));

% Welch's method
nfft = 2^nextpow2(length(windowed_audio_data));
[Pxx, freqs] = pwelch(windowed_audio_data, hann(nfft/8), nfft/16, nfft, Fs);

%% Analyzing harmonics
% Define the number of harmonics to display and analyze
numHarmonics = 20;

% amplitude of each harmonic - for raw data
harmonicAmplitudeAbsolute = zeros(1, numHarmonics);
harmonicAmplitudeRatio = zeros(1, numHarmonics);

% temp to hold the frequency and amplitude with the highest intensity
% (returns to the wrapper)
highestIntensityHarmonicFrequency = 0;
highestIntensityAmplitude = -Inf;

%% Plotting
% show the averaged periodogram
figure;
plot(freqs, 10*log10(Pxx));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title(sprintf('Trial %d, Plucking Position: %.2f cm - Periodogram (Welch Method)', trialNumber, pluckingPosition));

% plot the fundamental frequency and harmonics, and add points to the plot
hold on; % Keep the current plot for adding points

% fundamental freq of high E string (from perov2016)
fundamentalFrequency = 329.63;
fprintf('Fundamental frequency: %.2f Hz\n', fundamentalFrequency);

% find the index of the fundamental frequency in the frequency array
[~, peakIndex] = min(abs(freqs - fundamentalFrequency));

% plot the fundamental frequency as a point
plot(fundamentalFrequency, 10*log10(Pxx(peakIndex)), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
harmonicAmplitudeAbsolute(1) = 10*log10(Pxx(peakIndex));

% min harmonic to ignore for choosing maximum ("non-fundamental")
minHarm = 1;

% find and PLOT the harmonics from the 3rd to the numHarmonics'th
for i = 2:numHarmonics
    expectedHarmonicFrequency = i * fundamentalFrequency;
    % search for the true peak within 10% of the fundamental frequency
    % to account for tuning variations
    searchRange = 0.1 * fundamentalFrequency; 

    % extract a portion of the periodogram around the expected harmonic frequency
    startIndex = find(freqs >= (expectedHarmonicFrequency - searchRange), 1);
    endIndex = find(freqs <= (expectedHarmonicFrequency + searchRange), 1, 'last');
    localPeriodogram = Pxx(startIndex:endIndex);
    localFreqs = freqs(startIndex:endIndex);

    % find the peak in the local periodogram
    [pks, locs] = findpeaks(10*log10(localPeriodogram), 'NPeaks', 1, 'SortStr', 'descend');

    % calculate the actual harmonic frequency and amplitude
    harmonicFrequency = localFreqs(locs);
    harmonicAmplitude = pks;
    
    fprintf('Harmonic %d: %.2f Hz\n', i, harmonicFrequency);
    
    % plot the harmonic frequency as a point
    plot(harmonicFrequency, harmonicAmplitude, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
    text(harmonicFrequency, harmonicAmplitude, sprintf('  H%d', i))
    
    % record the amplitude of the harmonic
    harmonicAmplitudeAbsolute(i) = harmonicAmplitude;

    % record the ratio of the harmonic to fundamental amplitude
    harmonicAmplitudeRatio(i) = harmonicAmplitude / harmonicAmplitudeAbsolute(i);
    
    % if we are above the minHarm (logic for checking highest is only applied to our range)
    if i > minHarm
        % check if this harmonic has the highest intensity so far
        if harmonicAmplitudeAbsolute(i) > highestIntensityAmplitude
            highestIntensityAmplitude = harmonicAmplitudeAbsolute(i);
            highestIntensityHarmonicFrequency = harmonicFrequency;
        end
    end
end


% scale the frequency and magnitude axes of the plot
xlim([0, (numHarmonics + 1) * fundamentalFrequency]);
ylim([min(10*log10(Pxx)), max(10*log10(Pxx)) * 1.1]);

hold off; % release the current plot

%% Result
% print the non-fundamental harmonic with the highest intensity
fprintf('Highest intensity non-fundamental harmonic: %.2f Hz\n', highestIntensityHarmonicFrequency);

%% Playback of recording
% playerObj = audioplayer(audio_data, Fs);
% play(playerObj);
% disp('Playing the recorded audio...');

% wait until the playback finishes
% while (isplaying(playerObj))
%     pause(0.1);
% end
disp('Playback finished.');
end
