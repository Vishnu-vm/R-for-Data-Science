1-pt(2.2,79)
2*pt(-1.41,49)

#compute t value
  xbar<-4.1
s<-3
n=50
mu=4

tvalue<-(xbar-mu)/(s/sqrt(n))
tvalue
if(tvalue<0) {
pvalue<-pt(tvalue,(n-1))
pvalue
2*pvalue
}else{
  pvalue<-pt(-tvalue,(n-1))
  pvalue
  2*pvalue
}


