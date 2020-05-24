
#Load data
Nd<-read.csv("path to be given")

# Visualization
install.packages("lattice")
library(lattice)

#for scatter plot
dotplot(Nd$sunday, main="Dot Plot of Sunday Circulations",col="dodgerblue4")  
dotplot(Nd$daily, main="Dot Plot of Daily Circulations", col="dodgerblue4")

# for Boxplot
boxplot(Nd$sunday,col="dodgerblue4")
boxplot(Nd$daily,col="dodgerblue4")

#Regression equation
#Syntax  model<-lm(y~x,data=data set name)
colnames(Nd)   #gives u the column names
model<- lm(sunday~daily,data =Nd)
summary(model)

new_daily=data.frame(daily=c(200,300))

sun1=predict(model,new_daily)
sun1
