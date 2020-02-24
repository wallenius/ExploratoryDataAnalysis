data_columns <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                  "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- read.table("./data/household_power_consumption.txt", sep = ";",
                   skip = 50000, nrows = 50000, na.strings = "?",
                   col.names = data_columns)

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, "%d/%m/%Y")

startdate <- strptime("2007-02-01", "%Y-%m-%d")
enddate <- strptime("2007-02-02", "%Y-%m-%d")


finalData <- data[!(data$Date < startdate | data$Date > enddate), ]

png("plot2.png", width = 450, height = 450)
plot(finalData$DateTime, finalData$Global_active_power, type = "l",
     xlab = "",ylab = "Global active power (kilowatts)")
dev.off()
