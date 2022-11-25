syms x;

L = 5;
H = (1/L) * (heaviside(x) - heaviside(x-L));

fplot(H, [-10,10]);
xlabel("t")
ylabel("h(t)")
title("Moving Average Filter Impulse Response with L = 5 (Continuous Domain)")
axis([-10 10 -2/L 2/L])


% x = [-10:1:10];
% 
% L = 5;
% H = (1/L) * (heaviside(sym(x)) - heaviside(sym(x-L)));
% heav = @(x) x >= 0;
% hNew = (1/L) * (heav(x) - heav(x-L));
% 
% stem(x, hNew);
% xlabel("t")
% ylabel("h(t)")
% title("Moving Average Filter Impulse Response with L = 5 (Discrete Domain)")
% axis([-10 10 -2/L 2/L])