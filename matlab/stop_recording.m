function audio_data = stop_recording(recObj)
    % Stop the recording
    stop(recObj);
    disp('Recording stopped.');

    % Retrieve the recorded audio data
    audio_data = getaudiodata(recObj);
end