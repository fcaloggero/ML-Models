# k-NN using caret: 
library(ISLR) 
library(caret)

# Split the data: 
data(iris) 
indxTrain <- createDataPartition(y = iris$Sepal.Length,p = 0.75,list = FALSE) 
training <- iris[indxTrain,] 
testing <- iris[-indxTrain,]

# Run k-NN: 
set.seed(400) 
ctrl <- trainControl(method="repeatedcv",repeats = 3) 
knnFit <- train(Species ~ ., data = training, method = "knn", trControl = ctrl, preProcess = c("center","scale"),tuneLength = 20) 
knnFit

#Use plots to see optimal number of clusters: 
#Plotting yields Number of Neighbours Vs accuracy (based on repeated cross validation) 
plot(knnFit)