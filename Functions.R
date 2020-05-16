#Function
fun1<- function(a){
  for(i in 1:a) {
    b<-i^2
    print(b)
  }
}
fun1(6) #calling the function


#calling a fn without an argument
add= function(){
  for(i in 1:5){
    print(i^2)
  }
}
add()


#callin a fn with default arguments
#create a fn with arguments

new=function(a=3,b=6){
  result=a*b
  print(result)}
new() # uses default arguments
new(9,5) # replaces 3 &6 with the one being passed

fun= function(a,b){
  print(a^2)
  print(b^3)
}
fun(3,4)
