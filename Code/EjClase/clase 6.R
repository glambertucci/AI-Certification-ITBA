library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
library(jpeg)
set.seed(16)
mm = mammals
mm = mm[-32,]
km=kmeans(mm,3)
nueva=data.frame(mm,km$cluster)
write.table(nueva,"mm.csv",sep=",")
km$size
Grupo1  = mm[km$cluster==1,]
Grupo2  = mm[km$cluster==2,]
Grupo3  = mm[km$cluster==3,]

boxplot(mm$body~km$cluster)
boxplot(mm$brain~km$cluster)
featurePlot(mm,y=as.factor(km$cluster),plot="boxplot",auto.key=TRUE)
