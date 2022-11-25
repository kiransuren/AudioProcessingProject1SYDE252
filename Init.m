function [result] = Init(filename) 
    % Read sound file and determine sampling rate
    [data, spl_rt] = audioread(filename);
    disp(spl_rt) % Sampling rate
    
    % Adjust input sound to mono if it is stereo
    [m,n] = size(data);
    if n==2
        new_data=data(:,1)+data(:,2);
    else
        new_data = data;
    end
    
    % Play modified sound
    sound(new_data);
    
    % Write modified sound to a new file
    newfilename  = "New" + filename;
    audiowrite(newfilename,new_data,spl_rt);

    % Plot audio
    % plot(new_data);
    % grid on
    
    % Adjust sampling rate to 16KHz
    [p,q] = rat(16e3/spl_rt);
    result=resample(new_data,p,q);
end

