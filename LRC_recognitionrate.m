%% Project Code : face recognition using Linear regression Classification model%%
%Course: Image Processing 
%Submitted by : Mousumi Deb
%%
clc
clear all
close all
%%
%% Training Image%%

N = 200;% image size

pathImm = './att_faces/';

trainImages = {};
testImages = [];
testlabels = [];

%%

for ff=1:10
    
    folderName = ['s' num2str(ff)];
    pathFolder = [pathImm folderName '/'];
    X = [];
    for ii=1:5
        immName = [pathFolder num2str(ii) '.pgm'];
        Imm = imread(immName);
        %Imm = rgb2gray(imread(Imm))
        I=imresize(Imm,[N N],'bilinear');
        X = [X I(:)];
    end
    X = double(X);
    trainImages{1,ff} = X;
    
    for ii=6:10
        immName = [pathFolder num2str(ii) '.pgm'];
        Imm = imread(immName);
        I = imresize(Imm,[N N],'bilinear');
        testImages = [testImages I(:)];
        testlabels = [testlabels;ff];
      
    end
end
testImages = double(testImages);

%% testing image 

predLabel = zeros(size(testImages,2),1);
for ii=1:size(testImages,2)
    y = testImages(:,ii);
    err = zeros(1,length(trainImages));
    
    for jj=1:length(trainImages)
        X = trainImages{1,jj};
        beta = inv(X'*X)*X'*y;
        predy = X*beta;
        err(1,jj) = sum((y - predy).^2);
    end
    [~, best] = min(err);
    predLabel(ii,1) = best;
end

fprintf(' Recognition rate: %f\n', mean(double(predLabel == testlabels)) * 100);


