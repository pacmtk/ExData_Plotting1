# set working directory
setwd("/Users/michaelkingen/Desktop/dataplay")

#read and subset data
data<-subset(read.csv("household_power_consumption.txt", sep = ";", na.strings = "?"),
             Date == "1/2/2007" | Date == "2/2/2007")
#combine time and transform into strptime
data$dateTime <- paste(data$Date, data$Time)
data$dateTime <- strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","en_US.UTF-8")

#plot assignment
png(file = "png2.png") ## open PNG device, create plot in working directory
par(bg = "transparent") ## provide the transparent background
## plot a histogram of frequencies of GAP
plot(data$dateTime, data$Global_active_power, main = " ", xlab = " ", ylab = " ", type = "l")
##Annotate plot
title(main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() ## close PNG file device