library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
mtcars
set.seed(8)
km = kmeans(mtcars,5)
km$cluster
nueva=data.frame(mtcars,km$cluster)
plot(nueva)
write.table(nueva,"autos.csv",sep=",")
plot(mtcars$mpg,mtcars$hp,pch=19,col=km$cluster)
identify(mtcars$mpg,mtcars$hp,labels = rownames(mtcars))

#kmeans
#determinar la catnidad de gruposo N
#calcular N CM al azar
#agrupar los elementos mas cercanos a cada CM
#lugeo calculo los CM de los nuevso grupos
#vuelvo a agrupar por los que quedan cerca
#y repito hasta que queda separado