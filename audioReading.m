[birdsAudioData, birdsSampleRate] = audioread('Birds.wav');
[speechAudioData, speechSampleRate] = audioread('Speech.wav');
[drumAudioData, drumSampleRate] = audioread('Drum.wav');

% audioData is mxn matrix, where m is number of audio samples and n is
% # of audio channels

size(birdsAudioData,2)       % 1 channels -> stereo
sound(birdsAudioData, birdsSampleRate);
audiowrite('Output/newBirdsAudioData.wav', birdsAudioData, birdsSampleRate);

size(speechAudioData,2)     % 1 channel -> mono
sound(speechAudioData, speechSampleRate);
audiowrite('Output/newSpeechAudioData.wav', speechAudioData, speechSampleRate);

size(drumAudioData,2)       % 2 channels -> stereo
%TODO: add columns to make it a single channel
monoDrumAudioData = drumAudioData(:,1) + drumAudioData(:,2);
sound(monoDrumAudioData, drumSampleRate);
audiowrite('Output/newMonoDrumAudioData.wav', monoDrumAudioData, drumSampleRate);

xlabel('t')
ylabel('audioform')
plot(birdsAudioData)
plot(speechAudioData)
plot(monoDrumAudioData)