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
imagen=readJPEG("5.jpg")#https://www.smliv.com/food/makins-from-maters/
plot(as.raster(imagen))
gris=(imagen[,,1]+imagen[,,2]+imagen[,,3])/3
plot(as.raster(gris))
rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
km=kmeans(base,3)
km$centers

plot(10,10,pch=19,cex=10,col=rgb(km$center[1,1],km$center[1,2],km$center[1,3]))
points(11,11,pch=19,cex=10,col=rgb(km$center[2,1],km$center[2,2],km$center[2,3]))
points(12,12,pch=19,cex=10,col=rgb(km$center[3,1],km$center[3,2],km$center[3,3]))

segmR=rojo; segmV=verde; segmA=azul
segmR[km$cluster==1]=km$center[1,1]
segmV[km$cluster==1]=km$center[1,2]
segmA[km$cluster==1]=km$center[1,3]

segmR[km$cluster==2]=km$center[2,1]
segmV[km$cluster==2]=km$center[2,2]
segmA[km$cluster==2]=km$center[2,3]

segmR[km$cluster==3]=km$center[3,1]
segmV[km$cluster==3]=km$center[3,2]
segmA[km$cluster==3]=km$center[3,3]
segmentada=imagen
segmentada[,,1]=segmR 
segmentada[,,2]=segmV 
segmentada[,,3]=segmA
plot(as.raster(segmentada))




rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
km=kmeans(base,4)
segmR=rojo 
segmV=verde
segmA=azul
segmR[km$cluster==1]=km$center[1,1]
segmV[km$cluster==1]=km$center[1,2]
segmA[km$cluster==1]=km$center[1,3]

segmR[km$cluster==2]=km$center[2,1]
segmV[km$cluster==2]=km$center[2,2]
segmA[km$cluster==2]=km$center[2,3]

segmR[km$cluster==3]=km$center[3,1]
segmV[km$cluster==3]=km$center[3,2]
segmA[km$cluster==3]=km$center[3,3]

segmR[km$cluster==4]=km$center[4,1]
segmV[km$cluster==4]=km$center[4,2]
segmA[km$cluster==4]=km$center[4,3]

segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))


