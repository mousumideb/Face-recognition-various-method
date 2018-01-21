
%%
clc
clear all
close all
%%
addpath('sub_function');
disp('Face Recognition method: Eigen face using PCA ');

%% test and training datapath

TrainDatabasePath = uigetdir('./train/', 'Select training database path' );
TestDatabasePath = uigetdir('./test/', 'Select test database path');



prompt = {'Enter test image name (a number between 1 to 10):'};

dlg_title = 'Input face image Face Recognition using PCA-Based Eigen Face';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.pgm');
I = imread(TestImage);
imshow(I)
title('Test Image');
Train = imageprocess(TrainDatabasePath);%A 2D matrix, containing all 1D image vectors.
[m, A, Eigenfaces] = Eigen_pca(Train);
Output = eigen_recog(TestImage, m, A, Eigenfaces);


SelectedImage = strcat(TrainDatabasePath,'\',Output);
SelectedImage = imread(SelectedImage);
figure,imshow(SelectedImage);
title('Matched Image from Training Dataset');

str = strcat('Matched image from training Dataset :  ',Output);
disp(str)
