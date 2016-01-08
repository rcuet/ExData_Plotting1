setwd("D:/Exploratory data analysis/Course Project 1")

Sys.setlocale("LC_TIME","English")
colNames <- names(read.table("D:/Exploratory data analysis/Course Project 1/household_power_consumption.txt", nrow=1,header=TRUE, sep=";"))
data <- read.table("D:/Exploratory data analysis/Course Project 1/household_power_consumption.txt",
                   skip=grep("1/2/2007", readLines("D:/Exploratory data analysis/Course Project 1/household_power_consumption.txt")),
                   nrows=2879,col.names = colNames, sep = ";", na.strings="?",
                   stringsAsFactors=FALSE) 

Date <- paste(data$Date,data$Time)
data$Date <- strptime(Date,"%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()
