function recObj = start_recording(Fs, id)
    % Fs: sampling rate (in Hz)

    % Create an audiorecorder object
    recObj = audiorecorder(Fs, 24, 1, id);

    % Start recording
    record(recObj);
    disp('Recording started...');
end
