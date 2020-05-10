
#to get datasets pre installed --> datasets::dataset_name (choose from the drop down)
airquality <- datasets::airquality


##to get top and last rows
head(airquality)    #first 6 rows
tail(airquality)    #last 6 rows
head(airquality,10) #first ten rows---if not mentioned it shows 6
tail(airquality,9)  #last 9 rows -- if not mentioned it shows 6


##To access columns
airquality$Wind     #to access the column wind
airquality[,c(1,2)] #shows all row and 1st and 2nd column
df<-airquality[,-6] #makes it a new dataset excluding the 6th column and saved in df


#To get the summary statistics of a dataset
summary(airquality$Temp)  #summary statistics for temp column
summary(airquality$Wind)  #summary statistics for Wind column
summary(airquality)       #summary statistics for all the columns


######Plot#####

#plotting columns  -- default type of plot is point
plot(airquality$Wind)   #to plot the wind column
plot(airquality$Wind,airquality$Temp)        #to plot relation between wind and temp column
plot(airquality)        #to plot all the columns  


#plot points and lines
plot(airquality$Ozone, type='l')      #plots ozone column in line 
plot(airquality$Ozone, type='b')      #plots ozone column in both line and point
plot(airquality$Ozone, type='p')      #plots ozone column in point (default)


#Customising plots
###plots wind column with x axis and y axis name,colour of the plot and type as line###
plot(airquality$Wind,xlab= 'Ozone Concentration',
     ylab= "No. of Instances", main= 'Ozone level in NY City',
     col = 'blue',type='l')  


#Horizontal Bar Plot
barplot(airquality$Ozone,main = 'Ozone conc. in City',xlab= 'Ozone Level',col = 'blue',horiz=F)  
barplot(airquality$Ozone,main = 'Ozone conc. in City',xlab= 'Ozone Level',col = 'blue',horiz=T)  


###HISTOGRAM###
hist(airquality$Temp)        #histogram with Temp column
#histogram with arguments
hist(airquality$Temp, main= 'Solar radiation', xlab=' Solar rad',ylab='Frequency of radiation', col='red') #with additional arguments


##BOX PLOT##
boxplot(airquality$Wind) #single box plot

#Multiple box plots
boxplot(airquality$Wind,airquality$Ozone, airquality$Solar.R,airquality$Temp) #here scale is diff for each columns.So do not go for this
boxplot(airquality[1:4],main='Multiple')



#mfrow= no. of rows and columns
#mar=margin or width to be maintrained from left,bottom,right,top
#las=orientation of writing  0 means vertical and 1 means horizontal
#bty=box around the plot ...o means there will be a box, n means no box
#par is the command

par(mfrow=c(3,3),mar=c(2,5,2,1),las=0,bty='n') #this need to be executed once

plot(airquality$Ozone)
plot(airquality$Ozone,airquality$Wind)
plot(airquality$Ozone,type ='l',col='blue')

barplot(airquality$Ozone,main='Ozone conc.',xlab='ozone levels', col='green',horiz=T)
boxplot(airquality[,0:4],main='Multiple box')
hist(airquality$Solar.R)
boxplot(airquality$Solar.R,col='red')
