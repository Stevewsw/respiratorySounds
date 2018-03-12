% function: statistic the location distribution of files
% things to be kept in mind: how to access txt:fopen,textscan,fclose;how to form the scalar-based conditioning expression.
% vital debug logs: cause 'case' do not use colon,so you need to break lines for statements sentences!  
% author,date,open source under GPL license

% [NUM,TXT,RAW]=xlsread('E:\matCodes\mine\respiratorySounds\statistics.xlsx');

clear;

l = zeros(1,7);
myDir = 'D:\scientificresearch\data\ICBHI_final_database';
files = dir(strcat(myDir,'\*.txt')); 

pos = 0;
neg = 0;

for i=1:length(files)
    
    fileID = fopen(strcat(myDir,'\',files(i).name));
    C = textscan(fileID,'%f %f %f %f');
    fclose(fileID);
    
%   celldisp(C)
    
    if ( sum(C{1,3}) == 0 ) || ( sum(C{1,4}) == 0 )  %note : in scalar-based conditioning senstences, || not | ought to be used 
        pos = pos + 1;
    else
        neg = neg + 1;
    end
    
end