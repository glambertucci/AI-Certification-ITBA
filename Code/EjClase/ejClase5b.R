library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
library(jpeg)
x=rep(0,100)
y=x
z=x
pizarra=cbind(x,y,z)
plot(as.raster(pizarra))
#purple
rojo=rep(160/255,100)#PRENDO ROJOJ
verde=rep(32/255,100)#apago verde
azul=rep(240/255,100)#apago azul


rojo=rep(1,100)#PRENDO ROJOJ
verde=rep(1,100)#apago verde
azul=rep(0,100)#apago azul


imagen=array(c(rojo,verde,azul),dim=c(100,1,3))
plot(as.raster(imagen))

library(jpeg)
imagen=readJPEG("joaquin.jpeg")
plot(as.raster(imagen))
rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])     
base=data.frame(rojo,verde,azul)
set.seed(123);
km=kmeans(base,2)
#Reconstruir la imagen segmentada
segmR=rojo
segmV=verde
segmA=azul
segmR[km$cluster==1]=km$center[1,1]
segmV[km$cluster==1]=km$center[1,2]
segmA[km$cluster==1]=km$center[1,3]
segmR[km$cluster==2]=km$center[2,1]
segmV[km$cluster==2]=km$center[2,2]
segmA[km$cluster==2]=km$center[2,3]
segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada2g.jpg")
imagen=readJPEG("joaquin.jpeg")
rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
set.seed(123);km=kmeans(base,3)
#Reconstruir la imagen segmentada
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
segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada3g.jpg")
imagen=readJPEG("joaquin.jpeg")
rojo=as.vector(imagen[,,1])
verde=as.vector(imagen[,,2])
azul=as.vector(imagen[,,3])
base=data.frame(rojo,verde,azul)
set.seed(123);km=kmeans(base,3)
#Reconstruir la imagen segmentada
segmR=rojo
segmV=verde
segmA=azul
segmR[km$cluster==1]=1
segmV[km$cluster==1]=0
segmA[km$cluster==1]=0
segmR[km$cluster==2]=0
segmV[km$cluster==2]=1
segmA[km$cluster==2]=0
segmR[km$cluster==3]=0
segmV[km$cluster==3]=0
segmA[km$cluster==3]=1
segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada3col.jpg")
#Reconstruir la imagen segmentada
segmR=rojo
segmV=verde
segmA=azul
# segmR[km$cluster==1]=1
# segmV[km$cluster==1]=0
# segmA[km$cluster==1]=0
segmR[km$cluster==2]=0
segmV[km$cluster==2]=1
segmA[km$cluster==2]=0
segmR[km$cluster==3]=0
segmV[km$cluster==3]=0
segmA[km$cluster==3]=1
segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada4.jpg")
#Reconstruir la imagen segmentada
segmR=rojo
segmV=verde
segmA=azul
# segmR[km$cluster==1]=1
# segmV[km$cluster==1]=0
# segmA[km$cluster==1]=0
# segmR[km$cluster==2]=0
# segmV[km$cluster==2]=1
# segmA[km$cluster==2]=0
segmR[km$cluster==3]=1
segmV[km$cluster==3]=1
segmA[km$cluster==3]=1
segmentada=imagen
segmentada[,,1]=segmR
segmentada[,,2]=segmV
segmentada[,,3]=segmA
plot(as.raster(segmentada))
writeJPEG(segmentada,"segmentada5.jpg")
