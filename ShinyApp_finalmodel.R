#######   EDA   ######
#library(DataExplorer) 
#DataExplorer::create_report(Insurance) #dataexplorer function to get the detailed report


####Load Data Set####
Insurance <- read.csv("C:/Users/vishw/Desktop/Poonam/P42 Project/Insurance Dataset.csv")


### Convert Age range ####
Insurance$Age<- Insurance$Age
Insurance$Age <- ifelse((Insurance$Age >= 0 & Insurance$Age <=17), '1', Insurance$Age)
Insurance$Age <- ifelse((Insurance$Age >= 18 & Insurance$Age <=29), '2', Insurance$Age)
Insurance$Age <- ifelse((Insurance$Age >= 30 & Insurance$Age <=49), '3', Insurance$Age)
Insurance$Age <- ifelse((Insurance$Age >= 50 & Insurance$Age <=69), '4', Insurance$Age)
Insurance$Age <- ifelse((Insurance$Age >= 70), '5', Insurance$Age)

#### Convert columns to numerical factors #####

Insurance$Area_Service <- as.numeric(factor(Insurance$Area_Service))
Insurance$Hospital.County <- as.numeric(factor(Insurance$Hospital.County))
Insurance$Hospital.Id <- as.numeric(factor(Insurance$Hospital.Id))
Insurance$Age <- as.numeric(factor(Insurance$Age))
Insurance$Gender <- as.numeric(factor(Insurance$Gender))
Insurance$Cultural_group <- as.numeric(factor(Insurance$Cultural_group))
Insurance$ethnicity <- as.numeric(factor(Insurance$ethnicity))
Insurance$Days_spend_hsptl <- as.numeric(factor(Insurance$Days_spend_hsptl))
Insurance$Admission_type <- as.numeric(factor(Insurance$Admission_type))
Insurance$Home.or.self.care.<-as.numeric(factor(Insurance$Home.or.self.care.))
Insurance$apr_drg_description <- as.numeric(factor(Insurance$apr_drg_description))
Insurance$Surg_Description <- as.numeric(factor(Insurance$Surg_Description))
Insurance$Abortion <- as.numeric(factor(Insurance$Abortion))
Insurance$Emergency.dept_yes.No <- as.numeric(factor(Insurance$Emergency.dept_yes.No))

Insurance$ccs_diagnosis_code <- as.numeric(factor(Insurance$ccs_diagnosis_code))
Insurance$ccs_procedure_code <- as.numeric(factor(Insurance$ccs_procedure_code))
Insurance$Code_illness <- as.numeric(factor(Insurance$Code_illness))
Insurance$Mortality.risk <- as.numeric(factor(Insurance$Mortality.risk))
Insurance$Weight_baby <- as.numeric(factor(Insurance$Weight_baby))
Insurance$Tot_charg <- as.numeric(factor(Insurance$Tot_charg))
Insurance$Tot_cost <- as.numeric(factor(Insurance$Tot_cost))
Insurance$ratio_of_total_costs_to_total_charges <- as.numeric(factor(Insurance$ratio_of_total_costs_to_total_charges))
Insurance$Payment_Typology <- as.numeric(factor(Insurance$Payment_Typology))



##### Check for NAs in the dataset #####
sum(is.na(Insurance)) #2498 missing values (Mortality Risk & Hospital ID)



#Replacing NA values with the mean of the respective columns
Insurance$Mortality.risk[is.na(Insurance$Mortality.risk)]<-mean(Insurance$Mortality.risk, na.rm= TRUE)
Insurance$Hospital.Id[is.na(Insurance$Hospital.Id)]<-mean(Insurance$Hospital.Id, na.rm= TRUE)


#### Excluding duplicate values in the dataset #### 
Insurance<-unique(Insurance)


#### Data balancing #### 
#install.packages('ROSE')
library(ROSE)

balanced<-ovun.sample(Result~ .,data=Insurance,method= "both", p=0.5, seed=2810, N=1043761)$data #balancing the dataset
insurance_new<-balanced #replace the old data set with the balanced one.

########Splitting the data into train and test in the ratio 70:30
library(caTools)

split <- sample.split(insurance_new$Result, SplitRatio = 0.7) #split 70% of the data set 
train <- subset(insurance_new, split == TRUE) # save 70% of data in train
test <- subset(insurance_new[,-23], split == FALSE) #save 30% of data in test
test_y <- test_pred <- subset(insurance_new$Result, split == FALSE) #save dependent variable and use it for prediction

