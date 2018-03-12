% 1.function: statistic the location distribution of files
% 2.things to be kept in mind: cell2mat,size(X,2),\n, disp other than display, and string is always professional!
% 3.vital debug logs: cant use more than one equal signs '=='! %3.1f may cause fatal error!
% 4.author,date,open source under GPL license

% [NUM,TXT,RAW]=xlsread('E:\matCodes\mine\respiratorySounds\statistics.xlsx');

l = zeros(1,7);
myDir = 'D:\scientificresearch\data\ICBHI_final_database';
files = dir(strcat(myDir,'\*.txt')); 

sum = 0;
sumCrackles = 0;
sumWheezes = 0;
sumCracklesWheezes = 0;
sumNormals = 0;

for i=1:length(files)
    
    fileID = fopen(strcat(myDir,'\',files(i).name));
    C = textscan(fileID,'%f %f %f %f');
    fclose(fileID);
    
    mat = cell2mat(C(1));
    [m,~] = size(mat); % ~is referred to as the ignored para.
    sum = sum + m;
    
    matCrackles = cell2mat(C(3));
    matWheezes = cell2mat(C(4));
    [n,~] = size(matCrackles); 
    [p,~] = size(matWheezes);
    
    if(~(m==n && n==p))
        fprintf('\n error! \n')
        break;
    else
%       temp = dec2bin(0,2); % note only for nonegative integer;2 represent that there r at least two bits.
        for j = 1:m
            
            temp = strcat( num2str( matCrackles(j) ),num2str( matWheezes(j) ) );
%           disp(temp)
            
            switch temp
                case '00'
                    sumNormals = sumNormals + 1;
                case '11'
                    sumCracklesWheezes = sumCracklesWheezes + 1;
                    sumCrackles = sumCrackles + 1;
                    sumWheezes = sumWheezes + 1;
                case '10'
                    sumCrackles = sumCrackles + 1;
                case '01'
                    sumWheezes = sumWheezes + 1;
                otherwise
                    disp('error occurred!') % break lines automatically!
                    disp(temp)
                    break;
            end
     
        end
    end    
end

fprintf('total cycles: %d \n',sum)
fprintf('normal cycles: %d \n',sumNormals)
fprintf('crackle cycles: %d \n',sumCrackles)
fprintf('wheezes cycles: %d \n',sumWheezes)
fprintf('overlapped cycles: %d \n',sumCracklesWheezes)