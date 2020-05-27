mileage<-read.csv("C:/Users/Sudheesh Nandakumar/Desktop/Data Science/R_for_Data_Science/Cars.csv")

#mileage<-Cars
#Scatter Plot Matrix:
pairs(mileage)  #for scatter plot

#Correlation Matrix:###
cor(mileage)
#Regression Model and Summary
model.car<-lm(MPG~HP+VOL+SP+WT,data = mileage)  #to get regression of multiple columns we use +
summary(model.car)
#########Experiment#####################
reg_vol<-lm(MPG~VOL,data = mileage)  #with vol
summary(reg_vol)
reg_wt<-lm(MPG~WT,data = mileage)  #with WT
summary(reg_wt)
reg_wt_vol<-lm(MPG~WT+VOL,data = mileage)  #with both WT & vol
summary(reg_wt_vol)
##################
#Regression Model and Summary
model.car<-lm(MPG~.,data = mileage)   #regression model of all columns. We use . to indicate all
summary(model.car)
#Multi-colinearity
install.packages("car")
library(car)
#Variance Inflation Factor
car::vif(model.car)
##Subset selection
library(MASS)
stepAIC(model.car)
################################
#Full Model Building process
#Regression Model and Summary
model.car<-lm(MPG~.,data = mileage)
#Diagnostic Plots:
#Residual Plots, QQ-Plos, Std. Residuals vs Fitted
plot(model.car) 
#Residuals vs Regressors
library(car)
residualPlots(model.car)
#Added Variable Plots
avPlots(model.car)
#QQ plots of studentized residuals
qqPlot(model.car)
#Deletion Diagnostics
influenceIndexPlot(model.car) # Index Plots of the influence measures

####Iteration 1 
#Remove 77th observation
mileage["HP2"] <-mileage$HP*mileage$HP
mileage["SP2"] <-mileage$SP*mileage$SP
mileage1<-mileage[-77,]


model1<-lm(MPG~.,data = mileage1)
summary(model1)
plot(model1) 
residualPlots(model1)
qqPlot(model1)
influenceIndexPlot(model1)

#iteration2
mileage2<-mileage[-c(77,66,81),]


model2<-lm(MPG~.,data = mileage2[,-c(5)])
summary(model2)

