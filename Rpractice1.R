##R practice with in-built dataset "quakes"##

e_quakes<-datasets::quakes
head(e_quakes)
tail(e_quakes)

#to choose column
e_quakes$lat
e_quakes$long
e_quakes$depth
e_quakes$mag
e_quakes$stations
e_quakes[4,5] #to choose a particualr value from the table


#for summary statistics
summary(quakes$lat)# summary for lat column
summary(quakes)    #summary for all columns
summary(quakes[3]) #summary for 3rd column


#####Plotting#####

plot(quakes)       #plot all columns 
plot(quakes$lat)   #plots lat column
plot(quakes$mag)   #plots mag column

plot(quakes$lat,type='l')       #plots column lat as line
plot(quakes$stations,type='l')  #plots column stations as line type
plot(quakes$stations,type='b')  #plots in both point and line

#Customising the graphs
plot(quakes$mag,xlab='X-axis',ylab='Magnitude of the Quake',main='Earth Quake Magnitude',col='green')
plot(quakes$stations,xlab='X-axis',ylab='Station',main='Earth Quake Stations',col='red')

#Horizontal Bar Plot
barplot(quakes$depth,ylab='Station',main='Earth Quake Depth',col='blue',horiz=F)
barplot(quakes$stations,xlab='X-axis',main='Earth Quake Stations',col='blue',horiz=T)


#Histogram
hist(quakes$lat)   #histogram with column lat
hist(quakes$stations,xlab='X-axis',ylab='Y-axis',main='Histogram of Earthquake Stations',col='blue')


#Box Plot
boxplot(quakes$mag)   #plot box with column magnitude
boxplot(quakes$long,quakes$lat)   #multiple columns
boxplot(quakes[1:4])     #plotting by range. Here column from 1 to 4 is plotted


#Customising the Graphs' attributes
par(mfrow=c(3,3),mar=c(2,5,2,1),las=1,bty='o')

plot(quakes$depth)
barplot(quakes$mag)
hist(quakes$lat)
hist(quakes$stations,xlab='X-axis',ylab='Y-axis',main='Histogram of Earthquake Stations',col='blue')
boxplot(quakes$mag)
barplot(quakes$depth,xlab='X-axis',main='Earth Quake Stations',col='blue',horiz=T)

                ##AND##

par(mfrow=c(2,4),mar=c(5,4,1,3),las=0,bty='n')

plot(quakes$depth)
barplot(quakes$mag)
hist(quakes$lat)
hist(quakes$stations,xlab='X-axis',ylab='Y-axis',main='Histogram of Earthquake Stations',col='blue')
boxplot(quakes$mag)
barplot(quakes$depth,xlab='X-axis',main='Earth Quake Stations',col='blue',horiz=T)

