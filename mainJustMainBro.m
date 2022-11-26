clc % Clear command window
clear % Clear workspace
%% Pre-processing audio samples
%resampled_birds = Init("Birds.wav");
%resampled_drum = Init("Drum.wav");
%resampled_speech = Init("Speech.wav");

%% Beats Per Minute
%bpm(resampled_drum, 10);

%% Find optimal window sizes for each filter
% % Calculate SAD for each filter applied on Birds.wav
% meanSADBirds = sad(@meanFilter, resampled_birds);
% medianSADBirds = sad(@medianFilter, resampled_birds);
% gaussSADBirds = sad(@weighted_avg, resampled_birds);
% % Plot SAD's for Birds
% subplot(3,1,1)
% plot(meanSADBirds,'b*-', 'LineWidth', 2);
% title('Mean Filter applied on Birds.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")
% subplot(3,1,2)
% plot(medianSADBirds,'b*-', 'LineWidth', 2);
% title('Median Filter applied on Birds.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")
% subplot(3,1,3)
% plot(gaussSADBirds,'b*-', 'LineWidth', 2);
% title('Gaussian Filter applied on Birds.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")

% % Calculate SAD for each filter applied on Drum.wav
% meanSADDrum = sad(@meanFilter, resampled_drum);
% medianSADDrum = sad(@medianFilter, resampled_drum);
% gaussSADDrum = sad(@weighted_avg, resampled_drum);
% % Plot SAD's for Drum
% subplot(3,1,1)
% plot(meanSADDrum,'b*-', 'LineWidth', 2);
% title('Mean Filter applied on Drum.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")
% subplot(3,1,2)
% plot(medianSADDrum,'b*-', 'LineWidth', 2);
% title('Median Filter applied on Drum.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")
% subplot(3,1,3)
% plot(gaussSADDrum,'b*-', 'LineWidth', 2);
% title('Gaussian Filter applied on Drum.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")

% % Calculate SAD for each filter applied on Speech.wav
% meanSADSpeech = sad(@meanFilter, resampled_speech);
% medianSADSpeech = sad(@medianFilter, resampled_speech);
% gaussSADSpeech = sad(@weighted_avg, resampled_speech);
% % Plot SAD's for Speech
% subplot(3,1,1)
% plot(meanSADSpeech,'b*-', 'LineWidth', 2);
% title('Mean Filter applied on Speech.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")
% subplot(3,1,2)
% plot(medianSADSpeech,'b*-', 'LineWidth', 2);
% title('Median Filter applied on Speech.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")
% subplot(3,1,3)
% plot(gaussSADSpeech,'b*-', 'LineWidth', 2);
% title('Gaussian Filter applied on Speech.wav')
% xlabel("Window Size (L)")
% ylabel("Sum of Absolute Differences")

%% Silent Regions in Birds Audio
% Determining which filter to use for silent regions detection
% Selecting a filter 
% figure;
% subplot(4,1,1)
% plot(resampled_birds);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Original Birds Audio");
% 
% subplot(4,1,2)
% result1 = meanFilter(resampled_birds,15);
% plot(result1);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Mean Filter");
%  
% subplot(4,1,3)
% result2 = medianFilter(resampled_birds,20);
% plot(result2);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Median Filter");
% 
% subplot(4,1,4)
% result3 = weighted_avg(resampled_birds,14);
% plot(result3);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Gaussian Filter");

% Selecting a window size for the median filter
% figure;
% subplot(3,1,1)
% plot(resampled_birds);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Original Birds Audio");

% subplot(3,1,2)
% result4 = medianFilter(resampled_birds,10);
% plot(result4);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Median Filter of Window Size 10");

% subplot(3,1,3)
% result5 = medianFilter(resampled_birds,20);
% plot(result5);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Median Filter of Window Size 20");

% Using the silence detection algoirthm
% figure;
% subplot(3,1,1);
% plot(resampled_birds);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Original Birds Audio");
% 
% subplot(3,1,2);
% result6 = silenceDetection(resampled_birds,10,0.015);
% plot(result6);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Silence Detection");
% 
% subplot(3,1,3);
% plot(result4);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Median Filter of Window Size 10");

% Selecting the best threshold voltage for silence detection algorithm
% figure;
% subplot(3,1,1);
% result7 = silenceDetection(resampled_birds,10,0.014);
% plot(result7);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Silence Detection of 0.014 for Threshold");
% 
% subplot(3,1,2);
% plot(result6);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Silence Detection of 0.015 for Threshold");
% 
% subplot(3,1,3);
% result6 = silenceDetection(resampled_birds,10,0.016);
% plot(result6);
% xlabel("Sampling Rate");
% ylabel("Amplitude");
% title("Birds Audio with Silence Detection of 0.016 for Threshold");

%% Finding number of syllables in speech audio
% y = meanFilter(resampled_speech, 20);  % reduce noise with mean filter
% 
% rawPeakList = peakDetector(y, 50)';     % sliding window peak detection
% peakList = meanFilter(rawPeakList,20);  % cascading mean filter level1
% peakList = meanFilter(peakList,21);     % cascading mean filter level2
% finalList = findpeaks(peakList);        % final find peaks calculation
% 
% % Plot raw audio data
% subplot(5,1,1)
% plot(resampled_speech)
% xlabel('t')
% ylabel('Audioform')
% title('Raw Speech Audio Data')
% 
% % Plot mean filtered audio data
% subplot(5,1,2)
% plot(y)
% xlabel('t')
% ylabel('Audioform')
% title('Mean Filtered Speech Audio Data')
% 
% % Plot raw peak regions
% subplot(5,1,3)
% plot(rawPeakList)
% xlabel('t')
% ylabel('Audioform')
% title('Raw Peak Regions')
% 
% % Plot filtered peak regions
% subplot(5,1,4)
% plot(peakList)
% xlabel('Peak Index')
% ylabel('Value')
% title('Filtered Peak Regions')
% 
% % Plot final peak values
% subplot(5,1,5)
% plot(finalList)
% xlabel('Peak Index')
% ylabel('Value')
% title('Peak Values')
% 
% % Get number of peaks fron final list
% numPeaks = size(finalList,1);
% fprintf("\nThe number of syllables detected in this audio clip is %d\n", size(finalList,1));


%% Define SAD calculator function
% function sadOut = sad(func, rawData)
%     windowArr = [1:1:30];    % initialize windows to test
%     for k = 1 : length(windowArr)
%         y = func(rawData, k);
%         sadOut(k) = sum(abs(y - rawData));
%     end
% end
