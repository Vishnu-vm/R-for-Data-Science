#Example for waist circumference to predict the AT depending on the waist size
#Load data
wcp<-read.csv("C:/Users/Sudheesh Nandakumar/Desktop/Data Science/R_for_Data_Science/WC_AT.csv")

# Visualization.
install.packages("lattice")
library(lattice)

#for scatter plot
dotplot(wcp$AT, main="Dot Plot of AT",col="dodgerblue4")  
dotplot(wcp$Waist, main="Dot Plot of Waist", col="dodgerblue4")

# for Boxplot
boxplot(wcp$AT,col="dodgerblue4")
boxplot(wcp$Waist,col="dodgerblue4")

#Regression equation
#Syntax  model<-lm(y~x,data=data set name)
colnames(wcp)   #gives u the column names
mymodel<- lm(AT~Waist,data =wcp)
summary(mymodel)
#preparing new data frame with new data
new_AT=data.frame(Waist=c(40,75,200)) #
#predict for new data
ATnew=predict(mymodel,new_AT)
#print predicted value
ATnew

#predict for all datapoints 
predictedAT<-predict(mymodel)
predictedAT
#preparea new data frame with pred and error
finalwcp<-data.frame(wcp,predictedAT,"Error"= wcp$AT-predictedAT)
#print new dataset
names(finalwcp)