y<- as.numeric(train$Result) #save the dependent variable from train data in y
x<- train[,-23]





### Install required packages for RShiny App ### 

install.packages("shiny")
install.packages("htmltools")
library(htmltools)
library(shiny)



########## Shiny App UI Creation #####################

ui <- fluidPage(
  titlePanel("Whether claim is Genuine or Fraud"),
  sidebarLayout(
    sidebarPanel(
      textInput("num","Enter Area Service ","Western NY"),
      textInput("num1","Enter Hospital County ","Allegany"),
      numericInput("num2","Enter Hospital ID  ",37),
      numericInput("num3","Enter Age  ",2),
      textInput("num4","Enter Gender ","M"),
      textInput("num5","ENTER Cultural goup","White"),
      textInput("num6","ENTER Ethnicity  ","Not Span/Hispanic"),
      numericInput("num7","ENTER Days spend in hsptl ",3),
      textInput("num8","ENTER Admission ","Elective"),
      textInput("num9","ENTER Home/Self care","Home or Self Care"),
      numericInput("num10","ENTER CCS_Diagnosis Code",122),
      numericInput("num11","ENTER CCS_Procedure Code ",0),
      textInput("num12","ENTER APR_Drg_Description ","Other pneumonia"),
      numericInput("num13","ENTER Code Illness ",2),
      numericInput("num14","ENTER Mortality risk ",1),
      textInput("num15","ENTER Surg_description","Medical"),
      numericInput("num16","ENTER Weight Baby ",0),
      textInput("num17","ENTER Abortion ","N"),
      textInput("num18","ENTER Emergency Dept ","Y"),
      numericInput("num19","ENTER Total Charge",3373.1),
      numericInput("num20","ENTER Total Cost",3597.63),
      numericInput("num21","ENTER Ratio of tot_ch and tot_cost ",1.066565),
      numericInput("num23","ENTER Payment Typology ",1)
    ),
    mainPanel(
      tableOutput("distplot")
      
    )
  )
  
)


########## Server Building for Shiny App #################

server <- function(input, output) {
  
  output$distplot <- renderTable({
    #### load libraries for Shiny App ## 
    library(htmltools)
    library(shiny)
    
    
    
    
    
    
    ############ Creating Data Frame for Prediction ########
    
    #Input
    Insurance_df<-data.frame(Area_Service=as.numeric(factor(input$num)), Hospital.County=as.numeric(factor(input$num1)), Hospital.Id=input$num2, Age=input$num3, Gender=as.numeric(factor(input$num4)),
                             Cultural_group=as.numeric(factor(input$num5)), ethnicity=as.numeric(factor(input$num6)), Days_spend_hsptl=input$num7, Admission_type=as.numeric(factor(input$num8)), Home.or.self.care.=as.numeric(factor(input$num9)), 
                             ccs_diagnosis_code=input$num10, ccs_procedure_code=input$num11, apr_drg_description=as.numeric(factor(input$num12)), Code_illness=input$num13, 
                             Mortality.risk=input$num14, Surg_Description=as.numeric(factor(input$num15)), Weight_baby=input$num16, Abortion=as.numeric(factor(input$num17)), Emergency.dept_yes.No=as.numeric(factor(input$num18)),
                             Tot_charg=input$num19, Tot_cost=input$num20, ratio_of_total_costs_to_total_charges=input$num21,Payment_Typology=input$num23)
    
    #Insurance_df <- as.numeric(factor(Insurance_df))
    str(Insurance_df)
    View(Insurance_df)
    
    ##############Model Building --XGBoost##########
    
    #isolate x and y
    library(dplyr)
    #save the train data excluding the result column in x
    
    #setting parameters
    params<-list(set.seed=2511,
                 eval_metric= 'auc',
                 objective = "binary:logistic")  # we use binary logistic and auc for evaluation.
    
    
    ####### Model Building ####################
    
    #install.packages("xgboost")
    library(xgboost)
    model<-xgboost(data= as.matrix(x),
                   label = y,
                   params= params,
                   nrounds= 2000,
                   verbose= 1)  # we use 2000 rounds after tuning.
    
    
    
    ##### Prediction #########
    
    pred<-predict(model, as.matrix(Insurance_df)) #Save the predicted values in pred
    predicted<-as.numeric(pred>0.5) #convert the percentage to binary using a condition 
    
    
  })
  
}


#### Calling UI Server for Rendering App ###########

shinyApp(ui = ui, server = server) 

