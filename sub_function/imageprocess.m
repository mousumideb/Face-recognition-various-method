function Train = imageprocess(TrainDatabasePath)

TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;
for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end

Train= [];
%% Training image feautre vector saving train[]%%
for i = 1 : Train_Number
    str = int2str(i);
    str = strcat('\',str,'.pgm');
    str = strcat(TrainDatabasePath,str);
    
    img = imread(str);
%    img = rgb2gray(img);
  

    [width height] = size(img);

    
    temp = reshape(img',width*height,1);   % Reshaping 2D images into 1D image vectors
   Train = [Train temp]; % 'T' grows after each turn   
  
end

end

