library(caret)
setwd("~/GitHub/AI-Certification-ITBA/Code/EjClase")
base=read.csv("./Advertising.csv")
head(base)
dim(base)
str(base)
summary(base)
View(base)


deudas=c(2,1,3,4,7,5,3,3,3,1,2,1,3,4,7,5,3,3,3,1)

monto=c(20,30,40,20,30,40,20,30,40,10,20,30,40,20,30,40,20,30,40,10)

seAsigna=c("SI","SI","SI","SI","NO","SI","SI","SI","SI","SI","SI","SI","SI","SI","NO","SI","SI","SI","SI","SI")

seAsigna=factor(seAsigna)

base=data.frame(deudas,monto,seAsigna)
library(rpart)
library(MASS)
install.packages("rpart.plot")
library(rpart.plot)
mytree=rpart(seAsigna~deudas+monto,base,method="class",minsplit=0)
#Si fuere continuo seria regresion
rpart.plot(mytree,type=5,extra=1)
#podar el AdD
mytree$control
#el modelo es una cagada, pero en el minsplit me dice que spltiea solo si tiene 20, yo le voy a decir pslitea papi
