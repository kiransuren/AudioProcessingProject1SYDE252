function F = silenceDetection(x, L, threshold)
    y = medianFilter(x,L);
    for i=1:length(y)
        if y(i) < threshold && y(i) > -threshold 
            result(i,1) = 0;
        else
            result(i,1) = 1;
        end
    end
    F = result;
end