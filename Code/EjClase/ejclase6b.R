library(caret)
library(MASS)
library(rpart)
library(rpart.plot)
library(mlbench)
directory <- dirname(rstudioapi::getActiveDocumentContext()$path)
#just use the setwd if not using rstudio
setwd(directory)
library(jpeg)