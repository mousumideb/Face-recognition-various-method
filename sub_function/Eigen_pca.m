function [m, A, Eigenfaces] = Eigen_pca(Train)

%% Average image %%


m = mean(Train,2); 

Train_Number = size(Train,2);
%% Estimating the deviation of each image from mean image
A = [];  
for i = 1 : Train_Number
    temp = double(Train(:,i)) - m; % Computing the difference image for each image in the training set Ai = Ti - m
    A = [A temp]; % Merging all centered images
end

L = A'*A; % covariance matrix C=A*A'.
[V D] = eig(L); %  L=A'*A and C=A*A'.



L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end


Eigenfaces = A * L_eig_vec; % A: centered image vectors


end