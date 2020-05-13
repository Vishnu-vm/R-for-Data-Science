##R practice with in-built dataset "attitude"##
ds<-datasets::anscombe

head(ds)
tail(ds)

#to choose column
ds$x1
ds$x2
ds$x3
ds$x4
ds[4,5] #to choose a particualr value from the table


#for summary statistics
summary(ds$y1)# summary for y1 column
summary(ds)    #summary for all columns
summary(ds[3]) #summary for 3rd column


#####Plotting#####

plot(ds)      #plot all columns 
plot(ds$x1)   #plots x1 column
plot(ds$x2)   #plots x2 column

plot(ds$x3,type='l')       #plots column x3 as line
plot(ds$y1,type='l')  #plots column y1 as line type
plot(ds$x2,type='b')  #plots in both point and line

#Customising the graphs
plot(ds$x4,xlab='X-axis',ylab='y-axis',main='',col='green')
plot(ds$x1,xlab='X-axis',ylab='y-axis',main='',col='red')

#Horizontal Bar Plot
barplot(ds$x3,ylab='y-axis',main="",col='blue',horiz=F)
barplot(ds$y3,xlab='x-axis',main='',col='blue',horiz=T)


#Histogram
hist(ds$x4)   #histogram with column x4
hist(ds$y1,xlab='X-axis',ylab='Y-axis',main='Histogram',col='blue')


#Box Plot
boxplot(ds$x2)   #plot box with column x2
boxplot(ds$x2,ds$x1)   #multiple columns
boxplot(ds[1:4],col='red')     #plotting by range. Here column from 1 to 4 is plotted


#Customising the Graphs' attributes
par(mfrow=c(3,3),mar=c(2,5,2,1),las=1,bty='o')

plot(ds$y3)
barplot(ds$x4)
hist(ds$y1,main='')
hist(ds$y2,xlab='X-axis',ylab='Y-axis',main='Histogram',col='blue')
boxplot(ds$x2)
barplot(ds$x1,xlab='X-axis',main='',col='blue',horiz=T)

##AND##

par(mfrow=c(2,4),mar=c(5,4,1,3),las=0,bty='n')


plot(ds$y1)
barplot(ds$x4)
hist(ds$y3,main=' ')
hist(ds$x1,xlab='X-axis',ylab='Y-axis',main='Histogram',col='blue')
boxplot(ds$y3)
barplot(ds$y2,xlab='X-axis',main='',col='blue',horiz=T)
