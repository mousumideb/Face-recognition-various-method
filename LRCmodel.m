%% Project Code : face recognition using Linear regression Classification model%%
%Course: Image Processing 
%Submitted by : Mousumi Deb
%
clc
clear all
close all
%
%% Training Image%%
N=64;
pathImm = './att_faces/s1/';
Imgs = dir([pathImm '*.pgm']);
numImgs = length(Imgs);
imName = [pathImm Imgs(1).name];
%Imm = rgb2gray(imread(imName));
Imm = imread(imName);



%%

X = [];

for ii=1:numImgs
    imName = [pathImm Imgs(ii).name];
    Imm = imread(imName);
    I=imresize(Imm,[N N],'bilinear');
    X = [X I(:)];
end
X=double(X);
%% for test image %%

N=64;
pathImm = './att_faces/s3/';
Imgs = dir([pathImm '*.pgm']);
numImgs = length(Imgs);
imName = [pathImm Imgs(1).name];
I = imread(imName);
test=imresize(I,[N N],'bilinear');
figure(),imshow(I),title('test image');
Y =[test(:)];
Y=double(Y);
%calculating beta matrix
betahat= inv(transpose(X)*X)*(transpose(X)*Y);
yhat= X*betahat;
error_euclideandistance = sum((Y-yhat).^2)


