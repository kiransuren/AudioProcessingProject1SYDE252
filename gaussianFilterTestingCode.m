[birdsAudioData, birdsSampleRate] = audioread('Birds.wav');

size(birdsAudioData,2)       % 1 channels -> stereo
y = medianFilter(birdsAudioData,10);

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