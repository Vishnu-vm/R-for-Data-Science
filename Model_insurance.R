                             ####Load Data Set####
Insurance<- Insurance.Dataset  #saved the original data into new variable
View(Insurance)  

                             #######EDA######
library(DataExplorer) 
DataExplorer::create_report(Insurance) #dataexplorer function to get the detailed report


                            ######Feature Engineering#####
#Check for NA values
sum(is.na(Insurance)) #2498 missing values (Mortality Risk & Hospital ID)

#Replacing NA values with the mean of the respective columns
Insurance$Mortality.risk[is.na(Insurance$Mortality.risk)]<-mean(Insurance$Mortality.risk, na.rm= TRUE)
Insurance$Hospital.Id[is.na(Insurance$Hospital.Id)]<-mean(Insurance$Hospital.Id, na.rm= TRUE)

#check duplicates and remove them
ins_dup<-duplicated(Insurance)  #check for duplicate rows -- 4791 rows 
View(ins_dup)
Insurance<-unique(Insurance) #extract the unique data and store it in Insurance
nrow(Insurance)  #Check the numer of rows

#Convert the Age column and save it in new column "Age1"
library(dplyr)
Insurance$Age1<- Insurance$Age
Insurance$Age1 <- ifelse((Insurance$Age >= 0 & Insurance$Age <=17), '1', Insurance$Age1)
Insurance$Age1 <- ifelse((Insurance$Age >= 18 & Insurance$Age <=29), '2', Insurance$Age1)
Insurance$Age1 <- ifelse((Insurance$Age >= 30 & Insurance$Age <=49), '3', Insurance$Age1)
Insurance$Age1 <- ifelse((Insurance$Age >= 50 & Insurance$Age <=69), '4', Insurance$Age1)
Insurance$Age1 <- ifelse((Insurance$Age >= 70), '5', Insurance$Age1)

#Convert the columns into numeric and factors
Insurance$Age1<-as.numeric(factor(Insurance$Age1))
Insurance$Area_Service <-as.numeric(factor(Insurance$Area_Service))
Insurance$Cultural_group<-as.numeric(factor(Insurance$Cultural_group))
Insurance$Gender<-as.numeric(factor(Insurance$Gender))
Insurance$Hospital.County<-as.numeric(factor(Insurance$Hospital.County))
Insurance$ethnicity<-as.numeric(factor(Insurance$ethnicity))
Insurance$Admission_type<-as.numeric(factor(Insurance$Admission_type))
Insurance$Home.or.self.care.<-as.numeric(factor(Insurance$Home.or.self.care.))
Insurance$apr_drg_description<-as.numeric(factor(Insurance$apr_drg_description))
Insurance$Surg_Description<-as.numeric(factor(Insurance$Surg_Description))
Insurance$Abortion<-as.numeric(factor(Insurance$Abortion))
Insurance$Emergency.dept_yes.No<-as.numeric(factor(Insurance$Emergency.dept_yes.No))
Insurance$Days_spend_hsptl<-as.numeric(factor(Insurance$Days_spend_hsptl))

#Remove 4th column  
insurance_new<-Insurance[,-c(4)]  #"Age" column removed and use the "Age1" column. Save it in insurance_new
View(insurance_new)

#Data Imbalance
#install.packages('ROSE')
library(ROSE)
balanced<-ovun.sample(Result~ .,data=insurance_new,method= "both", p=0.5, seed=2810, N=782188)$data #balancing the dataset
table(balanced$Result) #view if the new data set is balanced
insurance_new<-balanced #replace the old data set with the balanced one.

#Splitting the data into train and test in the ratio 70:30
library(caTools)
split <- sample.split(insurance_new$Result, SplitRatio = 0.7) #split 70% of the data set 
train <- subset(insurance_new, split == TRUE) # save 70% of data in train
test <- subset(insurance_new[,-c(22)], split == FALSE) #save 30% of data in test
test_y <- test_pred <- subset(insurance_new$Result, split == FALSE) #save dependent variable and use it for prediction


                      ##############Model Building --XGBoost##########
#isolate x and y
library(dplyr)
y<-as.numeric(train$Result) #save the dependent varaiable from train data in y
x<- train[,-22] #save the train data excluding the result column in x

#setting parameters
params<-list(set.seed=2511,
             eval_metric= 'auc',
             objective = "binary:logistic")  # we use binary logistic and auc for evaluation.

#Running the model
#install.packages("xgboost")
library(xgboost)
model<-xgboost(data= as.matrix(x),
               label = y,
               params= params,
               nrounds= 2000,
               verbose= 1)  # we use 2000 rounds after tuning.

#Predicting
pred<-predict(model, as.matrix(test)) #Save the predicted values in pred
predicted<-as.numeric(pred>0.5) #convert the percentage to binary using a condition 
View(predicted)

c<-table(predicted, test_y) #create a table with predicted and actual values
sum(diag(c))/sum(c)

#Confusion Matrix 
library(caret)
predicted<-as.factor(predicted) #convert the predicted into factor
test_y<-as.factor(test_y) #convert the dependent variable to factor
confusionMatrix(predicted,y, mode = "prec_recall", positive = '1') #create a confusion matrix to get the evaluation metric

