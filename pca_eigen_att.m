%% Project Code : face recognition%%
%Course: Image Processing 
%Submitted by : Mousumi Deb
%%
clc
clear all
close all
%%


numsubject = 40;% number of the subject 
trainimageset = 1:5;
testingRange = 6:10;
allRange = 1:10;
count = 0;

%% Estimate mean image 
meanVector = 0;
S = [];
for n = 1:numsubject
    classSamples{n} = [];
    for trainingIdx = trainimageset
        img = im2double(imread(sprintf('./att_faces/s%d/%d.pgm', n, trainingIdx)));
       [r c]= size(img);
        imgVector = img(:);% column vector
        meanVector = meanVector + imgVector;
        S = [S imgVector-meanVector];
        classSamples{n}(:,end+1) = imgVector - meanVector;
        count = count + 1;
    end %
end % 
meanVector = meanVector / count;
figure(1); clf; set(gcf, 'Color', 'white');
imshow(reshape(meanVector, [r c])); title('Average Image Face');

%% Estimate PCA eigenvectors 
[V,D] = eig(S.' * S);
PCAEigenvectors = S*V(:,end:-1:1);
for n = 1:size(PCAEigenvectors,2)
    PCAEigenvectors(:,n) = PCAEigenvectors(:,n) / norm(PCAEigenvectors(:,n));
end % n
figure(2); clf; set(gcf, 'Color', 'white');
for n = 1:10
    subplot(2,5,n);
    imshow(reshape(PCAEigenvectors(:,n), [r c]),[]); 
    title(sprintf('Eigenface %d', n));
end 


