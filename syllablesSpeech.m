function numPeaks = syllablesSpeech()
    speechAudioData = Init('Speech.wav');
    
    y = meanFilter(speechAudioData, 20);
    
    rawPeakList = peakDetector(y, 50)';
    peakList = meanFilter(rawPeakList,20);
    peakList = meanFilter(peakList,21);
    finalList = findpeaks(peakList);
    
    subplot(5,1,1)
    plot(speechAudioData)
    xlabel('t')
    ylabel('Audioform')
    title('Raw Speech Audio Data')
    
    subplot(5,1,2)
    plot(y)
    xlabel('t')
    ylabel('Audioform')
    title('Mean Filtered Speech Audio Data')
    
    subplot(5,1,3)
    plot(rawPeakList)
    xlabel('t')
    ylabel('Audioform')
    title('Raw Peak Regions')
    
    subplot(5,1,4)
    plot(peakList)
    xlabel('Peak Index')
    ylabel('Value')
    title('Filtered Peak Regions')
    
    subplot(5,1,5)
    plot(finalList)
    xlabel('Peak Index')
    ylabel('Value')
    title('Peak Values')
    numPeaks = size(finalList,1);
    fprintf("\nThe number of syllables detected in this audio clip is %d\n", size(finalList,1));
end
