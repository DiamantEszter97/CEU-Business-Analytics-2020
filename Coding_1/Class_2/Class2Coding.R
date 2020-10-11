# data frames useful to store data
# Create data-frame

library("tidyverse")
df <- data_frame(id=c(1,2,3,4,5,6), 
                 age=c(25,30,33,22,26,38),
                 grade=c("A","A+","B","B+","A", "B"))
view(df)

# indexing in data frames
df[ 1 ]

# how to install package
install.packages("moments")
install.packages("tidyverse")
library(tidyverse)

# go back to indexing
# chose from the 2nd clomn the 2nd observation
df[2,2]

# create values/vectors
# first column values in line
df[[1]]

# with more value, it will only give 1 value: (EXTRACT ATOMIC VALUES!)
df[[2,2]]

# good news: not need to know all colums, id values enough
# $ = []
# same as: df$var_name == df[[var_column]]
df$id

# lets find age of 3rd observation or id==3
df$age[3]

#indexing with logical
df$age[df$id==3]


## Functions

age2 <- df$age[1:3]

#sum of age
age2[1] + age2[2] + age2[3]
# or
sum(age2)

#ask for help: it will give description on the right
?sum

# try it with na.rm
sum(c(age2, NaN), na.rm = TRUE)

#calculate the mean
mean(age2)

# standard deviation
sd(age2)
