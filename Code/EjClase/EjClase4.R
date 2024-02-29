library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
set.seed(15)
base=data(crabs)
#borro lo inutil
crabs$index=NULL
crabs$sex=NULL
# set seed
#eda  

set.seed(15)
partition=createDataPartition(y=crabs$sp,p=0.8,list=FALSE)
entreno=crabs[partition,]
testeo=crabs[-partition,]
summary(crabs$sp)
summary(entreno$sp)
summary(testeo$sp)
arbol=rpart(sp~.,entreno,method="class")
rpart.plot(arbol,extra=1,type=5)
pred=predict(arbol,testeo,type="class")
confusionMatrix(pred,testeo$sp)

#Red neuronal
library(nnet)
set.seed(123);red=nnet(sp~.,entreno,size=10,maxit=10000)
predred=predict(red,testeo,type="class")
confusionMatrix(factor(predred),testeo$sp)
# Vamos a tratar de optimizar el arbol de decision!!
# pre poda, no se deja desarrollar el arbol de desicion
#pos poda no se deja desarrollar el arbol de desicion y luego se selecciona un nivel para tratar de mejorar
arbol$control
arbol=rpart(sp~.,entreno,method="class",minsplit=0,cp=0)
rpart.plot(arbol,extra=1,type=5)
pred=predict(arbol,testeo,type="class")
confusionMatrix(pred,testeo$sp)
plotcp(arbol)
arbolPodado15=prune(arbol,cp=0.0088)
rpart.plot(arbolPodado15,extra=1,type=5)

install.packages("ISLR")
library(ISLR)
data(Default)
head(Default)
dim(Default)
