function y = meanFilter(x,L)
    b = (1/L) * ones(1, L);
    a = 1;
    y = filter(b,a,x);
end