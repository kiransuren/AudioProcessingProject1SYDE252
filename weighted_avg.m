function[final] = weighted_avg(filename)
filename='Drum.wav';
sample=Init(filename);

%{
win_arr = 1 : 2 : 30
for k = 1 : length(win_arr)
    w=gausswin(k);
    s=sum(w,'all');
    bk=w/s;
    final=filter(bk,1,sample)
    sad(k) = sum(abs(final - sample))
end
%}

win=25;
w=gausswin(win);
s=sum(w,'all');
bk=w/s;
final=filter(bk,1,sample)
sound(final, 16e3)

x=1:length(final);
plot(x,final)
%plot(win_arr,sad,'b*-', 'LineWidth', 2);
grid on;