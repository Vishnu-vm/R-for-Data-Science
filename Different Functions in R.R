#SORT -- 
#sorts the numerical value. By default it is ascending order
v1=c(1,13,4,12,7,11)
sort(v1)
sort(v1, decreasing = T)

#Character vector sort -- by default, alphabetical order
v2<-c('cherry','bluberrry','apple','pineapple')
sort(v2)
sort(v2,decreasing=T)


#RANK
x=c(2,7,1,-17,NA,Inf,35,21,7)
#sample ranks of a vector-- 'Not Available(NA)' as First
#NA--length of 1 but no value, By default gives last rank
rank(x)

#Inf-- Infinity
rank(x,na.last=F) #--gives rank for NA last

#To remove NA
rank(x,na.last=NA)

#To keep NA as NA itself
rank(x,na.last="keep")

#Ties--used if there is 2 same values like here 7
rank(x,na.last=T,ties.method = "average")

#Ties are given fist rank
rank(x,na.last=T,ties.method = "first")

#Random -- randomly gives rank
rank(x,na.last=T,ties.method="random")

#Min
rank(x,na.last=T,ties.method="min")

#Max
rank(x,na.last=T,ties.method="max")


#RANGE
#For numeric value
x=c(2,7,1,-17,Inf,35,21,7)
range(x)

#with NA
x=c(2,7,1,-17,Inf,35,21,7,NA)
range(x)  #gives na as op

range(x,na.rm=T) # removes NA if its present

#For character vector
x<-c('a','x','i','j')
range(x)


#round()
round(c(1.234,2.342,4.562,5.671,12.345,14.567))
round(c(1.234,2.342,4.562,5.671,12.345,14.567),digits=1) # 1 value after decimal

#signif()--Same as round but here digits denote total digits not after decimal
signif(c(1.234,2.342,4.562,5.671,12.345,14.567),digits=7)

#floor() & ceiling()
floor(c(1.234,2.342,4.562,5.671,12.345,14.567)) #rounds of to lowest or previousvalue 
ceiling(c(1.001,1.234,2.342,4.562,5.671,12.345,14.567)) #rounds of to next or highest value


##String Manipulation
a<-" Welcome to R programming. R is a programming language"
#syntax-- sub/gsub("value to be replaced","new value)...
sub("R","Python",a)  #replaces r with python one time
gsub("R","Python",a)  #all R's are replaced with python


#strsplit() ---splits between the strings
#syntax-- strsplit(string_name, delimeter)
new<-"Welcome to R programming session today"
strsplit(new, " ") #splits the words whena space encounters


#substr()--choose the start and stop of a string wrt to position of letters
#syntax: substr(text,start,stop)
a<-"Welcome to R programming"
substr(a,8,30) #extracts values from 8 to 30 in the string a


#paste()
y=paste('one',2,'three',4,'five') #different characters will be considered as a single string
                                  #with default separator space.
x<-c('one',2,'three',4,'five') # normal string
x[1]
y[1]

#paste fn with separator
paste('X',c(1:5),sep=":") #paste cmd with separator as ":"

#paste fn with collapse
paste(c('one','two','three','four'),collapse=" and ") #collapse will add the collapse value
                                                     #between each string
#paste with collapse and separator
paste(c('X','Y'),1:5,sep=':',collapse=' and ')



#merge function
#used to join dataframes

df1=data.frame(ID=c(1:6),Product=c(rep("Oven",3),rep("Television",3)))
df1
df2=data.frame(ID=c(2,7,9,4),state=c(rep("Kerala",3),rep("Sikkim",1)))
df2

#merging happens based on th common column in both data sets.
#Inner join
df=merge(x=df1,y=df2,by="ID") # gives merged value by ID and shows mutual entries
df

#Outer join
df=merge(x=df1,y=df2,by="ID",all=T) #merges and shows all entries
df

#Left Outer Join
df=merge(x=df1,y=df2,by="ID",all.x=T) #merges by the dataframe df1(which is stored in x)
df                                    #and shows only which are there in x  

#Right Outer Join
df=merge(x=df1,y=df2,by="ID",all.y=T) #opp to left
df

