# Unit 11 - Risky Business
 
![Credit Risk](Images/credit-risk.jpg)

## Background

Mortgages, student and auto loans, and debt consolidation are just a few examples of credit and loans that people seek online. Peer-to-peer lending services such as Loans Canada and Mogo let investors loan people money without using a bank. However, because investors always want to mitigate risk, a client has asked that you help them predict credit risk with machine learning techniques.

In this assignment several machine learning models will be built and evaluated to predict credit risk using data you'd typically see from peer-to-peer lending services. Credit risk is an inherently imbalanced classification problem (the number of good loans is much larger than the number of at-risk loans), so different techniques will be needed for training and evaluating models with imbalanced classes. The imbalanced-learn and Scikit-learn libraries will be used to build and evaluate models using the two following techniques:

1. [Resampling](#Resampling)
2. [Ensemble Learning](#Ensemble-Learning)

- - -

### Files

[Resampling Starter Notebook](Starter_Code/credit_risk_resampling.ipynb)

[Ensemble Starter Notebook](Starter_Code/credit_risk_ensemble.ipynb)

[Lending Club Loans Data](Resources/LoanStats_2019Q1.csv.zip)

- - -

### Summary

#### Resampling
In this part, the [lending_data](Resouces/lending_data.csv) is used for classification. Firstly, loan status (y) is the target value to be classified based on several features (X) . Firstly, different resampling methods (oversampling, undersampling and combination) have been used to balance the target value. Then, logistic regression model is built based on these resampled dataset. 

It is found that 

1. Both oversampling and combination sampling models had the best accuracy score which was about 0.9935.

2. All models except for simple logistic regression have a good recall score at 0.99.

3. All models except for simple logistic regression have a good geo score at 0.99.

#### Ensemble Learning
In the second part, the loan_status of [quarterly data from LendingClub](Resources/LoanStats_2019Q1.csv) is classified by using Balanced Random Forest Classifier and the Easy Ensemble Classifier models. The dataframe is preprocessed and cleaned for machine learning. Some columns contain no information are dropped and those contain strings are encoded. 

The results of two models show that 

1. Easy Ensemble Classifier had the best balanced accuracy score at around 0.93.

2. Easy Ensemble Classifier had better recall score with high_risk at 0.91 and low_risk at 0.95

3. Easy Ensemble Classifier had the best geometric mean score at 0.93

4. Principal received to date(total_rec_prncp), Last total payment amount(last_pymnt_amnt) and Payments received to date for portion of total amount funded by investors(total_pymnt_inv) are top three features.




