universities<-read.csv("C:/Users/Sudheesh Nandakumar/Desktop/Data Science/R_for_Data_Science/Data/Universities.csv")


universities1<- scale(universities[,2:7])
pca<-princomp(universities1, cor= T, scores= TRUE,covmat = NULL)


summary(pca)
pca$scores
new_data<-pca$scores[,1:2]


plot(pca$scores[,1:2],col="Blue",cex=0.2)
text(pca$scores[,1:2],labels=c(1:25),cex=0.7)
