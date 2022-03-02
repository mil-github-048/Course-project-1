library(readr)
library(dplyr)

data <- read.csv2("household_power_consumption.txt")

head(data)

# Converting the date column from character to date type

data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Taking the data that is required

data1 <- data %>% 
         filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))


# Making a column that contains both date and time

new_date <- paste(data1$Date, data1$Time)

data1 <- cbind(new_date, data1)

data1$new_date <- as.POSIXct(new_date)

# changing the type of Global active power from char to num
data1$Global_active_power <- as.numeric(data1$Global_active_power)

# Making the histogram plot
hist(data1$Global_active_power, main='Global Active Power', xlab='Global Active Power(kilowatts)', col='red')