clear all;
prompt = 'Select the dataset\n 1. Data\n 2. Illumination\n 3. Pose\n';
dataset_selected = input(prompt);
%Define number of reduced feature
prompt = 'Define the percent of reduced features\n';
red_per = input(prompt);%80;

%% Divide data in training and test set and Perform LDA
%[train_imgs test_imgs] = get_data(dataset_selected);
[train_imgs test_imgs] = get_random_data(dataset_selected);
%train_imgs1 = train_imgs;
%test_imgs1 = test_imgs;

%for red_per = 1: size(train_imgs,3)
display('LDA feature reduction started');
[x_train_new x_test_new] = LDA(train_imgs,test_imgs,red_per);
display('LDA feature reduction ended');
%%
% ============================================= %
%          Feed the data to Naive Bayes         %
% ============================================= %

[test_accuracy] = naive_bayes(x_train_new,x_test_new);
fprintf('The training accuracy with LDA is %f percent\n',test_accuracy * 100);

%red_per
%xVal(red_per) = red_per;
%yVal(red_per) = test_accuracy*100;
%end
%plot(xVal, yVal);