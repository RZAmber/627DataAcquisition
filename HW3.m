%Task1
pwd
cd /Users/apple/SIT/2016S/627/week/week5/hw3
clear all
close all
load dataSet_1.mat
%get the logistic regression coefficients
factors=glmfit(predictor,response,'binomial');
%get the logistic regression probability vector
prob=glmval(factors,predictor,'logit')
%use response, probability and 'perfcurve' function to draw ROC
[X,y,thre,AUC]=perfcurve(response,prob,1);
figure(1);
plot(X,y);
title('Figure 1:ROC Curve');

%Task2.1
clear all;
close all;
pwd
load dataSet_1.mat
tr_pre=predictor(1:3000,:);
va_pre=predictor(3001:4000,:);
tr_res=response(1:3000,:);
va_res=response(3001:4000,:);
factors_tr=glmfit(tr_pre,tr_res,'binomial');
prob_tr=glmval(factors_tr,tr_pre,'logit')
[X,y,thre,AUC]=perfcurve(tr_res,prob_tr,1);
figure(1);
plot(X,y);
title('Figure 2:ROC Curve of training data');

%2.2
prob_va=glmval(factors_tr,va_pre,'logit')
[X,y,thre,AUC]=perfcurve(va_res,prob_va,1);
figure(1);
plot(X,y);
title('Figure 3:ROC curve of validation data');
[AUC]