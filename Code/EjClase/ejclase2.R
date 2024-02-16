library(caret)
library(MASS)
base=data(crabs)
#borro lo inutil
crabs$index=NULL
crabs$sex=NULL
# set seed
set.seed(15)
partition=createDataPartition(y=crabs$sp,p=0.6,list=FALSE)
entreno=crabs[partition,]
testeo=crabs[-partition,]
summary(crabs$sp)
summary(entreno$sp)
summary(testeo$sp)
cangrejo=crabs[35,]
cangrejo
arbol=rpart(sp~.,entreno,method="class")
rpart.plot(arbol,extra=1,type=5)
pred=predict(arbol,cangrejo,type="class")
pred

pred2=predict(arbol,cangrejo)
pred2
cangrejoNuevo=data.frame(FL=10,RW=10,CL=69,CW=69,BD=10)
#Ver si esta
merge(cangrejo,testeo)
#Que me diga true o false
nrow(merge(cangrejo,crabs))>0
