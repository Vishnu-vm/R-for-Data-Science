#Loops in R -- while loop
i<-2
while(i<=6){
  print(i)
  i=i+1
}



#repeated loop
repeat{
  commands
  if(condition){
    break
  }
}


v=c("hello","loop")
count=0

repeat{
  print(v)
  count=count+1
  
  if(count>6) {
    break
  }
}



#For Loop
for(value in vector) {
  statements
}



v<-LETTERS[1:4]
for(i in v) {
  print(i)
}



#Loop Control Statements
#break statement--> terminates the loop statement and transfers execution to stmt
#immediately following the loop
#next statement --> useful if we want to skip current iteration of a loop without 
#terminating loop (same as continue in C)

v<-LETTERS[1:4]
for(i in v) {
  if(i=='D'){
    next
  }
  print(v)
}

