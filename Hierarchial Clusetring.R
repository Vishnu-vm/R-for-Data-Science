#Data load
mydata1<-read.csv("C:/Users/Sudheesh Nandakumar/Desktop/Data Science/R_for_Data_Science/Data/Universities.csv")

################################
##data standardization
mydata <- scale(mydata1[,2:7])

d <- dist(mydata, method = "euclidean") #Computing the distance natrix
fit <- hclust(d, method="average") # Building the algorithm # try with 'centroid'
plot(fit) # display dendogram
clusters <- cutree(fit, k=4) # cut tree into 4 clusters
# draw dendogram with red borders around the 4 clusters 
rect.hclust(fit, k=4, border="red")
#Attach the cluster numbers to Uni
Final_output=data.frame('University'=mydata1[,1],'Cluster' =clusters)

View(Final_output)
