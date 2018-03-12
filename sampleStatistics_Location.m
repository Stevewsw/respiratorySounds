% function: statistic the location distribution of files
% things to be kept in mind: strcat(extend),dir,files,switch case,
% vital debug logs: cause 'case' do not use colon,so you need to break lines for statements sentences!  
% [NUM,TXT,RAW]=xlsread('E:\matCodes\mine\respiratorySounds\statistics.xlsx');

l = zeros(1,7);
myDir = 'D:\scientificresearch\data\ICBHI_final_database';
files = dir(strcat(myDir,'\*.wav')); 

 for i=1:length(files)
%   display(files(i).name(9:10))
    str = files(i).name(9:10);
    switch str
        case 'Tc' 
            l(1) = l(1) + 1;
        case 'Al'
            l(2) = l(2) + 1;
        case 'Ar'
            l(3) = l(3) + 1;
        case 'Pl'
            l(4) = l(4) + 1;
        case 'Pr'
            l(5) = l(5) + 1;
        case 'Ll'
            l(6) = l(6) + 1;
        case 'Lr'
            l(7) = l(7) + 1;
        otherwise
            display("error!")
            break
    end
        
 end