function [x_train_new,x_test_new] = PCA(train_imgs,test_imgs,red_per)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[feature pose_train label] = size(train_imgs);
[feature pose_test class] = size(test_imgs);

% ============================================= %
%   PCA starts here(Dimensionality Reduction)   %
% ============================================= %

%Calculate the mean of all the data
mean_pca = mean(mean(train_imgs,3),2);

% Get the x_hat i.e. x - mean
for i = 1:label
    x_train(:,:,i) = train_imgs(:,:,i)- mean_pca;
end
k = 1;
for i = 1 : label
    for j = 1 : pose_train
    x_train_hat(:,k) = x_train(:,j,i);
    k = k+1;
    end
end

sigma_pca(:,:) = cov(x_train_hat');

[U V W] = svd(sigma_pca);
%red = ceil(red_per/100 * feature);
U_new  = U(:,1:red_per);
k = 1;
for i = 1:label
    for j = 1:pose_train
    x_train_new(:,j,i) = U_new'*x_train_hat(:,k);
    k = k+1;
    end
end

for i = 1:label
    x_test(:,:,i) = test_imgs(:,:,i)- mean_pca;
end

for i = 1: label
    for j = 1:pose_test
    x_test_new(:,j,i) = U_new'* x_test(:,j,i);
    end
end
end

