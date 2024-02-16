#install.packages("rstudioapi") #Install rstudioapi for the automatic set working directory feature
library(caret)

directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(directory)
base=read.table("./base.csv",sep=",",header=TRUE)#Loading dataset
#Some usefull information for getting to know my dataset
dim(base)
str(base)
summary(base)
View(base)

hist(base$Snatch..kg.,
     main = "Histograma de Guido", 
     xlab = "Santch..Kg",
     ylab = "Frequency",
     col = "red")

