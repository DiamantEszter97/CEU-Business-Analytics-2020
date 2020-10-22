###########################
## CLASS 4 - Coding in R ##
##                       ##
## Billion-Price-Project ##
###########################


## Start script
# Remove variables from the memory
rm(list=ls())
# Call packages
library(tidyverse)
install.packages("moments")
library(moments)
# new package we use
install.packages("readxl")
library(readxl)
library(ggplot2)
## Import data
data_in <- "C:/Users/diama/Documents/ECBS-5208-Coding-1-Business-Analytics/Class_4/data/"
# Reading with excel and telling that the parsing should check the first 40000 observations
bpp_orig <- read_excel( paste0( data_in , "raw/online_offline_ALL_clean.xls" ), guess_max = 40000 )
# Check the variables
glimpse(bpp_orig)

## Create our key variable
bpp_orig <- mutate( bpp_orig , p_diff = price_online - price )


## Check some of the key variables -> introducing the %>% 
# Note: we will learn how to do this without writing this part down 3 times...
# 1) Online and offline prices
p1_sum <- bpp_orig %>% summarise(
  mean     = mean(price),
  median   = median(price),
  std      = sd(price),
  iq_range = IQR(price), 
  min      = min(price),
  max      = max(price),
  skew     = skewness(price),
  numObs   = sum( !is.na( price ) ) )
p2_sum <- bpp_orig %>% summarise(
  mean     = mean(price_online),
  median   = median(price_online),
  std      = sd(price_online),
  iq_range = IQR(price_online), 
  min      = min(price_online),
  max      = max(price_online),
  skew     = skewness(price_online),
  numObs   = sum( !is.na( price_online ) ) )
p3_sum <- bpp_orig %>% summarise(
  mean     = mean(p_diff),
  median   = median(p_diff),
  std      = sd(p_diff),
  iq_range = IQR(p_diff), 
  min      = min(p_diff),
  max      = max(p_diff),
  skew     = skewness(p_diff),
  numObs   = sum( !is.na( p_diff ) ) )

# Join the to table
price_summary <- p1_sum %>% add_row( p2_sum ) %>% add_row( p3_sum )
price_summary
rm( p1_sum , p2_sum , p3_sum )

# Check for extreme values
# Histogram
ggplot( data = bpp_orig ) +
  geom_histogram( aes( x = price ) , color = 'blue'  , alpha = 0.1 ) +
  labs(x = "Price",
       y = "Count" )

# Need to filter out some data
# FILTER DATA -> filter for "PRICETYPE" is a large restriction!
#     may check without that filter!
bpp <- bpp_orig %>% 
  filter(is.na(sale_online)) %>%
  filter(!is.na(price)) %>%
  filter(!is.na(price_online)) %>% 
  filter(PRICETYPE == "Regular Price")

# Drop obvious errors
bpp <- bpp %>% 
  filter( price < 1000 )

# Check the summary stat
p1_sum <- bpp %>% summarise(
  mean     = mean(price),
  median   = median(price),
  std      = sd(price),
  iq_range = IQR(price), 
  min      = min(price),
  max      = max(price),
  skew     = skewness(price),
  numObs   = sum( !is.na( price ) ) )
p2_sum <- bpp %>% summarise(
  mean     = mean(price_online),
  median   = median(price_online),
  std      = sd(price_online),
  iq_range = IQR(price_online), 
  min      = min(price_online),
  max      = max(price_online),
  skew     = skewness(price_online),
  numObs   = sum( !is.na( price_online ) ) )
p3_sum <- bpp %>% summarise(
  mean     = mean(p_diff),
  median   = median(p_diff),
  std      = sd(p_diff),
  iq_range = IQR(p_diff), 
  min      = min(p_diff),
  max      = max(p_diff),
  skew     = skewness(p_diff),
  numObs   = sum( !is.na( p_diff ) ) )



# Join it to the table
price_summary <- p1_sum %>% add_row( p2_sum ) %>% add_row( p3_sum )
price_summary
rm( p1_sum , p2_sum , p3_sum )




# Histogram
ggplot( data = bpp ) +
  geom_density( aes( x = price ) , color = 'blue'  , alpha = 0.1 ) +
  geom_density( aes( x = price_online )  , color = 'red' , alpha = 0.1 ) +
  labs(x = "Price",
       y = "Relative Frequency" )

# Check the price differences
ggplot( data = bpp ) +
  geom_density( aes( x = p_diff ) , color = 'blue'  , alpha = 0.1 ) +
  labs(x = "Price differences",
       y = "Relative Frequency" ) +
  xlim(-4,4)

# Check for price differences
chck <- bpp %>% filter( p_diff > 500 | p_diff < -500 )
view(chck)
# Drop them
bpp <- bpp %>% filter( p_diff < 500 & p_diff > -500 )
rm( chck )


