clear;

Mat2Json('data/Data_COBRE.mat');
Mat2Json('data/Data_ABIDE1.mat');
Mat2Json('data/Data_NKI.mat');

function Mat2Json(filename)
% load orginal fmri data
FileData = load(filename); 

% access first table
fns = fieldnames(FileData);
data = FileData.(fns{1});

% Get AVG of table
for curRowIndex = 1:height(data)
   data.AAL2{curRowIndex,:} = mean(data.AAL2{curRowIndex,:}(:,:));
   data.AAL2_bilateral{curRowIndex,:} = mean(data.AAL2_bilateral{curRowIndex,:}(:,:));
   data.LAIRD{curRowIndex,:} = mean(data.LAIRD{curRowIndex,:}(:,:));
end
    
% Get first 9 columns
currenTable = data(1:end,1:9);
JSONFILE_name= sprintf('data/%s.json',fns{1}); 
fid=fopen(JSONFILE_name,'w');
encodedJSON = jsonencode(currenTable,'PrettyPrint',true); 
fprintf(fid, encodedJSON);

% Close Open Files
fclose('all');
clear;
end



