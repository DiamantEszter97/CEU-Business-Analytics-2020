library(tidyverse)
install.packages("moments")
library(moments)
install.packages("readxl")
library(readxl)
library(ggplot2)

data_dir <- "C:/Users/diama/Documents/CEU-Business-Analytics-2020/Assignments/DataAnalysis1_Coding1/Data/"
pizza <- read.csv(paste0(data_dir, "clean/da1_data.csv"))


pizza_summary <- pizza %>% 
  summarise(mean = mean(margarita_price),
            median   = median(margarita_price),
            std      = sd(margarita_price),
            iq_range = IQR(margarita_price), 
            min      = min(margarita_price),
            max      = max(margarita_price),
            skew     = skewness(margarita_price),
            numObs   = sum( !is.na( margarita_price ) ) )
pizza_summary