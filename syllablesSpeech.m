[speechAudioData, speechSampleRate] = audioread('Speech.wav');

size(speechAudioData,2)     % 1 channel -> mono
%sound(speechAudioData(1:33388), speechSampleRate);


windowSize = 25;
b = (1/windowSize) * ones(1, windowSize);
a = 1;
y = filter(b,a,speechAudioData);

peakList = peakDetector(y, 4);
peakList = peakList';
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
peakList = filter(b,a,peakList);
finalList = findpeaks(peakList);
%peakList = peakList'

p = 0;
indexlist = [];
largest = 0;
big = false;
for i =1:size(peakList,1)
    if(peakList(i) > largest && peakList(i) > 0.005)
        largest = peakList(i);
        big = true;
    elseif(peakList(i) < largest && big == true)
        p = p+1;
        indexlist(end+1) = i;
        big = false;
        largest=0;
    end
end

subplot(3,1,1)
xlabel('t')
ylabel('audioform')
plot(speechAudioData)

subplot(3,1,2)
xlabel('t')
ylabel('audioform')
plot(peakList)

subplot(3,1,3)
xlabel('t')
ylabel('audioform')
plot(finalList)
