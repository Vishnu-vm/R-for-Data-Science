#if else
x=-5
if(x>0){
  print("X is a positive value")
}else{
  print("Its a negative value")
}



#nested if
x<--65
if(x>0){
  print("positive")
}else if(x<0){
  print("negative")
}else{
  print("zero")
}


#simple method for if else
a=c(5,7,2,9)
ifelse(a%%2!=0, "odd","even")


#for more than 2 conditions
c<-c("private","public","other","private")
ifelse(c=="private", 1.12, ifelse(c=="public", 1.06, 1))