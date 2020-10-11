## Descriptive stat of hotels in Vienna

## 2020-10-05

# remove the memorized data, variable at the right hand side (envrionment)
rm(list=ls())
library(tidyverse)

 ## import data
data_in <- "C:/Users/diama/Documents/CEU-Business-Analytics-2020/Coding_1/Github_Material/ECBS-5208-Coding-1-Business-Analytics/Class_2/data/"
hotels_vienna <- read_csv(paste0(data_in, "clean/hotels_vienna.csv"))
  
# in parenthesis
getwd()
setwd()

# glimpse on data
glimpse(hotels_vienna)

# have a summary 
summary(hotels_vienna)

# select favourite variable
hotels_vienna$price

# calculate mean
mean(hotels_vienna$price)

# number of observations in hotel price vector
length(hotels_vienna$price)

###
# visualization
ggplot(data = hotels_vienna, aes(x = price)) + geom_histogram()

ggplot(data = hotels_vienna, aes(x = price))+
      geom_histogram(fill = "navyblue") +
      labs(x = "Hotel prices ("$")", y = "Absolute Frequency")
      
      
ggplot( data = hotels_vienna , aes(x=price)) +
          geom_histogram(fill= "navyblue", binwidth = 1) +
          labs(x="Hotel price ($)",y="Absolute Frequency")

# Relative frequency
ggplot(data = hotels_vienna, aes(x=price)) +
  geom_histogram(aes(y=..density..), fill = "navyblue", binwidth = 1)+
  labs(x= "HotelsPrices ($)", y="Relative Frequency")

# Kernel Density Estimator
ggplot(data = hotels_vienna, aes(x = price)) +
  geom_density(aes(y = ..density..), color = "red", fill ="blue", bw = 15, alpha = 0.5) +
  labs(x="Hotel Prices ($)", y = "Relative Frequency")

# Kernel density and histogram
ggplot(data = hotels_vienna, aes(x = price)) +
  geom_density(aes(y = ..density..), color = "red", fill ="blue", bw = 15, alpha = 0.5) +
  geom_histogram((y = ..density..), fill = "green", binwidth = 20) +
  labs(x="Hotel Prices ($)", y = "Relative Frequency")
