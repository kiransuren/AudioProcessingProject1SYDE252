function y = meanFilter(x,L)
    b = (1/L) * ones(1, L); % construct transfer function numerator
    a = 1;                  % construct transfer function denominator
    y = filter(b,a,x);      % apply transfer function on input signal
end