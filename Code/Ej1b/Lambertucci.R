library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
#EDA
data(Glass)
dim(Glass)
?Glass
summary(Glass)
summary(Glass$Type)
Glass$Type=as.character(Glass$Type)
Glass$Type[Glass$Type=="1"]="VentanaTipo1"
Glass$Type[Glass$Type=="2"]="VentanaEdificio"
Glass$Type[Glass$Type=="3"]="VentanaAuto"
Glass$Type[Glass$Type=="5"]="Recipiente"
Glass$Type[Glass$Type=="6"]="Vajilla"
Glass$Type[Glass$Type=="7"]="FaroAuto"
Glass$Type=factor(Glass$Type)
names(Glass)[names(Glass)=="Type"]="TipoDeVidrio"
summary(Glass)
plot(Glass$TipoDeVidrio,main="Gráfico de barras de Guido",col="blue")


#Partition
set.seed(40397224)
partition=createDataPartition(y=Glass$TipoDeVidrio,p=0.75,list=FALSE)
entreno=Glass[partition,]
testeo=Glass[-partition,]
summary(entreno)
head(entreno)
summary(testeo)
head(testeo)
dim(Glass);dim(entreno);dim(testeo)
# decision tree
arbol=rpart(TipoDeVidrio~.,entreno,method="class")
rpart.plot(arbol,extra=1,type=5,cex=0.8)
sum(arbol$frame$var == "<leaf>")
#es FaroAuto si el contenido de Bario es mayor igual a 0.4
confusionMatrix(pred,testeo$TipoDeVidrio)
vidrioAsignado=Glass[24,]
vidrioAsignado
predict(arbol,vidrioAsignado,type="class")
#Optimizacion
arbol$control
arbolGrande=rpart(TipoDeVidrio~.,entreno,method="class",cp=0,minsplit=0)
rpart.plot(arbolGrande,extra=1,type=5,cex=0.4)
plotcp(arbolGrande)
arbolPodado=prune(arbolGrande,cp=0.016)
pred=predict(arbolPodado,testeo,type="class")
confusionMatrix(pred,testeo$TipoDeVidrio)
rpart.plot(arbolPodado,extra=1,type=5,cex=0.6)

