download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "UCI_data.zip")
unzip("UCI_data.zip")
power <- read.table("household_power_consumption.txt", na.strings = "?", stringsAsFactors = F, sep = ";", header = T)
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
power$Date[power$Date == "1/2/2007"] <- "01/02/2007"
power$Date[power$Date == "2/2/2007"] <- "02/02/2007"
power$date_time <- paste(power$Date, power$Time)
power$date_time <- strptime(power$date_time, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2), mar = c(4,4,2,1), cex = 0.5)
with(power,{
  plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex = 0.7)
  plot(date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(date_time, y = Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", cex = 0.7)
  lines(x = date_time, y = Sub_metering_2, type = "l", col = "red")
  lines(x = date_time, y = Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.7)
  plot(date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
}) 

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()