library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
library(jpeg)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
set.seed(40397224)
data(crabs)
?crabs
crabs$index=NULL
crabs$sex=NULL
crabs$sp=NULL
str(crabs)
summary(crabs)
km=kmeans(crabs,4)
nueva=data.frame(crabs,km$cluster)
write.table(nueva,"crabs.csv",sep=",")
