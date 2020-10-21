# Subsampling our data set
library(kernlab)
data(spam)
## Perform the subsampling
set.seed(3435)
trainIndicator = rbinom(4601, size=1,prob=0.5)
table(trainIndicator)

## Split data
trainSpam = spam[trainIndicator == 1,]
testSpam = spam[trainIndicator == 0,]

## Names
names(trainSpam)
head(trainSpam)

## Summaries
table(trainSpam$type)

## Plots
plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve+1) ~ trainSpam$type)

## Relationships between predictors
plot(log10(trainSpam[,1:4]+1))

## Clustering
hCluster <- hclust(dist(t(trainSpam[,1:57])))
plot(hCluster)

hCluster <- hclust(dist(t(log10(trainSpam[,1:57]+1))))
plot(hCluster)

## Statistical prediction/modeling
trainSpam$numType <- as.numeric(trainSpam$type) -1
costFunction <- function(x,y) sum(x != (y>0.5))
cvError = rep(NA,55)
library(boot)
for (i in 1:55){
        lmFormula = reformulate(names(trainSpam)[i], response = "numType")
        glmFit = glm(lmFormula, family = "binomial",data = trainSpam)
        cvError[i] = cv.glm(trainSpam, glmFit, costFunction,2)$delta[2]
}

## Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)]

## Use the best model from the group
predictionModel = glm(numType~charDollar, family = "binomial", data=trainSpam)

## Get predictions on the test set
predictionTest = predict(predictionModel, testSpam)
predictedSpam = rep("nonspam", dim(testSpam)[1])

## Classify as 'spam' for those with prob > 0.5
predictedSpam[predictionModel$fitted > 0.5] = "spam"

## Get a measure of uncertainty
## Classification table
table(predictedSpam, testSpam$type)

## Error rate
(61 + 458)/(1346+458+61+449)
