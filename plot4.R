setwd("D:/Exploratory data analysis/Course Project 1")

Sys.setlocale("LC_TIME","English")
colNames <- names(read.table("D:/Exploratory data analysis/Course Project 1/household_power_consumption.txt", nrow=1,header=TRUE, sep=";"))
data <- read.table("D:/Exploratory data analysis/Course Project 1/household_power_consumption.txt",
                   skip=grep("1/2/2007", readLines("D:/Exploratory data analysis/Course Project 1/household_power_consumption.txt")),
                   nrows=2879,col.names = colNames, sep = ";", na.strings="?",
                   stringsAsFactors=FALSE) 

Date <- paste(data$Date,data$Time)
data$Date <- strptime(Date,"%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow=c(2,2))
with(data, plot(Date, Global_active_power, ylab = "Global Active Power", type = "l",xlab = ""))
with(data, plot(Date, Voltage, xlab = "datetime", type = "l"))
with(data, plot(Date, Sub_metering_1, ylab = "Energy sub metering",type = "l",xlab = ""))
lines(data$Date,data$Sub_metering_2, col = "red")
lines(data$Date,data$Sub_metering_3, col = "blue")
legend("topright",names(data)[7:9], lty= 1, col = c("black","red","blue"), bty = "n")
with(data, plot(Date, Global_reactive_power, xlab = "datetime", type = "l"))
dev.off()