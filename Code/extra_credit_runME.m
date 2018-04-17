[train_imgs test_imgs] = extra_credit();
prompt = 'Select the test\n 1. Naive Bayes\n 2. KNN\n 3. PCA Naive Bayes\n 4. PCA KNN\n 5. LDA Naive Bayes\n 6. LDA KNN\n';
test_selected = input(prompt);
if test_selected == 1
    [test_accuracy] = naive_bayes(train_imgs,test_imgs);
    fprintf('The training accuracy is %f percent\n',test_accuracy * 100);
elseif test_selected == 2
    [test_accuracy K] = knn(train_imgs,test_imgs);
    fprintf('The training accuracy of KNN with k = %i is %f percent\n',K,test_accuracy * 100);
elseif test_selected == 3
    %Define percent of reduced feature
    prompt = 'Define the number of reduced features\n';
    red_per = input(prompt);
    [x_train_new x_test_new] = PCA(train_imgs,test_imgs,red_per);
    [test_accuracy] = naive_bayes(x_train_new,x_test_new);
    fprintf('The training accuracy isPCA Naive Bayes %f percent\n',test_accuracy * 100);
elseif test_selected == 4
    %Define percent of reduced feature
    prompt = 'Define the number of reduced features\n';
    red_per = input(prompt);
    [x_train_new x_test_new] = PCA(train_imgs,test_imgs,red_per);
    [test_accuracy K] = knn(x_train_new,x_test_new);
    fprintf('The training accuracy of PCA KNN with k = %i is %f percent\n',K,test_accuracy * 100);
elseif test_selected == 5
    %Define percent of reduced feature
    prompt = 'Define the number of reduced features\n';
    red_per = input(prompt);
    display('LDA feature reduction started');
    [x_train_new x_test_new] = LDA(train_imgs,test_imgs,red_per);
    display('LDA feature reduction ended');
    [test_accuracy] = naive_bayes(x_train_new,x_test_new);
    fprintf('The training accuracy with LDA is %f percent\n',test_accuracy * 100);
elseif test_selected == 6
    %Define percent of reduced feature
    prompt = 'Define the number of reduced features\n';
    red_per = input(prompt);
    display('LDA feature reduction started');
    [x_train_new x_test_new] = LDA(train_imgs,test_imgs,red_per);
    display('LDA feature reduction ended');
    [test_accuracy K] = knn(x_train_new,x_test_new);
    fprintf('The training accuracy of LDA KNN with k = %i is %f percent\n',K,test_accuracy * 100);
end