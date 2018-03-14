% function: decompose the respiratory sounds in a EMD way.
% things to be kept in mind: how to access txt:fopen,textscan,fclose;how to form the scalar-based conditioning expression.
% vital debug logs: cause 'case' do not use colon,so you need to break lines for statements sentences!  
% author,date,open source under GPL license


myDir = 'D:\scientificresearch\data\ICBHI_final_database';
files = dir(strcat(myDir,'\*.wav')); 

for i=1:length(files)
    filename = strcat(myDir,'\',files(i).name);
    [y,Fs] = audioread(filename);
    [~,n] = size(y);
    plot_hht(y,Fs);
    
    %uncompleted!!

    break;
%     if(Fs ~= 4000)
%         fprintf('\n the Fs of %s is %d Hz \n',filename,Fs)
%         plot(y);
%         break;
%     end
    
end

% i dont wanna resample casue it will aliasing the spectrum.
