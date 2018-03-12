%  x=xlsread('F:\HCP_Preprocessed\Behavior_Q2.xlsx','Q2','g2:g135');
[NUM,TXT,RAW]=xlsread('E:\matCodes\mine\respiratorySounds\Behavior_Q2.xlsx');
substract= zeros(125,1);
cnt = 1;
for i=2:135
if(char(TXT(i,7))=='M')
    A = char(TXT(i,1));
    x = A(strfind(A,'DCF')+4:strfind(A,'DCF')+9);
    substract(cnt) = str2double(x);
    cnt = cnt + 1;
end
end
myDir = 'E:\Documents\journal\data\fcs\0.00';
destDir = 'E:\Documents\journal\smale';
files = dir('E:\Documents\journal\data\fcs\0.00\*.nii'); 
cnt = cnt - 1;
figure2 = '.nii';
for k=1:cnt
    figure1 = num2str(substract(k));
    for i=1:length(files) 
        if (strcmp(files(i).name(2:7),figure1)==1&&strcmp(files(i).name(strfind(files(i).name,'.nii'):strfind(files(i).name,'.nii')+3),figure2)==1)  
            disp(files(i).name);
            original = [myDir,'\'];
            original = [original,files(i).name];
%             disp(original)
            copyfile(original, destDir); 
           % return;
        end
    end
end