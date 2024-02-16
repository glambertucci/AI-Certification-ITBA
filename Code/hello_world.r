#Cargo libreria
library(MASS)
#Cargo la data
data(crabs)
#Borro los datos innecesarios
crabs$index=NULL
crabs$sex=NULL
#Info del dataset
summary(crabs)
str(crabs)
summary(crabs$sp)
#Grafico
hist(crabs$CL, main="Cangrejos", col=rainbow(20))
plot(crabs$sp,col=c("blue","orange"))
library(caret)
xyplot(crabs$CL~crabs$CW,crabs,groups=sp,xlab='Ancho del caparazón',ylab='Largo del caparazón', par.settings=list(superpose.symbol=list(pch=19)),auto.key=T)
 
       
       