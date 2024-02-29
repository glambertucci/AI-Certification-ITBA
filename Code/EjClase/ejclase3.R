library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
set.seed(15)
data(Zoo)
dim(Zoo)
View(Zoo)
Zoo=Zoo[-30,]
str(Zoo)
Zoo$legs=factor(Zoo$legs)
Zoo[Zoo$legs==5,]
partition=createDataPartition(y=Zoo$legs,p=0.76,list=FALSE)
entreno=Zoo[partition,]
summary(entreno$legs)
summary(testeo$legs)
testeo=Zoo[-partition,]
arbol=rpart(legs~.,entreno,method="class")
rpart.plot(arbol,extra=1,type=5)
pred =predict(arbol,testeo,type="class")
confusionMatrix(pred,testeo$legs)
