library(readr)
library(dplyr)
library(shiny)
library(shinydashboard)

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


with(data1, {
  plot(Sub_metering_1~new_date, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~new_date,col='Red')
  lines(Sub_metering_3~new_date,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

