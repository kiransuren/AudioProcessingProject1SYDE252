function F = medianFilter(x, L)
    y = [];
    for i=1:length(x)
        section = []; % Stores the section the median should be taken on
        
        % For an index value that doesn't exist, consider the value
        % as 0, otherwise take the value at the valid index
        if i < L        
            for k=1:(L-i)
                section(end+1,1) = 0;
            end
            for m=1:i
                section(end+1,1) = x(m);
            end
        end 
        if i >= L
            for j=(i-L+1):i
                section(end+1,1) = x(j);
            end
        end
        
        % Get the median for the section
        y(i,1) = median(section);
    end
    F = y;
end
