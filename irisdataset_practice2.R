##R practice with in-built dataset "iris"##

iris<-datasets::iris
head(iris)
tail(iris)

#to choose column
iris$Sepal.Length
iris$Sepal.Width
iris$Petal.Length
iris$Petal.Width
iris$Species
iris[4,5] #to choose a particualr value from the table


#for summary statistics
summary(iris$Petal.Width)# summary for petal width column
summary(iris)    #summary for all columns
summary(iris[3]) #summary for 3rd column


#####Plotting#####

plot(iris)       #plot all columns 
plot(iris$Sepal.Length)   #plots Sepal length column
plot(iris$Sepal.Width)   #plots Sepal Width column

plot(iris$Petal.Length,type='l')       #plots column Petal length as line
plot(iris$Petal.Width,type='l')  #plots column Petal width as line type
plot(iris$Petal.Length,type='b')  #plots in both point and line

#Customising the graphs
plot(iris$Sepal.Length,xlab='X-axis',ylab='length',main='Sepal Lengths',col='green')
plot(iris$Sepal.Width,xlab='X-axis',ylab='width',main='Sepal width',col='red')

#Horizontal Bar Plot
barplot(iris$Petal.Length,ylab='Length',main='Petal Length',col='blue',horiz=F)
barplot(iris$Petal.Width,xlab='Width',main='Petal Width',col='blue',horiz=T)


#Histogram
hist(iris$Sepal.Length)   #histogram with column lat
hist(iris$Petal.Length,xlab='X-axis',ylab='Y-axis',main='Histogram of Petal Length',col='blue')


#Box Plot
boxplot(iris$Sepal.Length)   #plot box with column magnitude
boxplot(iris$Sepal.Width,iris$Sepal.Length)   #multiple columns
boxplot(iris[1:4])     #plotting by range. Here column from 1 to 4 is plotted


#Customising the Graphs' attributes
par(mfrow=c(3,3),mar=c(2,5,2,1),las=1,bty='o')

plot(iris$Sepal.Length)
barplot(iris$Petal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Width,xlab='X-axis',ylab='Y-axis',main='Histogram of Petal width',col='blue')
boxplot(iris$Petal.Length)
barplot(iris$Sepal.Length,xlab='X-axis',main='Length of sepal',col='blue',horiz=T)

##AND##

par(mfrow=c(2,4),mar=c(5,4,1,3),las=0,bty='n')

plot(iris$Sepal.Length)
barplot(iris$Petal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Width,xlab='X-axis',ylab='Y-axis',main='Histogram of Petal width',col='blue')
boxplot(iris$Petal.Length)
barplot(iris$Sepal.Length,xlab='X-axis',main='Length of sepal',col='blue',horiz=T)

