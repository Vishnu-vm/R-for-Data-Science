##R practice with in-built dataset "attitude"##
attitude<-datasets::attitude

head(attitude)
tail(attitude)

#to choose column
attitude$rating
attitude$complaints
attitude$privileges
attitude$learning
attitude[4,5] #to choose a particualr value from the table


#for summary statistics
summary(attitude$rating)# summary for rating column
summary(attitude)    #summary for all columns
summary(attitude[3]) #summary for 3rd column


#####Plotting#####

plot(attitude)       #plot all columns 
plot(attitude$rating)   #plots rating column
plot(attitude$complaints)   #plots complaints column

plot(attitude$raises,type='l')       #plots column raises as line
plot(attitude$critical,type='l')  #plots column critical as line type
plot(attitude$rating,type='b')  #plots in both point and line

#Customising the graphs
plot(attitude$rating,xlab='X-axis',ylab='y-axis',main='RATING',col='green')
plot(attitude$learning,xlab='X-axis',ylab='y-axis',main='LEARNING',col='red')

#Horizontal Bar Plot
barplot(attitude$learning,ylab='y-axis',main="LEARNING",col='blue',horiz=F)
barplot(attitude$critical,xlab='x-axis',main='CRITICAL',col='blue',horiz=T)


#Histogram
hist(attitude$rating)   #histogram with column rating
hist(attitude$complaints,xlab='X-axis',ylab='Y-axis',main='Histogram of complaints',col='blue')


#Box Plot
boxplot(attitude$raises)   #plot box with column raises
boxplot(attitude$rating,attitude$learning)   #multiple columns
boxplot(attitude[1:4],col='red')     #plotting by range. Here column from 1 to 4 is plotted


#Customising the Graphs' attributes
par(mfrow=c(3,3),mar=c(2,5,2,1),las=1,bty='o')

plot(attitude$rating)
barplot(attitude$complaints)
hist(attitude$privileges,main='ATTITUDE')
hist(attitude$raises,xlab='X-axis',ylab='Y-axis',main='Histogram of Raises',col='blue')
boxplot(attitude$critical)
barplot(attitude$rating,xlab='X-axis',main='ATTITUDE',col='blue',horiz=T)

##AND##

par(mfrow=c(2,4),mar=c(5,4,1,3),las=0,bty='n')


plot(attitude$rating)
barplot(attitude$complaints)
hist(attitude$privileges,main='ATTITUDE')
hist(attitude$raises,xlab='X-axis',ylab='Y-axis',main='Histogram of Raises',col='blue')
boxplot(attitude$critical)
barplot(attitude$rating,xlab='X-axis',main='ATTITUDE',col='blue',horiz=T)
