[birdsAudioData, birdsSampleRate] = audioread('Birds.wav');
[speechAudioData, speechSampleRate] = audioread('Speech.wav');
[drumAudioData, drumSampleRate] = audioread('Drum.wav');

% audioData is mxn matrix, where m is number of audio samples and n is
% # of audio channels

size(birdsAudioData,2)       % 1 channels -> stereo
sound(birdsAudioData, birdsSampleRate);
audiowrite('newBirdsAudioData.wav', birdsAudioData, birdsSampleRate);

size(speechAudioData,2)     % 1 channel -> mono
sound(speechAudioData, speechSampleRate);
audiowrite('newSpeechAudioData.wav', speechAudioData, speechSampleRate);

size(drumAudioData,2)       % 2 channels -> stereo
monoDrumAudioData = drumAudioData(:,1) + drumAudioData(:,2);
sound(monoDrumAudioData, drumSampleRate);
audiowrite('newMonoDrumAudioData.wav', monoDrumAudioData, drumSampleRate);

% resampling
fprintf('old sample %d\n', birdsSampleRate);
s = 16000/birdsSampleRate;
y = resample(birdsAudioData, 1600, birdsSampleRate);
fprintf('new sample %d\n', s*birdsSampleRate);
sound(y, s*birdsSampleRate);

%   Plotting audio waveforms
subplot(3,1,1)
xlabel('t')
ylabel('audioform')
plot(birdsAudioData)

subplot(3,1,2)
xlabel('t')
ylabel('audioform')
plot(speechAudioData)

subplot(3,1,3)
xlabel('t')
ylabel('audioform')
plot(monoDrumAudioData)