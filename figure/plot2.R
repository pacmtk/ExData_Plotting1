# set working drive and time/language for following use of as.Date and strptime
setwd("/Users/michaelkingen/Desktop/ExploratoryDataAnalysis")
Sys.setlocale("LC_TIME", "en_US.UTF-8")
library(lubridate)

#sets the column classes for better performance on read.table of a large table.
colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", 
               "numeric", "numeric", "numeric")

#reads in the dataset into R
data0 <- read.table("household_power_consumption.txt", header = TRUE, 
                sep = ";", na.strings = "?", colClasses = colClasses, nrows = 2076000)

data1 <- subset(data0, Date == "1/2/2007" | Date == "2/2/2007")

#adjusts the date and time fields to appropriate classes
data2 <- data.frame(Date = as.Date(data1$Date, format = "%d/%m/%Y"), Time = hms(data1$Time),
                data1[,3:9])

#build plot 2 and export graphic plot2.png
png(file = "plot2.png", width = 480, height = 480)
new_time <- data2$Time + data2$Date
plot(new_time, data2$Global_active_power, xlab = "", ylab = 
                "Global Active Power (kilowatts)", type = "n")
lines(new_time, data2$Global_active_power)
dev.off()


