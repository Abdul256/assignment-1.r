library(tidyverse)      # data manipulation and visualization
library(lubridate)      # easily work with dates and times
library(fpp2)           # working with time series data
library(zoo)            # working with time series data)
#view data frame
library(readxl)
Book2 <- read_excel("Book2.xlsx")
View(Book2)
#calculate 12-month rolling average 
data <- Book2 %>%
  mutate(
  avg_lower_troposphere= rollmean(lower_troposphere, k=12, fill=NA, align='right'),
  avg_Mid_Troposphere= rollmean(Mid_troposphere, k=12, fill=NA, align='right'),
  avg_lower_stratophere= rollmean(lower_stratosphere, k=12, fill=NA, align='right'),
  avg_tropopause= rollmean(Tropopause, k=12, fill=NA, align='right'))
View(data)
data %>%
  gather(metric, value, lower_troposphere:avg_tropopause) %>%
  ggplot(aes(Year, value, color = metric),xlab=c("Year"),
         ylab=c("Value"),
         main=c("Time Series Plot for averages and Global value for the four")) +
  geom_line()
  
