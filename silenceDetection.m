function F = silenceDetection(x, L, threshold)
    % Apply the median filter
    y = medianFilter(x,L);
    for i=1:length(y)
        % For a value that is between the threshold, consider it as part of
        % a silent region (=0), otherwise give it a value of 1
        if y(i) < threshold && y(i) > -threshold 
            result(i,1) = 0;
        else
            result(i,1) = 1;
        end
    end
    F = result;
end