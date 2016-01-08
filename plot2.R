setwd("D:/Exploratory data analysis/Course Project 1/ExData_Plotting1")

Sys.setlocale("LC_TIME","English")
colNames <- names(read.table("D:/Exploratory data analysis/Course Project 1/ExData_Plotting1/household_power_consumption.txt", nrow=1,header=TRUE, sep=";"))
data <- read.table("D:/Exploratory data analysis/Course Project 1/ExData_Plotting1/household_power_consumption.txt",
                   skip=grep("1/2/2007", readLines("D:/Exploratory data analysis/Course Project 1/ExData_Plotting1/household_power_consumption.txt")),
                   nrows=2879,col.names = colNames, sep = ";", na.strings="?",
                   stringsAsFactors=FALSE) 

Date <- paste(data$Date,data$Time)
data$Date <- strptime(Date,"%d/%m/%Y %H:%M:%S")


png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
with(data, plot(Date, Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l",xlab = ""))
dev.off()
