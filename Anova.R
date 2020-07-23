pain=c(4,5,4,3,2,4,3,4,4,6,8,4,5,4,6,5,8,6,6,7,6,6,7,5,6,5,5)   #data
drug=c(rep('A',9),rep('B',9),rep('C',9))
migrane =data.frame(pain,drug)
migrane$drug<-as.factor(migrane$drug)
plot(pain~drug,data = migrane)
results=aov(pain~drug,data=migrane)
summary(results)
