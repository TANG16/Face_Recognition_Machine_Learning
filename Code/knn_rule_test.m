clear all;
prompt = 'Select the dataset\n 1. Data\n 2. Illumination\n 3. Pose\n';
dataset_selected = input(prompt);
%% Divide data in training and test set
[train_imgs test_imgs] = get_data(dataset_selected);
%[train_imgs test_imgs] = get_random_data(dataset_selected);
%% Perform KNN
[test_accuracy K] = knn(train_imgs,test_imgs);
fprintf('The training accuracy of KNN with k = %i is %f percent\n',K,test_accuracy * 100);