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
new_time <- data2$Time + data2$Date

#build plot 4 and export graphic plot4.png
#png() must come before par(mfrow) in order to build subsequent
#graphs on the same graphics device.
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
# plot Global Active Power
plot(new_time, data2$Global_active_power, xlab = "", ylab = 
             "Global Active Power", type = "n")
lines(new_time, data2$Global_active_power)

# plot Voltage
plot(new_time, data2$Voltage, xlab = "datetime", ylab = 
             "Voltage", type = "n")
lines(new_time, data2$Voltage)

# plot 3x energy sub metering
plot(new_time, data2$Sub_metering_1, xlab = "", ylab = 
                "Energy sub metering", type = "n")
lines(new_time, data2$Sub_metering_1, col = "black")
lines(new_time, data2$Sub_metering_2, col = "red")
lines(new_time, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"), lty = 1, col = c("black","red","blue"),
                bty = "n")

# plot global reactive power
plot(new_time, data2$Global_reactive_power, xlab = "datetime", ylab = 
             "Global_reactive_power", type = "n")
lines(new_time, data2$Global_reactive_power)
dev.off()


