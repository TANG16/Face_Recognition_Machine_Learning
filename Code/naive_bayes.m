function [test_accuracy] = naive_bayes(train_imgs,test_imgs)
[feature pose_train label] = size(train_imgs);
[feature pose_test class] = size(test_imgs);
%% Training Stage
display('Training stage started');
% Calculate the mean of the data
mean_data = mean(train_imgs,2);
%Get the covariance for the data and fill in the quadratic discriminant
%parameters A, B and C
for i = 1:label
    b = train_imgs(:,:,i);
    sigma(:,:) = cov(b');
    %Smoothing
    sigma = eye(size(sigma,1)) + sigma;
    
    %%%Calculate the Discriminant function parameters
    %quadratic_param structure to store all the values
    quadratic_param.A(:,:,i) = -(0.5) * inv(sigma);
    quadratic_param.B(:,i)= inv(sigma) * mean_data(:,i);
    quadratic_param.C(i)= -(0.5)*mean_data(:,i)'*inv(sigma)*mean_data(:,i) - (0.5)*log(det(sigma));
end
display('Training stage ended');

%% Test stage
display('Testing stage started');
%Calculate the Discriminant value for each test image and select the 
%index with highest value of g as the class of the image
for j = 1:class
    for k = 1:pose_test
        for l = 1:label
            X = test_imgs(:,k,j);
            g = X' * quadratic_param.A(:,:,l) * X + quadratic_param.B(:,l)' * X + quadratic_param.C(l);
            solution(l) = g;
        end
        [value,index] = max(solution);
        solution1(k)=index;
    end
    solution2(j,:) = solution1; 
end

solution_new = solution2';
sol = [];
accuracy = 0;

for i = 1:label
    sol = solution_new(:,i);
    for j = 1:pose_test
        if sol(j)==i
            accuracy = accuracy + 1;
        end
    end
end
display('Testing ended');
test_accuracy = accuracy/(pose_test*label);
end