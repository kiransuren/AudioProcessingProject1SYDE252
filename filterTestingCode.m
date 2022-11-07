[birdsAudioData, birdsSampleRate] = audioread('Birds.wav');

size(birdsAudioData,2)       % 1 channels -> stereo

windowSize = 5;
b = (1/windowSize) * ones(1, windowSize);
b
a = 1;

y = filter(b,a,birdsAudioData);

%sound(birdsAudioData, birdsSampleRate);
sound(y, birdsSampleRate);
subplot(2,1,1)
xlabel('t')
ylabel('audioform')
plot(birdsAudioData)

subplot(2,1,2)
xlabel('t')
ylabel('audioform')
plot(y)