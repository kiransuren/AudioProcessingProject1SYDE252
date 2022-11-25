function [count] = bpm(x, L)
sample=Init(x);
final=meanFilter(sample,L);
count=0;
for i=0.5e4:length(sample)-0.5e4
    if sample(i)>0.16
        count=count+1;
    end
end
disp((count*60)/2)
x=1:length(final);
plot(final);
grid on
end