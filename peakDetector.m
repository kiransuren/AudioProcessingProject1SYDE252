% finds the peaks of an input signal around a certain window defined by L
function peakList = peakDetector(x, L)
    peakList = [];
    for j = 1+(L/2):size(x)-(L/2)
        isPeak = true;
        for k=(-L/2):(L/2)
            if x(j) < x(j+k)
                isPeak=false;
                break
            end
        end
        if(isPeak)
            peakList(end+1) = x(j);
        end
    end
end