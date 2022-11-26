function [count] = bpm(x, L)
sample=Init(x);
%final variable that stores the signal smoothed by the mean filter
final=meanFilter(sample,L);
%variable that stores the count incrementer
count=0;
%for loop that detects peaks in all samples of the signal that are greater
%than 0.16 and for each peak detected, the count variable is incremented
for i=0.5e4:length(sample)-0.5e4
    if sample(i)>0.16
        count=count+1;
    end
end
%beats converted to beats per minute format
disp((count*60)/2)
%plots the signals
x=1:length(final);
plot(final);
xlabel("Sampling Rate");
ylabel("Amplitude");
title("Drum Audio with Mean Filter");
grid on
end