function F = medianFilter(x, L)
    y = [];
    for i=1:length(x)
        section = [];
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
        y(i,1) = median(section);
    end
    F = y;
end
