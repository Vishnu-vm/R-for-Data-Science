#Data load
Universities<-read.csv("C:/Users/Sudheesh Nandakumar/Desktop/Data Science/R_for_Data_Science/Data/Universities.csv")
# Elbow method
install.packages('factoextra')
library(factoextra)
fviz_nbclust(Universities[,-1], kmeans, method = "wss") +
  labs(subtitle = "Elbow method")

###Cluster algorithm building
km <- kmeans(Universities[,-1],4) 
km$centers
km$cluster
clust<-data.frame("University"=Universities[,1],"cluster"=km$cluster)

##Animation
install.packages("animation")
library(animation)
km <- kmeans.ani(Universities[,-1], 4)
