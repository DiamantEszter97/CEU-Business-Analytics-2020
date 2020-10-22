mtcars
library(ggplot2)
ggplot(mtcars, aes(x = mpg, y = hp)) + geom_point() + 
  theme_replace() + labs(x = 'milespergallon', 
                        y = 'horsepower', title = 'title', subtitle = 'subtitle')

library(nycflights13)
df <- flights  
 df %>% 
   group_by(tailnum) %>% 
   summarise('number_of_flights' = n()) %>% 
   arrange(-number_of_flights) %>% 
   filter(!is.na(tailnum)) %>% 
   head(1)
# make it decreasing order : write - before the arranging column
 # is.na (empty) -> !is.na (not empty)
 # head(#) -> it will show the n row from the beginning
 # %>%  it makes the operation going

 
 
library(nycflights13)
df <- flights
ggplot(df, aes(x=dep_delay))+
  geom_bar()+
  theme_bw()+
  labs(x='departure delay', y='number of observation', title='departure delay histogram')

library(tidyverse)
df %>%
  ggplot(aes(x=dep_delay)) +
  geom_bar()+
  theme_bw()+
  labs(x='Departure delay', y='Number of observation', title = 'Departure delay histogram')


df %>% 
  group_by(destination) %>% 
  summarise('number of flights)' = n())
  
  
  
library(ggplot2)
ggplot(df, aes(x =dest))+
  geom_bar()+
  theme_bw()+
  labs(x='Destination', y='number of flights', title = 'Number of flights to destination')

library(ggplot2)
ggplot(df, aes(x = dest))+
  geom_bar()+
  theme_bw()+
  labs(x='Destination', y='number of flights', title = 'Top 10 most popular destination')+
  arrange(-dest)+
  head(10)

