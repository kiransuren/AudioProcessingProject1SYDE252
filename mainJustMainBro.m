clc % Clear command window
clear % Clear workspace
%% Pre-processing audio samples
resampled_birds = Init("Birds.wav");
resampled_drum = Init("Drum.wav");
resampled_speech = Init("Speech.wav");

%% Beats Per Minute
% bpm('Drum.wav', 10);

%% Determining best window size by plotting the sum of absolute differences
% window_sizes = 1 : 3 : 40;
%  for k = 1 : length(window_sizes)
% %     smoothedSignal = kirans_medianfilter(resampled_birds,window_sizes(k));
%     smoothedSignal = medianFilter(window_sizes(k),resampled_birds);
%     sad(k) = sum(abs(smoothedSignal - resampled_birds));
%  end
% subplot(4,1,4);
% plot(window_sizes,sad, 'b*-', 'LineWidth', 2);
% xlabel("Window Size");
% ylabel("Sum of Absolute Differences");
% title("Optimal Median Filter Window Size for Birds Audio")

%% Determining best window size by listening to the audio samples
%sound(meanFilter(Init('Birds.wav'), 15), 16e3);
%sound(medianFilter(15,Init('Birds.wav')), 16e3);
%sound(weighted_avg(Init('Birds.wav'), 14), 16e3);

%sound(meanFilter(Init('Drum.wav'), 25), 16e3);
%sound(medianFilter(27,Init('Drum.wav')), 16e3);
%sound(weighted_avg(Init('Drum.wav'), 13), 16e3);

%sound(meanFilter(Init('Speech.wav'), 25), 16e3);
%sound(medianFilter(23,Init('Speech.wav')), 16e3);
%sound(weighted_avg_shreya(Init('Speech.wav'), 22), 16e3);

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


%% Finding BPM for Drums audio
