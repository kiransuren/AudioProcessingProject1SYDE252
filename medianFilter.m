function y = medianFilter(x,L)
    medianWindow = zeros(L,1);

    if(mod(L,2) == 0)
        %even, split weighting between two middle numbers
        medianWindow(L/2) = 0.5;
        medianWindow((L/2)+1) = 0.5;
    else
        %odd, impulse at middle
        medianWindow(round(L/2)) = 1;
    end
    y = conv(medianWindow,x);
    
end