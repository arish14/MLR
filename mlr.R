setwd("G:\\MLR")

#Reading the dataset
mlr <- read.csv("data2.csv")

#Encoding the categorical data
mlr$State = factor(mlr$State, levels = c('New York','California','Florida'),labels = c(1,2,3))
mlr$State

#Splitting the dataset into trainging and testing test
library(caTools)
set.seed(123)
split = sample.split(mlr$Profit, SplitRatio = 0.8)
train_set = subset(mlr, split==TRUE)
test_set = subset(mlr, split==FALSE)

#Multiple regressio model
regressor = lm(formula = Profit ~ ., data = train_set)

#Predicting the test results
y_pred = predict(regressor, newdata = test_set)

print(y_pred)