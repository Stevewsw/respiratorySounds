myDir = 'D:\scientificresearch\data\ICBHI_final_database';
files = dir(strcat(myDir,'\*.wav')); 

for i=1:length(files)
    filename = strcat(myDir,'\',files(i).name);
    [y,Fs] = audioread(filename);
    [~,n] = size(y);
    
% having checked, no double-channel 
    if (n ~= 1)
        disp('error occurred!')
        break;
    end
    
    if(Fs ~= 4000)
        fprintf('\n the Fs of %s is %d Hz \n',filename,Fs)
        plot(y);
        break;
    end
    
end

% i dont wanna resample casue it will aliasing the spectrum.
