function [new] = Init(filename)
clc;
close all;
[prev, spl_rt] = audioread(filename);
disp(spl_rt)
[m,n] = size(prev);
if n==2
    next=prev(:,1)+prev(:,2);
else
    next = prev;
end

audiowrite(filename,prev,spl_rt);

[p,q] = rat(16e3/spl_rt);
new=resample(next,p,q);
%sound(new,16e3);

% x=1:length(new);
% plot(x,new);
% grid on
end

