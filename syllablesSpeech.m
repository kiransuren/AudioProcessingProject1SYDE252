function numPeaks = syllablesSpeech()
    speechAudioData = Init('Speech.wav'); % get raw speech data
    
    y = meanFilter(speechAudioData, 20);  % reduce noise with mean filter
    
    rawPeakList = peakDetector(y, 50)';     % sliding window peak detection
    peakList = meanFilter(rawPeakList,20);  % cascading mean filter level1
    peakList = meanFilter(peakList,21);     % cascading mean filter level2
    finalList = findpeaks(peakList);        % final find peaks calculation
    
    % Plot raw audio data
    subplot(5,1,1)
    plot(speechAudioData)
    xlabel('t')
    ylabel('Audioform')
    title('Raw Speech Audio Data')
    
    % Plot mean filtered audio data
    subplot(5,1,2)
    plot(y)
    xlabel('t')
    ylabel('Audioform')
    title('Mean Filtered Speech Audio Data')
    
    % Plot raw peak regions
    subplot(5,1,3)
    plot(rawPeakList)
    xlabel('t')
    ylabel('Audioform')
    title('Raw Peak Regions')
    
    % Plot filtered peak regions
    subplot(5,1,4)
    plot(peakList)
    xlabel('Peak Index')
    ylabel('Value')
    title('Filtered Peak Regions')
    
    % Plot final peak values 
    subplot(5,1,5)
    plot(finalList)
    xlabel('Peak Index')
    ylabel('Value')
    title('Peak Values')

    % Get number of peaks fron final list
    numPeaks = size(finalList,1);
    fprintf("\nThe number of syllables detected in this audio clip is %d\n", size(finalList,1));
end
