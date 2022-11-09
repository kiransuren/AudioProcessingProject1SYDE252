function [count] = bpm(filename)
filename='Drum.wav';
sample=Init(filename);
count=0;
for i=0.5e4:length(sample)-0.5e4
    if sample(i)>0.5
        count=count+1;
    end
end
count=(count*60)/2