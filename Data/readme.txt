The code consists of runMe files and function files.

All the runMe file will prompt the use to select the dataset. Also, before starting make sure that the path to dataset is set correctly to your local directory. Also, comment and uncomment to use the random training data feature in the codes.

runMe files -

mle_naive_bayes.m - Run this file to run the Bayes classifier.

knn_rule_test.m - Run this file to run the K-NN classifier with K = 1.

pca_mle_bayes.m - Run this file to run the PCA + Bayes classifier. The code will prompt the user to 
select the number of features to be processed. Select appropriate value.

pca_knn.m - Run this file to run the PCA + KNN classifier. The code will prompt the user to select the number of features to be processed. Select appropriate value.

lda_mle_bayes.m - Run this file to run the LDA + Bayes classifier. The code will prompt the user to select the number of features to be processed. Select appropriate value (less than C-1).

lda_knn_rule.m - Run this file to run the LDA + KNN classifier. The code will prompt the user to select the number of features to be processed. Select appropriate value (less than C-1).

extra_credit_runMe.m - Run this file to run the extra credit part. This will prompt the user to select the test to be performed, select appropriately.

Select the dataset as per the prompt and wait for the result to pop up.

Function Files - 

naive_bayes.m - File that contains the entire logic for Naive bayes implemenation

knn.m - File that contains the entire logic for KNN implemenation. Currently the K is set K = 1; This can be changed to either user defined K, by uncommenting some lines or just defining the variable.

PCA.m - File that contains the entire logic for PCA feature reduction

LDA.m - File that contains the entire logic for LDA feature reduction

extra_credit.m - File that contains the data formating to feed as training and test set

get_data.m - File that contains the logic for getting default set data in defined ratio of 2:1. Make changes here to run the variation in training parameters experiment.

get_random_data.m - File that contains the logic for getting the training and test dataset randomly again in 2:1 ratio.

It is not recommended to edit the function files.

