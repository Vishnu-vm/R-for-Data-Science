install.packages("survival")
library(survival)
survival_unemployment1<-read.csv("C:/Users/Sudheesh Nandakumar/Desktop/Data Science/R_for_Data_Science/Data/survival_unemployment1.csv")

attach(survival_unemployment1)

# Define variables 
time <- spell
group <- ui
X <- cbind(logwage, ui, age)

# Descriptive statistics
summary(time)
summary(event)
summary(X)
summary(group)

# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time,event) ~ 1)

plot(kmsurvival, xlab="Time", ylab="Survival Probability")

# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ group)

plot(kmsurvival1,xlab="Time", ylab="Survival Probability",col = c(2,3),conf.int = T)

