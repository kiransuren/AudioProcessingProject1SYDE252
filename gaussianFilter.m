function y = gaussianFilter(x,L)
    % get normalized gauss window coefficients
    b = (1/L) * (gausswin(L) / sum(gausswin(L)));
    a = 1;
    y = filter(b,a,x);
end