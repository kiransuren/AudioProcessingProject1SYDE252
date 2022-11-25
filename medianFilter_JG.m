function F = medianFilter_JG(data, window_size)
    y = [];
    for i=1:length(data)
        section = [];
        if i < window_size        
            for k=1:(window_size-i)
                section(end+1,1) = 0;
            end
            for m=1:i
                section(end+1,1) = data(m);
            end
        end
        if i >= window_size
            for j=(i-window_size+1):i
                section(end+1,1) = data(j);
            end
        end
        y(i,1) = median(section);
    end
    F = y;
end
