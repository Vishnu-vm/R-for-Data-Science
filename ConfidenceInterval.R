
#Package for CI
install.packages("gmodels") # one time job
library(gmodels) # everytime when you want to use CI
#Data
install.packages('nycflights13')
library(nycflights13)
#Loads the data from package 'nycflights13'
data(flights)

#for column with dep_delay

dep_delay<-flights$dep_delay  #saves the dep_delay column to the variable
#to check NA values
is.na(dep_delay)    #shows true for NA values
#Remove NA values
dep_delay_withoutNA<-dep_delay[!is.na(dep_delay)]  #removes NA values and save it in the variable
#CI construction
ci(dep_delay_withoutNA,confidence = 0.90)   #u can choose confidence value

#To omit all the NAs in the table. U can use this dataset to compute as well(the entire row with NA gets removed)
flights1<-na.omit(flights)  #new dataset created with NAs ommitted from all columns from flights data

   
#for column with arr_delay

arr_delay<-flights$arr_delay
is.na(arr_delay)
arr_delay_withoutNA<-arr_delay[!is.na(arr_delay)]
ci(arr_delay_withoutNA,confidence = 0.90)

#for column with arrival time

arr_time<-flights$arr_time
is.na(arr_time)
arr_time_withoutNA<-arr_time[!is.na(arr_time)]
ci(arr_time_withoutNA,confidence = 0.90)


