library(readr)
library(dplyr)

data <- read.csv2("household_power_consumption.txt")

head(data)

# Converting the date column from character to date type

data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Taking the data that is required

data1 <- data %>% 
         filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))
head(data1)
