library(tidyverse)

#Data Prep
#Reading csv
df_diabetes <- read_csv("C:/Users/ksyad/Desktop/MSIS/Semester II/Data Mining and Predictive Analytics/R_datasets/diabetic_data.csv") 

#Analysing dataset
head(df_diabetes)
str(df_diabetes)
summary(df_diabetes)

#Data Prep
names(df_diabetes)
df_diabetes$encounter_id <- NULL
df_diabetes$patient_nbr <- NULL

#Removing Patients who are dead or Hospice
a <- c(11,13,14,19,20,21)
df_readmission <- filter(df_diabetes, !(discharge_disposition_id %in% a))
df_readmission[df_readmission=="?"]<-NA

# Numerical Factors
nums <- unlist(lapply(df_readmission, is.numeric))  
df_readmission_num <- df_readmission[ , nums]
str(df_readmission)

#Check for Missing values
mean(df_readmission_num$time_in_hospital)
mean(df_readmission_num$num_lab_procedures)
mean(df_readmission_num$num_procedures)
mean(df_readmission_num$num_medications)
mean(df_readmission_num$number_outpatient)
mean(df_readmission_num$number_emergency)
mean(df_readmission_num$number_inpatient)
mean(df_readmission_num$number_diagnoses)

# Categorical Variables
names(df_diabetes)
df_readmission_cat <- df_readmission[,c(1,2,9,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,40,41,42,43,44,45,46,47)]




df_ar[,1:25] <- lapply(df_ar[,1:25], factor) 