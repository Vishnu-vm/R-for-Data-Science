#apply --- convert a matrix to array or list

#returns a vector or array or lists of values obtaied by
#applying a fn to margins of an array or matrix
x<-matrix(rnorm(30), nrow=5, ncol=6) # rnorm(30)-->generates randomly 30 values for matrix
x
apply(x,1,sum) #apply(variable, margin,operation)--1 means rows--to get sum of values in row
apply(x,2,sum) # sum of column values -- 2 means column


#lapply
#lapply fn takes list, vector, data frame as input and returns only list as output

a<-matrix(1:9,3,3)
b<-matrix(4:15,4,3)
c<-matrix(8:10,3,2)

Mylist= list(a,b,c)
lapply(Mylist, mean)
random =c("This is a random vector")
lapply(random, nchar)

#SAPPLY ----VECTOR AS OUTPUT
sapply(Mylist,mean)


#mapply -- mapply(operation,variable,variable)
mapply(sum,c(1,2,3), c(8,9,7), c(4,5,6))
m<-matrix(c(1,2,3,4))
m2<-matrix(c(5,6,7,8))
mapply(sum,m,m2)


#tapply --- when u need to apply fn to a subset a vector

data() #shows inbuilt datasets
attach(iris) #--iris is inbuilt dataset...attach is to make sure u dont want to dataset
            #name but can call directly
View(iris)
tapply(Sepal.Length, Species, median)




getwd() # gives current working directory

setwd("path") #to set the directory

#to read from csv files
#data =read.csv("path" or file.choose)
data = read.csv(file.choose)


#to read excel sheet
library(readxl)  #package readxl
#data = read_xlsx("path",sheet=sheet num like 2,3 etc)  if the sheet isnt mentioned, it wud luk bad


#install.packages("dplyr") -- to install packages   dplyr is used to data manipulation
           or
#           
