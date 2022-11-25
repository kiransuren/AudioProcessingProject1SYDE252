function F = silenceDetection(window_size, data, threshold)
    y = medianFilter(window_size,data);
    for i=1:length(y)
        if y(i) < threshold && y(i) > -threshold 
            result(i,1) = 0;
        else
            result(i,1) = 1;
        end
    end
    F = result;
end