### Create factors in R
## 
bpp$COUNTRY <- factor(bpp$COUNTRY)
table(bpp$COUNTRY)

# calculate the mean for each country
bpp %>% select(COUNTRY, p_diff) %>% 
  group_by(COUNTRY) %>%  summarize(mean = mean(p_diff),
                                   sd = sd(p_diff),
                                   numObs = n())

# cREATE GGPLOT FOR COUNTRIES HISTOGRAMM
ggplot(data=bpp, aes(x = p_diff, fill = COUNTRY)) +
  geom_histogram(aes(y = ..density..), alpha = 0.4) +
  labs(x = "Price", y = "Relative Frequency", fill = "COUNTRY") +
  facet_wrap(~COUNTRY) +
  xlim(-4,4)




### Hypothesis testing

# test: teh avg price equals to online prices?
# H0: the average price difference between price_online-price = 0
# HA: teh avg price diff is not 0

t.test(bpp$p_diff, mu = 0)

# test 2: the online prices are smaller or equal to offline prices
# H0: price_online <= price -> according to r : price_online - price <= 0
# HA: price_online > price -> according to ro r: price_online - price > 0

t.test(bpp$p_diff, mu = 0, alternative = "greater")


## Multiply hipothesis testing:

rm(testing)
testing <- bpp %>% 
  select(COUNTRY, p_diff) %>% 
  group_by(COUNTRY) %>% 
  summarize(mean_pdiff = mean(p_diff),
            se_pdiff = 1/sqrt(n())*sd(p_diff),
            num_obs = n())
testing
testing <- mutate(testing, t_stat = mean_pdiff / se_pdiff)
testing
testing <- mutate(testing, p_val = pt(-abs(t_stat), df = num_obs - 1 ) )
testing
testing <- mutate(testing, p_val = round(p_val, digit = 4))
testing

####
# Association
# association between online-offline prices
ggplot(bpp, aes(x = price_online, y = price)) +
  geom_point(color = 'red') +
  labs( x = 'price online', y = 'price online')+
  geom_smooth(method = 'lm', formula = y ~ x)

#bin-scatter
# 1) easy way : using equal distances
ggplot(bpp, aes(x = price_online, y = price)) +
  stat_summary_bin(fun = 'mean', binwidth = 50, geom = 'point', color = 'red', size = 2)

# 2) easy way : using equal distances
#               group by countries
ggplot(bpp, aes(x = price_online, y = price, color = COUNTRY)) +
  stat_summary_bin(fun = 'mean', binwidth = 50, geom = 'point', size = 2) +
  labs(x ='price online', y = "price offline", color = "country") +
  facet_wrap(~COUNTRY, scales = 'free', ncol = 2) +
  theme(legend.position = 'none') +
  geom_smooth(method = 'lm', formula = y ~ x)


## bin-scatter 2
# using percentiles instead of equally sized bins

bpp$price_online_10b <- bpp$price_online %>% 
                          cut_number(10)

bs_summary <- bpp %>% 
  select(price, price_online_10b) %>% 
  group_by(price_online_10b) %>% 
  summarise_all(lst(p_bin = min,
                    p_max = max,
                    p_mean = mean, 
                    p_median = median,
                    p_sd = sd,
                    p_num_obs = length))

bs_summary <- bs_summary %>% 
              separate(price_online_10b, into = c("trash", "lower_bound", "upper_bound"), sep = "[^0-9\\.]") 
              
bs_summary

bs_summary <- bs_summary %>% 
              mutate(lower_bound = as.numeric(lower_bound)) %>% 
              mutate(upper_bound = as.numeric(upper_bound)) %>% 
              select(-trash)
bs_summary

bs_summary <- bs_summary %>% 
  mutate(mid_point = (lower_bound + upper_bound) / 2)

# bin-scatter plot
ggplot(bs_summary, aes(x = mid_point, y = p_mean)) +
  geom_point(size = 2, color = "red") +
  labs( x = "Online Prices", y = "offline prices") +
  xlim(0,100) +
  ylim(0,100)


## Correlation and plots with factors

# Covariance
cov(bpp$price, bpp$price_online)

# correlation
cor(bpp$price, bpp$price_online)

# make a correlation table for each country
corr_country <- bpp %>% 
  select(COUNTRY, price, price_online) %>%
  group_by(COUNTRY) %>% 
  summarise(correlation = cor (price, price_online))

corr_country

ggplot(corr_country, aes(x = correlation, y = fct_reorder(COUNTRY, correlation))) +
  geom_point( color = "red", size = 2) +
  labs( x = "Correlation", y = "Countries")
