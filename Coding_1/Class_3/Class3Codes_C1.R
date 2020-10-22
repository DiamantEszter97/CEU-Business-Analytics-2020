rm(list=ls())
library(tidyverse)

# import raw data
data_in <- "C:/Users/diama/Documents/ECBS-5208-Coding-1-Business-Analytics/class_3/data/"
b_data <- read.csv(paste0(data_in, "raw/hotelbookingdata.csv"))

# view data : click on b_data (in this script) or:
view(b_data)

# have a glimpse on data
glimpse(b_data)

# create a new variable (a new column)
b_data <- mutate(b_data, nnights = 1)

# clean and create new column from existing variable -> clean accomodationtype column
# seperate(table, column name, seperator, into = c(name of 1 column, name of 2 column))
b_data <- separate(b_data, accommodationtype, "@", into = c("garbage", "accommodation_type"))

# remove variable garbage
# without -, only the typed column will be kept
b_data <- select(b_data, -c(garbage))

# correct the guestreviewsrating into simple numeric variable. if the second column is not given, then it will sódelete those variable (/5)
b_data <- separate(b_data, guestreviewsrating, "/", into = c("ratings"))


# show the type of the column/variable:
typeof(b_data$ratings)

#change the type of variable
b_data$ratings <- as.numeric(b_data$ratings)

# how to deal with distance measure
# simple character variable:
eg1 <- "Coding is 123 fun!"

# find numeric values with vectors and replace it
#  gsub(find teh vlues, replace it with it, evything else be it)
gsub("12", "extra fun", eg1)

# find any numeric value . find everything numeric value from 0 to 9 and replace with extra fun else, replace it eg1
gsub("[0-9\\.]", "extra fun", eg1)

# find everything that is not numeric value between 0 and 9
gsub("[^0-9\\.]", "", eg1)

#mutate all the distance measures
b_data <- mutate(b_data, distance = as.numeric(gsub("[^0-9\\.]", "", center1distance)), distance_alter = as.numeric(gsub("[^0-9\\.]", "", center2distance)))


## Rename variables
# rename( table, ami legyen =ami volt)
b_data <- rename(b_data, rating_count = rating_reviewcount, ratingta = rating2_ta, ratingta_count = rating2_ta_reviewcount, country = addresscountryname)

## replacing missing values
# loo at key variable: stars
b_data <- rename(b_data, stars = starrating)

# show a count on all group
table(b_data$stars)

# replace 0 to a variable type that will consider it as missing value instead of real rating value
b_data <- mutate(b_data, stars = na_if(stars, 0))
table(b_data$stars)

# filter out observations which do not have id. !is.na (is not a number) it will choose that has id number
b_data <- filter(b_data, !is.na(hotel_id))

## filter out duplicates
# check duplicates:
sum(duplicated(b_data))

# filter out duplicates
b_data <- filter(b_data, !duplicated(b_data))

## remove duplicates to specific variables
# create another table to practice as sub data
sub_data <- subset(b_data, select = c(country, hotel_id))
b_data <- filter(b_data, !duplicated(subset(b_data, select = c(country, hotel_id, distance, stars, ratings, price, year, month, weekend, holiday))))

# finally hotels vienna
b_data <- rename(b_data, city = s_city)
hotel_vienna <- filter(b_data, city == "Vienna")

# filter multiple conditions
hotel_vienna <- filter(hotel_vienna, year == 2017 & month ==  11 & weekend == 0, accommodation_type =="Hotel", stars >= 3 & stars <= 4, price < 1000)

# writing out csv
write.csv(hotel_vienna, paste0(data_in, "clean/hotel_vienna.csv"))

# create descriptive table
vienna_sum_stat <- summarise(hotel_vienna, 
                             mean = mean(price),
                             median = median(price),
                             std =sd(price),
                             min = min(price),
                             max = max(price))
vienna_sum_stat
