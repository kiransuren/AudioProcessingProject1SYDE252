%% Get audio data
birdsAudioData = Init('Birds.wav');
drumAudioData = Init('Drum.wav');
speechAudioData = Init('Speech.wav');

% % Calculate SAD for each filter applied on Birds.wav
% meanSADBirds = sad(@meanFilter, birdsAudioData);
% medianSADBirds = sad(@medianFilter_JG, birdsAudioData);
% gaussSADBirds = sad(@weighted_avg, birdsAudioData);
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
% meanSADDrum = sad(@meanFilter, drumAudioData);
% medianSADDrum = sad(@medianFilter_JG, drumAudioData);
% gaussSADDrum = sad(@weighted_avg, drumAudioData);
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

% Calculate SAD for each filter applied on Speech.wav
meanSADSpeech = sad(@meanFilter, speechAudioData);
medianSADSpeech = sad(@medianFilter_JG, speechAudioData);
gaussSADSpeech = sad(@weighted_avg, speechAudioData);
% Plot SAD's for Speech
subplot(3,1,1)
plot(meanSADSpeech,'b*-', 'LineWidth', 2);
title('Mean Filter applied on Speech.wav')
xlabel("Window Size (L)")
ylabel("Sum of Absolute Differences")
subplot(3,1,2)
plot(medianSADSpeech,'b*-', 'LineWidth', 2);
title('Median Filter applied on Speech.wav')
xlabel("Window Size (L)")
ylabel("Sum of Absolute Differences")
subplot(3,1,3)
plot(gaussSADSpeech,'b*-', 'LineWidth', 2);
title('Gaussian Filter applied on Speech.wav')
xlabel("Window Size (L)")
ylabel("Sum of Absolute Differences")


%% Define SAD calculator function
function sadOut = sad(func, rawData)
    windowArr = [1:1:30];    % initialize windows to test
    for k = 1 : length(windowArr)
        y = func(rawData, k);
        sadOut(k) = sum(abs(y - rawData));
    end
end