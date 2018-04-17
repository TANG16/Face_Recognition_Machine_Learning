function [test_accuracy K] = knn(train_imgs,test_imgs)
prompt = 'Select the value of K\n';
K = input(prompt);
% K = 1;
[feature pose_train label] = size(train_imgs);
[feature pose_test class] = size(test_imgs);

%% KNN starts
%Get the distance of each test image from each training image
display('Calculating distance from each training image');
for i = 1:label
    for j = 1:pose_test
        for k = 1:label
            for l = 1:pose_train
                D = pdist2(test_imgs(:,j,i)',train_imgs(:,l,k)','euclidean');
                solution(j,l,k,i) = norm(D);
            end
        end
    end
end
display('Distance calculated\n'); 
display('Starting Vector reshaping and minimum distance sorting');
% reshape solution vector obtained above to a 3 dimensional vector for ease
% of operation
[pose_test pose_train class class1] = size(solution);
ns = reshape(solution,[pose_test pose_train*class class1]);

%Sort the vector based on the minimum distance and get the indexes for the
%sorted distances and store them
for i = 1:class
    for j = 1:pose_test
        [value ind] = sort(ns(j,:,i),'ascend');
        solution1(j,:,i) = ind;
    end
end

%Get the vector of minimum distance index for each test sample based on the
%value of k inputed by the user
class_nn = ceil(solution1(:,[1:K],:)/pose_train);
display('Calculating the accuracy of the result');
%Check accuracy of the result
accuracy = 0;
for j = 1:class
    for k = 1:pose_test
        [a,b] = hist(class_nn(k,:,j),unique(class_nn(k,:,j)));
        [value ind] = max(a);
        if b(ind) == j
            accuracy = accuracy + 1;
        end
            
    end
end
display('Testing ended');
test_accuracy = accuracy/(pose_test*class);
end

