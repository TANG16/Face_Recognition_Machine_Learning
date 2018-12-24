function [x_train_new,x_test_new] = LDA(train_imgs,test_imgs,red_per)
[feature pose_train label] = size(train_imgs);
[feature pose_test class] = size(test_imgs);

% ============================================= %
%   LDA starts here(Dimensionality Reduction)   %
% ============================================= %

%Calculate the mean of all the data
mean_all_data = mean(mean(train_imgs,3),2);

%Calculate the mean of all classes
mean_classwise = mean(train_imgs,2);

%Calulate the within class scatter
% s_i = (x_i - mu) * (x_i - mu)'
% Compute Total within class scatter Sw i.e. Sw = S1 + S2 + S3 + ... + Sc
s_w = zeros(feature,feature); 
for i = 1:label
    train_x(:,:,i) = train_imgs(:,:,i)- mean_classwise(:,:,i);
end
for i = 1:label
    s_i = zeros(feature,feature);
    for j = 1:pose_train
        temp(:,:) = train_x(:,j,i) * train_x(:,j,i)';
        s_i= s_i + temp;
    end
    s_w = s_w + s_i;%sum_multi_matrix(temp,pose_train);
end
s_w = s_w + eye(feature);

%Calculate the between class scatter
%%s_b = summation(n * (mu_k - mu) * (mu_k - mu)')
s_b = zeros(feature, feature);
for i = 1:label
    s_b(:,:) =  s_b(:,:) + pose_train * (mean_classwise(:,:,i) - mean_all_data(:,:)) * (mean_classwise(:,:,i) - mean_all_data(:,:))';
end

%Get the w matrix i.e. w = Sb/Sw
w = inv(s_w)*s_b;
%K = ceil(red_per/100 * feature);
[evec, eval] = eigs(w,red_per);
w_lda = evec;

for i = 1:label
    for j = 1:pose_train
    x_train_new(:,j,i) = w_lda'* train_imgs(:,j,i);
    end
end
for i = 1: label
    for j = 1:pose_test
    x_test_new(:,j,i) = w_lda'* test_imgs(:,j,i);
    end
end
end