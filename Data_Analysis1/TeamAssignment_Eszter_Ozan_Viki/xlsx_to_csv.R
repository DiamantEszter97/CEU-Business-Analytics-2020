# This is a simple code to:
# 1) change the variable names in the original data
# 2) create a csv file so that we can read our data from an url

library(tidyverse)
library(readxl)

data_dir <- "~/Documents/CEU/DA1_Assignment/2nd_Assignment/CEU-Business-Analytics-2020/Data_Analysis1/TeamAssignment_Eszter_Ozan_Viki/"
setwd(data_dir)
da1_data <- read_xlsx(paste0(data_dir, "Restaurant_Research_DA1.xlsx"))
da1_variables  <- read_xlsx(paste0(data_dir, "Restaurant_Research_DA1.xlsx"), sheet = 2)
names(da1_data) <- da1_variables[[4]]
write_csv(da1_data, "da1_data.csv")
